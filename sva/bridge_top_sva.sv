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

let possible_Pselx = ((Pselx == 0) || (Pselx == 1) || (Pselx == 2) || (Pselx == 4)); 

    // Assertions, assumptions and cover properties go here
sequence write; 
        Pwrite &&  possible_Pselx  && !Penable ##1 Pwrite && possible_Pselx && Penable;
endsequence

sequence read; 
        !Pwrite && possible_Pselx && !Penable ##1 !Pwrite && possible_Pselx && Penable;
endsequence

//read after write, Padder must be the same value for 3 cycles after write is true.
property read_after_write;
    @(posedge Hclk) disable iff(!Hresetn)
      write ##1 read  |->##1 $past(Paddr,2) == $past(Paddr);
endproperty

//checks if all items are at zero after reset
property reset_check_Paddr;
    @(posedge Hclk)
        $rose(Hresetn) |-> Paddr == 0;  
endproperty

property reset_check_Penable;
    @(posedge Hclk)
        $rose(Hresetn) |-> Penable == 0;  
endproperty

property reset_check_Pwrite;
    @(posedge Hclk)
        $rose(Hresetn) |-> Pwrite == 0;  
endproperty

property reset_check_Pwdata;
    @(posedge Hclk)
        $rose(Hresetn) |-> Pwdata == 0;  
endproperty

property reset_check_Pselx;
    @(posedge Hclk)
        $rose(Hresetn) |-> Pselx == 0;  
endproperty

//property reset_check_Prdata;
//    @(posedge Hclk)
//        $rose(Hresetn) |-> Prdata == 0;  
//endproperty

read_after_write1: assert property (read_after_write);
reset_check_haddr1: assert property (reset_check_Paddr);
reset_check_Pwrite1: assert property (reset_check_Pwrite);  
reset_check_Pwdata1: assert property (reset_check_Pwdata);  
reset_check_Pselx1: assert property (reset_check_Pselx);  
//reset_check_Prdata1: assert property (reset_check_Prdata);  
endmodule


bind Bridge_Top Bridge_Top_sva chk_bridge_top (.Hclk(Hclk), .Hresetn(Hresetn), .Hwrite(Hwrite), .Hreadyin(Hreadyin), .Hwdata(Hwdata), .Haddr(Haddr), .Htrans(Htrans), .Prdata(Prdata), .Pselx(Pselx), .Paddr(Paddr), .Pwdata(Pwdata), .Penable(Penable), .Pwrite(Pwrite), .Hreadyout(Hreadyout), .Hresp(Hresp), .Hrdata(Hrdata));

 
