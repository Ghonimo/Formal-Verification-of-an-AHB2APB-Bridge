module Bridge_Top_sva(input logic Hclk,
                      input logic Hresetn,
                      input logic Hwrite,
                      input logic Hreadyin,
                      input logic [31:0] Hwdata,
                      input logic [31:0] Haddr,
                      input logic [1:0] Htrans,
                      input logic [31:0] Prdata,
                      input logic [2:0] Pselx,
                      input logic [31:0] Paddr,
                      input logic [31:0] Pwdata,
                      input logic Penable,
                      input logic Pwrite,
                      input logic Hreadyout,
                      input logic [1:0] Hresp,
                      input logic [31:0] Hrdata);

let addr0 = Haddr>=32'h8000_0000 && Haddr<32'h8400_0000;
let addr1 = Haddr>=32'h8400_0000 && Haddr<32'h8800_0000;
let addr2 = Haddr>=32'h8800_0000 && Haddr<32'h8C00_0000;

    // Assertions, assumptions and cover properties go here

//write transaction
sequence write_s;
Hwrite && Hreadyin;
endsequence

//Read transaction
sequence read_s;
!Hwrite && Hreadyin;
endsequence

sequence same_write_s;
Pwrite == Hwrite;
endsequence

sequence psel_s0;
$onehot(Pselx) ##0 (Pselx[0] ##1 Pselx[0]);
endsequence

sequence psel_s1;
$onehot(Pselx) ##0 (Pselx[1] ##1 Pselx[1]);
endsequence

sequence psel_s2;
$onehot(Pselx) ##0 (Pselx[2] ##1 Pselx[2]);
endsequence


// HRDATA should be same as PRDATA  when PENABLE(Enable cycle)
property same_HR_PR_data;
@(posedge Hclk) disable iff(!Hresetn)
Penable |-> Hrdata == Prdata;
endproperty

property same_HPwrite_read;         //Has issue when read after write
@(posedge Hclk) disable iff(!Hresetn)
read_s |=> (Pwrite == $past(Hwrite));
endproperty

property same_HPwrite_write;        //Has issue when read after write
@(posedge Hclk) disable iff(!Hresetn)
write_s |=> ##1 (Pwrite == $past(Hwrite));
endproperty

property Hreadyout_penable_read;
@(posedge Hclk) disable iff(!Hresetn)
read_s |-> ##2 Penable && Hreadyout;
endproperty

property Hreadyout_penable_write;             
@(posedge Hclk) disable iff(!Hresetn)
write_s |-> ##3 Penable && Hreadyout;
endproperty

property no_penable_2cycles;
@(posedge Hclk) disable iff(!Hresetn)
Penable |=> !Penable;
endproperty

property valid_Psel;
@(posedge Hclk) disable iff(!Hresetn)
$onehot0(Pselx);
endproperty

property read_addr0;
@(posedge Hclk) disable iff(!Hresetn)
read_s ##0 addr0 |=>  psel_s0;
endproperty

property read_addr1;
@(posedge Hclk) disable iff(!Hresetn)
read_s ##0 addr1 |=>  psel_s1;
endproperty

property read_addr2;
@(posedge Hclk) disable iff(!Hresetn)
read_s ##0 addr2 |=>  psel_s2;
endproperty

property write_addr0;                   //Has issue when read after write
@(posedge Hclk) disable iff(!Hresetn)
write_s ##0 addr0 |=>  ##1 psel_s0;
endproperty

property write_addr1;                   //Has issue when read after write
@(posedge Hclk) disable iff(!Hresetn)
write_s ##0 addr1 |=>  ##1 psel_s1;
endproperty

property write_addr2;                   //Has issue when read after write
@(posedge Hclk) disable iff(!Hresetn)
write_s ##0 addr2 |=>  ##1 psel_s2;
endproperty




assert_same_HR_PR_data: assert property (same_HR_PR_data)
    else $display("HRDATA and PRDATA are not same when penable");

assert_Hreadyout_penable_read: assert property (Hreadyout_penable_read)
    else $display("No Penable after start of read transaction");
    
assert_Hreadyout_penable_write: assert property (Hreadyout_penable_write)
    else $display("No Penable after start of write transaction");

assert_no_penable_2cycles: assert property (no_penable_2cycles)
    else $display("No Penable for 2 consecutive cycles");

assert_valid_Psel: assert property (valid_Psel)
    else $display("Psel should always be Onehot");

assert_read_addr0: assert property (read_addr0)
    else $display("Read transaction should have valid Psel");

assert_read_addr1: assert property (read_addr1)
    else $display("Read transaction should have valid Psel");

assert_read_addr2: assert property (read_addr2)
    else $display("Read transaction should have valid Psel");

assert_write_addr0: assert property (write_addr0)
    else $display("Write transaction should have valid Psel");

assert_write_addr1: assert property (write_addr1)
    else $display("Write transaction should have valid Psel");

assert_write_addr2: assert property (write_addr2)
    else $display("Write transaction should have valid Psel");

assert_same_HPwrite_read: assert property (same_HPwrite_read)
    else $display("Hwrite and Pwrite should be same for read transaction");

assert_same_HPwrite_write: assert property (same_HPwrite_write)
    else $display("Hwrite and Pwrite should be same for write transaction");

endmodule

bind Bridge_Top Bridge_Top_sva chk_bridge_top (.*);

