
# Select AEP as the VC Formal App mode
set_fml_appmode FPV
set design APB_FSM_Controller

set_fml_var fml_aep_unique_name true
read_file -top $design -format sverilog -sva \
-aep all -vcs {../RTL/APB_Controller.v +define+INLINE_SVA \
   ../sva/APB_FSM_Controller_sva.sv}
#read_waiver_file -elfiles aep.el

# Creating clock and reset signals
create_clock Hclk -period 100 
create_reset Hresetn -sense low

# Runing a reset simulation
sim_run -stable 
sim_save_reset
