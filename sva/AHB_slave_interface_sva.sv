module AHB_slave_interface_sva(input wire Hclk,
                               input wire Hresetn,
                               input wire Hwrite,
                               input wire Hreadyin,
                               input wire [1:0] Htrans,
                               input wire [31:0] Haddr,
                               input wire [31:0] Hwdata,
                               input wire [31:0] Prdata,
                               input wire valid,
                               input wire [31:0] Haddr1,
                               input wire [31:0] Haddr2,
                               input wire [31:0] Hwdata1,
                               input wire [31:0] Hwdata2,
                               input wire [31:0] Hrdata,
                               input wire Hwritereg,
                               input wire [2:0] tempselx,
                               input wire [1:0] Hresp);

    // Assertions, assumptions and cover properties go here

endmodule

bind AHB_slave_interface AHB_slave_interface_sva chk_ahb_slave_interface (.Hclk(Hclk), .Hresetn(Hresetn), .Hwrite(Hwrite), .Hreadyin(Hreadyin), .Htrans(Htrans), .Haddr(Haddr), .Hwdata(Hwdata), .Prdata(Prdata), .valid(valid), .Haddr1(Haddr1), .Haddr2(Haddr2), .Hwdata1(Hwdata1), .Hwdata2(Hwdata2), .Hrdata(Hrdata), .Hwritereg(Hwritereg), .tempselx(tempselx), .Hresp(Hresp));

