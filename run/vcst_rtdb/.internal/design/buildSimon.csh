#!/bin/csh -f
setenv VCS_HOME /home/ghonim/Synopsys/installed/vc_static/U-2023.03-SP2-1/vcs-mx
setenv VC_STATIC_HOME /home/ghonim/Synopsys/installed/vc_static/U-2023.03-SP2-1
setenv SYNOPSYS_SIM_SETUP /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/synopsys_sim.setup

$VCS_HOME/bin/vcs /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/undef_vcs.v -file /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/vcsCmd -Xvcstatic_extns=0x100  +warn=noSM_CCE  -kdb=common_elab  -Xufe=parallel:incrdump  +warn=noKDB-ELAB-E  +warn=noELW_UNBOUND  -Xverdi_elab_opts=-saveLevel  -verdi_opts "-logdir /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/verdi/elabcomLog " -Xvd_opts=-silent,-ssy,-ssv,-ssz,+disable_message+C00373, -full64
