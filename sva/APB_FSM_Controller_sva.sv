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
                              input wire Hreadyout,
                              input wire [2:0] PRESENT_STATE,
                              input wire [2:0] NEXT_STATE);
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

// Property to verify that PRESENT_STATE becomes NEXT_STATE one cycle later
property p_state_transition;
    @(posedge Hclk) disable iff (!Hresetn) 1 |-> ##2 PRESENT_STATE == $past(NEXT_STATE);
endproperty
assert_state_transition: assert property (p_state_transition);



// Transition from ST_IDLE
property p_IDLE_to_WWAIT;
    @(posedge Hclk) disable iff (!Hresetn) 
    (PRESENT_STATE == ST_IDLE && valid && Hwrite) |-> (NEXT_STATE == ST_WWAIT);
endproperty
assert_IDLE_to_WWAIT: assert property (p_IDLE_to_WWAIT);

property p_IDLE_to_READ;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_IDLE && valid && !Hwrite |-> NEXT_STATE == ST_READ;
endproperty
assert_IDLE_to_READ: assert property (p_IDLE_to_READ);

property p_IDLE_to_IDLE;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_IDLE && !valid |-> NEXT_STATE == ST_IDLE;
endproperty
assert_IDLE_to_IDL: assert property (p_IDLE_to_IDLE);
///////////////////////////

// Transition from ST_WWAIT
property p_WWAIT_to_WRITE;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WWAIT && !valid |-> NEXT_STATE == ST_WRITE;
endproperty
assert_WWAIT_to_WRITE: assert property (p_WWAIT_to_WRITE);

property p_WWAIT_to_WRITEP;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WWAIT && valid |-> NEXT_STATE == ST_WRITEP;
endproperty
assert_WWAIT_to_WRITEP: assert property (p_WWAIT_to_WRITEP);
///////////////////////////

// Transition from ST_READ
property p_READ_to_RENABLE;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_READ |-> NEXT_STATE == ST_RENABLE;
endproperty
assert_READ_to_RENABLE: assert property (p_READ_to_RENABLE);
///////////////////////////

// Transition from ST_WRITE
property p_WRITE_to_WENABLE;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WRITE && !valid |-> NEXT_STATE == ST_WENABLE;
endproperty
assert_WRITE_to_WENABLE: assert property (p_WRITE_to_WENABLE);

property p_WRITE_to_WENABLEP;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WRITE && valid |-> NEXT_STATE == ST_WENABLEP;
endproperty
assert_WRITE_to_WENABLEP: assert property (p_WRITE_to_WENABLEP);
///////////////////////////

// Transition from ST_WRITEP
property p_WRITEP_to_WENABLEP;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WRITEP |-> NEXT_STATE == ST_WENABLEP;
endproperty
assert_WRITEP_to_WENABLEP: assert property (p_WRITEP_to_WENABLEP);
///////////////////////////

// Transitions from ST_RENABLE
property p_RENABLE_to_IDLE;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_RENABLE && !valid |-> NEXT_STATE == ST_IDLE;
endproperty
assert_RENABLE_to_IDLE: assert property (p_RENABLE_to_IDLE);

property p_RENABLE_to_WWAIT;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_RENABLE && valid && Hwrite |-> NEXT_STATE == ST_WWAIT;
endproperty
assert_RENABLE_to_WWAIT: assert property (p_RENABLE_to_WWAIT);

property p_RENABLE_to_READ;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_RENABLE && valid && !Hwrite |-> NEXT_STATE == ST_READ;
endproperty
assert_RENABLE_to_READ: assert property (p_RENABLE_to_READ);
///////////////////////////

// Transitions from ST_WENABLE
property p_WENABLE_to_IDLE;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WENABLE && !valid |-> NEXT_STATE == ST_IDLE;
endproperty
assert_WENABLE_to_IDLE: assert property (p_WENABLE_to_IDLE);

property p_WENABLE_to_WWAIT;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WENABLE && valid && Hwrite |-> NEXT_STATE == ST_WWAIT;
endproperty
assert_WENABLE_to_WWAIT: assert property (p_WENABLE_to_WWAIT);

property p_WENABLE_to_READ;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WENABLE && valid && !Hwrite |-> NEXT_STATE == ST_READ;
endproperty
assert_WENABLE_to_READ: assert property (p_WENABLE_to_READ);
///////////////////////////

// Transitions from ST_WENABLEP
property p_WENABLEP_to_WRITE;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WENABLEP && !valid && Hwritereg |-> NEXT_STATE == ST_WRITE;
endproperty
assert_WENABLEP_to_WRITE: assert property (p_WENABLEP_to_WRITE);

property p_WENABLEP_to_WRITEP;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WENABLEP && valid && Hwritereg |-> NEXT_STATE == ST_WRITEP;
endproperty
assert_WENABLEP_to_WRITEP: assert property (p_WENABLEP_to_WRITEP);

property p_WENABLEP_to_READ;
    @(posedge Hclk) disable iff (!Hresetn) PRESENT_STATE == ST_WENABLEP && !Hwritereg |-> NEXT_STATE == ST_READ;
endproperty
assert_WENABLEP_to_READ: assert property (p_WENABLEP_to_READ);


endmodule

bind APB_FSM_Controller APB_FSM_Controller_sva APB_FSM_Controller_chk(.*);


