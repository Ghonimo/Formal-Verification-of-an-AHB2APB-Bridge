module Bridge_Top_sva(input wire Hclk,
                      input wire Hresetn,
                      input wire Hwrite,
                      input wire Hreadyin,
                      input wire [31:0] Hwdata,
                      input wire [31:0] Haddr,
                      input wire [1:0] Htrans,
                      input wire [31:0] Prdata,
                      input wire [2:0] Pselx,
                      input wire [31:0] Paddr,
                      input wire [31:0] Pwdata,
                      input wire Penable,
                      input wire Pwrite,
                      input wire Hreadyout,
                      input wire [1:0] Hresp,
                      input wire [31:0] Hrdata);

    // Assertions, assumptions and cover properties go here

endmodule

bind Bridge_Top Bridge_Top_sva chk_bridge_top (.Hclk(Hclk), .Hresetn(Hresetn), .Hwrite(Hwrite), .Hreadyin(Hreadyin), .Hwdata(Hwdata), .Haddr(Haddr), .Htrans(Htrans), .Prdata(Prdata), .Pselx(Pselx), .Paddr(Paddr), .Pwdata(Pwdata), .Penable(Penable), .Pwrite(Pwrite), .Hreadyout(Hreadyout), .Hresp(Hresp), .Hrdata(Hrdata));

//write transaction
sequence write_s;
Hwrite && Hreadyin
endsequence

//Read transaction
sequence read_s;
!Hwrite && Hreadyin
endsequence

sequence same_write_s;
Pwrite == Hwrite;
endsequence

sequence psel_s0;
$onehot(Pselx) && (Pselx[0] ##1 Pselx[0]);
endsequence


// HRDATA should be same as PRDATA  when PENABLE(Enable cycle)
property same_HR_PR_data;
@(posedge clk) disable iff(!rst_b)
Penable |-> Hrdata == Prdata;
endproperty

property penable_read;
@(posedge clk) disable iff(!rst_b)
read_s |-> ##2 Penable
endproperty

property penable_write;
@(posedge clk) disable iff(!rst_b)
write_s |-> ##3 Penable
endproperty

// property ;
// @(posedge clk) disable iff(!rst_b)
// read_s
// endproperty

property no_penable_2cycles;
@(posedge clk) disable iff(!rst_b)
Penable |=> !Penable;
endproperty

// property ;
// @(posedge clk) disable iff(!rst_b)

// endproperty

property valid_Psel;
@(posedge clk) disable iff(!rst_b)
$onehot0(Pselx);
endproperty

// property ;
// @(posedge clk) disable iff(!rst_b)

// endproperty



assert_same_HR_PR_data: assert property (same_HR_PR_data)
    else $display("HRDATA and PRDATA are not same when penable");