
# Select AEP as the VC Formal App mode
set_fml_appmode FPV
set design AHB_slave_interface

set_fml_var fml_aep_unique_name true
read_file -top $design -format sverilog -sva \
-aep all -vcs {../RTL/AHB_Slave_Interface.v +define+INLINE_SVA \
   ../sva/AHB_slave_interface_sva.sv}
#read_waiver_file -elfiles aep.el

# Creating clock and reset signals
create_clock Hclk -period 100 
create_reset Hresetn -sense low

# Runing a reset simulation
sim_run -stable 
sim_save_reset
