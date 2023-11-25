module APB_FSM_Controller_sva(input wire Hclk,
                              input wire Hresetn,
                              input wire valid,
                              input wire Hwrite,
                              input wire [31:0] Hwdata,
                              input wire [31:0] Haddr,
                              input wire [31:0] Haddr1,
                              input wire [31:0] Haddr2,
                              input wire [31:0] Hwdata1,
                              input wire [31:0] Hwdata2,
                              input wire [31:0] Prdata,
                              input wire [2:0] tempselx,
                              input wire Hwritereg,
                              input wire Pwrite,
                              input wire Penable,
                              input wire [2:0] Pselx,
                              input wire [31:0] Paddr,
                              input wire [31:0] Pwdata,
                              input wire Hreadyout);
//PARAMETERS

parameter ST_IDLE=3'b000;
parameter ST_WWAIT=3'b001;
parameter ST_READ= 3'b010;
parameter ST_WRITE=3'b011;
parameter ST_WRITEP=3'b100;
parameter ST_RENABLE=3'b101;
parameter ST_WENABLE=3'b110;
parameter ST_WENABLEP=3'b111;

    // Assertions, assumptions and cover properties go here

endmodule

bind APB_FSM_Controller APB_FSM_Controller_sva APB_FSM_Controller_bind (
    .Hclk(Hclk),
    .Hresetn(Hresetn),
    .valid(valid),
    .Hwrite(Hwrite),
    .Hwritereg(Hwritereg),
    .Hwdata(Hwdata),
    .Haddr(Haddr),
    .Haddr1(Haddr1),
    .Haddr2(Haddr2),
    .Hwdata1(Hwdata1),
    .Hwdata2(Hwdata2),
    .Prdata(Prdata),
    .tempselx(tempselx),
    .Pwrite(Pwrite),
    .Penable(Penable),
    .Pselx(Pselx),
    .Paddr(Paddr),
    .Pwdata(Pwdata),
    .Hreadyout(Hreadyout)
);


