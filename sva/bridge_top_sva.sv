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

//For Address range 8000_0000 to 8400_0000
sequence psel_s0;
$onehot(Pselx) ##0 (Pselx[0] ##1 Pselx[0]);
endsequence

//For Address range 8400_0000 to 8800_0000
sequence psel_s1;
$onehot(Pselx) ##0 (Pselx[1] ##1 Pselx[1]);
endsequence

//For Address range 8800_0000 to 8C00_0000
sequence psel_s2;
$onehot(Pselx) ##0 (Pselx[2] ##1 Pselx[2]);
endsequence


// HRDATA should be same as PRDATA  when PENABLE(Enable cycle)
property same_HR_PR_data;
@(posedge Hclk) disable iff(!Hresetn)
Penable |-> Hrdata == Prdata;
endproperty

//PWRITE should be same as HWRITE for Read transfer
property same_HPwrite_read;         //Has issue when read after write -> Resolved
@(posedge Hclk) disable iff(!Hresetn)
!Hwrite && Hreadyin && !($past(Hwrite) && $past(Hreadyin)) |=> (Pwrite == 0);
endproperty

////PWRITE should be same as HWRITE for Write transfer
property same_HPwrite_write;        //Has issue when read after write -> Resolved
@(posedge Hclk) disable iff(!Hresetn)
write_s |=> ##1 (Pwrite == 1);
endproperty

//HREADYOUT and PENABLE should be high at end of transaction for Read transfer
property Hreadyout_penable_read;
@(posedge Hclk) disable iff(!Hresetn)
read_s |-> ##2 Penable && Hreadyout;
endproperty

//HREADYOUT and PENABLE should be high at end of transaction for Read transfer
property Hreadyout_penable_write;             
@(posedge Hclk) disable iff(!Hresetn)
write_s |-> ##3 Penable && Hreadyout;
endproperty

//PENABLE shouldn't be high for 2 cycles continously
property no_penable_2cycles;
@(posedge Hclk) disable iff(!Hresetn)
Penable |=> !Penable;
endproperty

// Valid PSEL
property valid_Psel;
@(posedge Hclk) disable iff(!Hresetn)
$onehot0(Pselx);
endproperty

// For Read transfer next cycle should have corresponding PSEL high for next 2 clocks and should be onehot
property read_addr0;
@(posedge Hclk) disable iff(!Hresetn)
read_s ##0 addr0 && !($past(Hwrite) && $past(Hreadyin)) |=>  psel_s0;
endproperty

property read_addr1;
@(posedge Hclk) disable iff(!Hresetn)
read_s ##0 addr1 && !($past(Hwrite) && $past(Hreadyin)) |=>  psel_s1;
endproperty

property read_addr2;
@(posedge Hclk) disable iff(!Hresetn)
read_s ##0 addr2 && !($past(Hwrite) && $past(Hreadyin)) |=>  psel_s2;
endproperty

// For Write transfer 2 cycles after should have corresponding PSEL high for next 2 clocks and should be onehot
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

// If a read transfer immediately follows a write, then 3 wait states are required to complete the read
property read_after_write_3waitSates;
@(posedge Hclk) disable iff(!Hresetn)
//Note: Without ##1, we are getting faliure. Even though there is no past write, assertion is being verified(No vaccous success).
##1 !Hwrite && Hreadyin && ($past(Hwrite, 1) && $past(Hreadyin, 1)) |=>  ##2 (Pwrite == 0 && Paddr == $past(Haddr, 3));
endproperty

// Should support back to back writes for 2 different addresses
property write_2_addrs;
logic [31:0] haddr;
@(posedge Hclk) disable iff(!Hresetn)
(write_s, haddr = Haddr) |=> (Hwrite && Hreadyin && Haddr != haddr);
endproperty

// Should have Read after Read in 2 cycles (Burst of reads)
property burst_of_reads;
@(posedge Hclk) disable iff(!Hresetn)
read_s |=> ##1 read_s;
endproperty

// Should have back to back writes (Burst of writes)
property burst_of_writes;
@(posedge Hclk) disable iff(!Hresetn)
write_s |=>  write_s;
endproperty

// Should have Read after Write (Back to back transfers)
property back_to_back;
@(posedge Hclk) disable iff(!Hresetn)
write_s |=>  read_s;
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

assert_read_after_write_3waitSates: assert property (read_after_write_3waitSates)
    else $display("Pwrite and Haddr for Read followed by Write transfer");

cover_write_2_addrs: cover property (write_2_addrs);

cover_burst_of_reads: cover property (burst_of_reads);

cover_burst_of_writes: cover property (burst_of_writes);

cover_back_to_back: cover property (back_to_back);

endmodule

bind Bridge_Top Bridge_Top_sva chk_bridge_top (.*);

