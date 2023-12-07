
# Select AEP as the VC Formal App mode
set_fml_appmode FPV
set design Bridge_Top

set_fml_var fml_aep_unique_name true
read_file -top $design -format sverilog -sva \
-aep all -vcs {-f ../RTL/filelist +define+INLINE_SVA \
   ../sva/bridge_top_sva.sv}
#read_waiver_file -elfiles aep.el

# Creating clock and reset signals
create_clock Hclk -period 100 
create_reset Hresetn -sense low

# Runing a reset simulation
sim_run -stable 
sim_save_reset

# No HREADY in reset state
fvassume -expr {!(!Hresetn && Hreadyin)}

# Fix HTRANS to be 2'b10 or 2'b11
fvassume -expr {(Htrans == 2'b10) || (Htrans == 2'b11)}

# Valid HWDATA in data cycle of HWRITE
fvassume -expr {@(posedge Hclk) disable iff(!Hresetn) (Hwrite |=> !$isunknown(Hwdata))}

# HADDR should be in the range of peripherals address
fvassume -expr {@(posedge Hclk) disable iff(!Hresetn) (Haddr>=32'h8000_0000 && Haddr<32'h8C00_0000)}

# when HWRITE is high HREADYIN should be high in that cycle and in following cycle 
fvassume -expr {@(posedge Hclk) disable iff(!Hresetn) (Hwrite |-> Hreadyin[*2])}

# HREADYIN is high for 2 consecutive cycles later HREADYIN shouldn't be high until there are 2 times HREADYOUT
fvassume -expr {@(posedge Hclk) disable iff(!Hresetn) (Hreadyin ##1 Hreadyin |=> (!Hreadyin throughout Hreadyout[->2]))}

# For Read transaction HREADYIN shouldn't be high sencond until HREADYOUT of 1st read is high (added for Hreadyout_penable_read)
fvassume -expr {@(posedge Hclk) disable iff(!Hresetn) (Hreadyin && !Hwrite |=> (!Hreadyin until Hreadyout))}  




