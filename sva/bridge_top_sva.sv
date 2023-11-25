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

