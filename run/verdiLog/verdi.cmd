verdiSetActWin -dock widgetDock_<Decl._Tree>
verdiWindowWorkMode -win $_Verdi_1 -formalVerification
verdiDockWidgetDisplay -dock windowDock_vcstConsole_2
srcSetPreference -vcstOpts \
           {-demo -file fpv_run_apb_controller.tcl -prompt vcf -fmode _default -new_verdi_comm}
verdiWindowResize -win $_Verdi_1 "50" "0" "1250" "800"
verdiWindowResize -win $_Verdi_1 "135" "165" "1250" "800"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "802"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
verdiSetActWin -win $_vcstConsole_2
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
schSetVCSTDelimiter -VHDLGenDelim "."
schUnifiedNetList
verdiSetPrefEnv -bSpecifyWindowTitleForDockContainer "off"
paSetPreference -brightenPowerColor on
paSetPreference -AnnotateSignal off -brightenPowerColor on
paSetPreference -AnnotateSignal off -highlightPowerObject off -brightenPowerColor \
           on
schSetVCSTDelimiter -hierDelim "."
srcSetXpropOption "tmerge"
wvSetPreference -overwrite off
wvSetPreference -getAllSignal off
simSetSimulator "-vcssv" -exec \
           "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv" \
           -args
debImport "-simflow" "-smart_load_kdb" "-dbdir" \
          "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv.daidir" \
          -autoalias
srcSetPreference -tabNum 16
debLoadUserDefinedFile \
           /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/verdi/constant.uddb
srcSetOptions -userAnnot on -win $_nTrace1 -field 2
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs clear=\"true\"/>
</Command>
"
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs>
<H_Nets>
<H_Net name=\"APB_FSM_Controller/Hresetn\" text=\"C:1\" color=\"2\"/>
</H_Nets>
</HighlightObjs>
</Command>
"
verdiRunVcstCmd check_fv

verdiSetActWin -dock widgetDock_VCF:GoalList
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
schSetVCSTDelimiter -VHDLGenDelim "."
schUnifiedNetList
schSetVCSTDelimiter -hierDelim "."
srcSetXpropOption "tmerge"
wvSetPreference -overwrite off
wvSetPreference -getAllSignal off
simSetSimulator "-vcssv" -exec \
           "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv" \
           -args
debImport "-simflow" "-smart_load_kdb" "-dbdir" \
          "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv.daidir" \
          -autoalias
srcSetPreference -tabNum 16
debLoadUserDefinedFile \
           /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/verdi/constant.uddb
srcSetOptions -userAnnot on -win $_nTrace1 -field 2
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs clear=\"true\"/>
</Command>
"
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs>
<H_Nets>
<H_Net name=\"APB_FSM_Controller/Hresetn\" text=\"C:1\" color=\"2\"/>
</H_Nets>
</HighlightObjs>
</Command>
"
verdiRunVcstCmd check_fv

verdiSetActWin -dock widgetDock_VCF:GoalList
verdiRunVcstCmd view_trace -property \
           {APB_FSM_Controller.APB_FSM_Controller_bind.assert_IDLE_to_READ} \
           -composite

wvCreateWindow
srcSetPreference -annotate on
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/formal/fpId0/trace_1.xml.replay.fsdb.vf}
wvCloseFile -win $_nWave3
wvGetSignalClose -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/formal/fpId0/trace_1.xml.replay.fsdb.vf}
verdiDockWidgetHide -dock widgetDock_Analyzer
verdiDockWidgetHide -dock widgetDock_Analyzer
wvSelectSignal -win $_nWave3 {( "SOURCE-Property" 1 )}
wvAddGroup -win $_nWave3 SOURCE-Property
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("SOURCE-Property" 0)}
wvAddSignal -win $_nWave3 \
           "/APB_FSM_Controller/APB_FSM_Controller_bind/assert_IDLE_to_READ"
wvSetPosition -win $_nWave3 {("SOURCE-Property" 0)}
wvSetPosition -win $_nWave3 {("SOURCE-Property" 1)}
wvSetPosition -win $_nWave3 {("SOURCE-Property" 1)}
wvAddGroup -win $_nWave3 Support-Signals
wvSetPosition -win $_nWave3 {("SOURCE-Property" 1)}
wvSetPosition -win $_nWave3 {("Support-Signals" 0)}
wvAddSignal -win $_nWave3 \
           "/APB_FSM_Controller/APB_FSM_Controller_bind/PRESENT_STATE\[2:0\]" \
           "/APB_FSM_Controller/APB_FSM_Controller_bind/valid" \
           "/APB_FSM_Controller/APB_FSM_Controller_bind/Hwrite" \
           "/APB_FSM_Controller/APB_FSM_Controller_bind/NEXT_STATE\[2:0\]" \
           "/APB_FSM_Controller/APB_FSM_Controller_bind/Hclk" \
           "/APB_FSM_Controller/APB_FSM_Controller_bind/Hresetn"
wvSetPosition -win $_nWave3 {("Support-Signals" 0)}
wvSetPosition -win $_nWave3 {("Support-Signals" 6)}
wvAddGroup -win $_nWave3 Undriven
wvSetPosition -win $_nWave3 {("Support-Signals" 6)}
wvSetPosition -win $_nWave3 {("Undriven" 0)}
wvSetPosition -win $_nWave3 {("Undriven" 0)}
wvSetPosition -win $_nWave3 {("Undriven/Undriven/Snipped Signals" 0)}
wvAddSignal -win $_nWave3 \
           "/APB_FSM_Controller/APB_FSM_Controller_bind/NEXT_STATE\[2:0\]" \
           "/APB_FSM_Controller/APB_FSM_Controller_bind/PRESENT_STATE\[2:0\]"
wvSetPosition -win $_nWave3 {("Undriven/Undriven/Snipped Signals" 0)}
wvSetPosition -win $_nWave3 {("Undriven/Undriven/Snipped Signals" 2)}
wvSetPosition -win $_nWave3 {("Undriven/Undriven/Snipped Signals" 0)}
wvCollapseGroup -win $_nWave3 "Undriven/Snipped Signals"
wvChangeDisplayAttr -win $_nWave3 -c ID_RED6
wvChangeDisplayAttr -win $_nWave3 -c ID_RED6
wvSetPosition -win $_nWave3 {("Undriven/Undriven/Snipped Signals" 0)}
wvChangeDisplayAttr -win $_nWave3 -c ID_RED6
wvChangeDisplayAttr -win $_nWave3 -c ID_RED6
wvSetPosition -win $_nWave3 {("Undriven/Undriven/Snipped Signals" 0)}
wvGoToGroup -win $_nWave3 "SOURCE-Property"
wvSetPosition -win $_nWave3 {("Support-Signals" 6)}
wvSetPosition -win $_nWave3 {("Support-Signals" 6)}
wvSetMarker -win $_nWave3 -name "Rst-End" 100.000 ID_PURPLE5 line_solid
wvAddCompressTimeRange -win $_nWave3 0.000000 100.000000
wvExpandCompressTimeRange -win $_nWave3 0 100 left
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("Undriven" 0)}
wvSetPosition -win $_nWave3 {("Support-Signals" 6)}
srcShowDefine -incrSearch \
           APB_FSM_Controller.APB_FSM_Controller_bind.assert_IDLE_to_READ
wvZoomAll -win $_nWave3
verdiSetActWin -win $_nWave3
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
verdiSetActWin -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvSelectSignal -win $_nWave3 {( "Support-Signals" 4 )} 
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectSignal -win $_nWave3 {( "Support-Signals" 1 )} 
wvSelectSignal -win $_nWave3 {( "Support-Signals" 4 )} 
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
verdiDockWidgetSetCurTab -dock widgetDock_VCF:GoalList
verdiDockWidgetSetCurTab -dock widgetDock_VCF:TaskList
verdiSetActWin -win $_vcstConsole_2
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
verdiSetActWin -win $_vcstConsole_2
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
verdiSetActWin -win $_vcstConsole_2
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
verdiSetActWin -win $_vcstConsole_2
set vgifActionLineNum 192
set vgifActionWindow $_vcstConsole_2
set vgifActionTabIndex 7
set vgifActionLineStr {  'ROOT.APB_FSM_Controller.APB_FSM_Controller_bind'}
set vgifActionFileName {/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/verdiLog/vcst_novas_sim_localhost.ghonim_15829.log}

namespace eval ::vgif {
variable hierName {ROOT.APB_FSM_Controller.APB_FSM_Controller_bind};
::vcst::probeHierRef "$hierName"
}
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
schSetVCSTDelimiter -VHDLGenDelim "."
schUnifiedNetList
schSetVCSTDelimiter -hierDelim "."
srcSetXpropOption "tmerge"
wvSetPreference -overwrite off
wvSetPreference -getAllSignal off
simSetSimulator "-vcssv" -exec \
           "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv" \
           -args
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
debImport "-simflow" "-smart_load_kdb" "-dbdir" \
          "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv.daidir" \
          -autoalias
srcSetPreference -tabNum 16
debLoadUserDefinedFile \
           /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/verdi/constant.uddb
srcSetOptions -userAnnot on -win $_nTrace1 -field 2
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs clear=\"true\"/>
</Command>
"
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs>
<H_Nets>
<H_Net name=\"APB_FSM_Controller/Hresetn\" text=\"C:1\" color=\"2\"/>
</H_Nets>
</HighlightObjs>
</Command>
"
verdiRunVcstCmd check_fv

verdiSetActWin -dock widgetDock_VCF:GoalList
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
schSetVCSTDelimiter -VHDLGenDelim "."
schUnifiedNetList
schSetVCSTDelimiter -hierDelim "."
srcSetXpropOption "tmerge"
wvSetPreference -overwrite off
wvSetPreference -getAllSignal off
simSetSimulator "-vcssv" -exec \
           "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv" \
           -args
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
debImport "-simflow" "-smart_load_kdb" "-dbdir" \
          "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv.daidir" \
          -autoalias
srcSetPreference -tabNum 16
verdiRunVcstCmd check_fv

debLoadUserDefinedFile \
           /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/verdi/constant.uddb
srcSetOptions -userAnnot on -win $_nTrace1 -field 2
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs clear=\"true\"/>
</Command>
"
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs>
<H_Nets>
<H_Net name=\"APB_FSM_Controller/Hresetn\" text=\"C:1\" color=\"2\"/>
</H_Nets>
</HighlightObjs>
</Command>
"
verdiSetActWin -dock widgetDock_VCF:GoalList
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
verdiSetActWin -win $_vcstConsole_2
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
verdiSetActWin -win $_vcstConsole_2
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
verdiSetActWin -win $_vcstConsole_2
verdiSetActWin -dock widgetDock_VCF:GoalList
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
verdiSetActWin -win $_vcstConsole_2
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
schSetVCSTDelimiter -VHDLGenDelim "."
schUnifiedNetList
schSetVCSTDelimiter -hierDelim "."
srcSetXpropOption "tmerge"
wvSetPreference -overwrite off
wvSetPreference -getAllSignal off
simSetSimulator "-vcssv" -exec \
           "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv" \
           -args
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
debImport "-simflow" "-smart_load_kdb" "-dbdir" \
          "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv.daidir" \
          -autoalias
srcSetPreference -tabNum 16
debLoadUserDefinedFile \
           /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/verdi/constant.uddb
srcSetOptions -userAnnot on -win $_nTrace1 -field 2
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs clear=\"true\"/>
</Command>
"
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs>
<H_Nets>
<H_Net name=\"APB_FSM_Controller/Hresetn\" text=\"C:1\" color=\"2\"/>
</H_Nets>
</HighlightObjs>
</Command>
"
verdiRunVcstCmd check_fv

verdiSetActWin -dock widgetDock_VCF:GoalList
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
verdiSetActWin -win $_vcstConsole_2
schSetVCSTDelimiter -VHDLGenDelim "."
schUnifiedNetList
schSetVCSTDelimiter -hierDelim "."
srcSetXpropOption "tmerge"
wvSetPreference -overwrite off
wvSetPreference -getAllSignal off
simSetSimulator "-vcssv" -exec \
           "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv" \
           -args
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
debImport "-simflow" "-smart_load_kdb" "-dbdir" \
          "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv.daidir" \
          -autoalias
srcSetPreference -tabNum 16
debLoadUserDefinedFile \
           /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/verdi/constant.uddb
srcSetOptions -userAnnot on -win $_nTrace1 -field 2
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs clear=\"true\"/>
</Command>
"
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs>
<H_Nets>
<H_Net name=\"APB_FSM_Controller/Hresetn\" text=\"C:1\" color=\"2\"/>
</H_Nets>
</HighlightObjs>
</Command>
"
verdiRunVcstCmd check_fv

verdiSetActWin -dock widgetDock_VCF:GoalList
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "890"
schSetVCSTDelimiter -VHDLGenDelim "."
schUnifiedNetList
schSetVCSTDelimiter -hierDelim "."
srcSetXpropOption "tmerge"
wvSetPreference -overwrite off
wvSetPreference -getAllSignal off
simSetSimulator "-vcssv" -exec \
           "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv" \
           -args
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
debImport "-simflow" "-smart_load_kdb" "-dbdir" \
          "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv.daidir" \
          -autoalias
srcSetPreference -tabNum 16
debLoadUserDefinedFile \
           /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/verdi/constant.uddb
srcSetOptions -userAnnot on -win $_nTrace1 -field 2
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs clear=\"true\"/>
</Command>
"
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs>
<H_Nets>
<H_Net name=\"APB_FSM_Controller/Hresetn\" text=\"C:1\" color=\"2\"/>
</H_Nets>
</HighlightObjs>
</Command>
"
verdiRunVcstCmd check_fv

verdiSetActWin -dock widgetDock_VCF:GoalList
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "709" "181" "1252" "964"
verdiSetActWin -dock widgetDock_VCF:GoalList
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
verdiWindowSaveUserLayout -win $_Verdi_1 "UserRestart_1"
verdiVcstRestartShellApp
verdiSetActWin -dock widgetDock_VCF:TaskList
verdiWindowRestoreUserLayout -win $_Verdi_1 "UserRestart_1"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "1038"
schSetVCSTDelimiter -VHDLGenDelim "."
schUnifiedNetList
schSetVCSTDelimiter -hierDelim "."
srcSetXpropOption "tmerge"
wvSetPreference -overwrite off
wvSetPreference -getAllSignal off
simSetSimulator "-vcssv" -exec \
           "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv" \
           -args
assCtrlClose -eval
assCtrlClose -statistic
assCtrlClose -analyzer
debImport "-simflow" "-smart_load_kdb" "-dbdir" \
          "/home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/design/simv.daidir" \
          -autoalias
srcSetPreference -tabNum 16
debLoadUserDefinedFile \
           /home/ghonim/Fall_2023/ECE560/project/560_FinalProject/run/vcst_rtdb/.internal/verdi/constant.uddb
srcSetOptions -userAnnot on -win $_nTrace1 -field 2
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs clear=\"true\"/>
</Command>
"
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs>
<H_Nets>
<H_Net name=\"APB_FSM_Controller/Hresetn\" text=\"C:1\" color=\"2\"/>
</H_Nets>
</HighlightObjs>
</Command>
"
verdiRunVcstCmd check_fv

verdiSetActWin -dock widgetDock_VCF:GoalList
