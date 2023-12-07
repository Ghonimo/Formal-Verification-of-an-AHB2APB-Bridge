#!/bin/csh -f
setenv VCS_HOME /pkgs/synopsys/current/vc_static/vcs-mx
setenv VC_STATIC_HOME /pkgs/synopsys/current/vc_static
setenv SYNOPSYS_SIM_SETUP /u/phanin2/ABV/Project/560_FinalProject/run/vcst_rtdb/.internal/design/synopsys_sim.setup

$VCS_HOME/bin/vcs /u/phanin2/ABV/Project/560_FinalProject/run/vcst_rtdb/.internal/design/undef_vcs.v -file /u/phanin2/ABV/Project/560_FinalProject/run/vcst_rtdb/.internal/design/vcsCmd -Xvcstatic_extns=0x100  +warn=noSM_CCE  -kdb=common_elab  -Xufe=parallel:incrdump  +warn=noKDB-ELAB-E  +warn=noELW_UNBOUND  -Xverdi_elab_opts=-saveLevel  -verdi_opts "-logdir /u/phanin2/ABV/Project/560_FinalProject/run/vcst_rtdb/verdi/elabcomLog " -Xvd_opts=-silent,-ssy,-ssv,-ssz,+disable_message+C00373, -full64
