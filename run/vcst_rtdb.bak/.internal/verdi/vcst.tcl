## VerdiPlay
source ./verdi_vcst.tcl
verdiVcstResizeTopWin
verdiDockWidgetSetCurTab -dock windowDock_vcstConsole_2
::vcst::creatInstAction
::vcst::createAnalyzerAction
::vcst::creatResetLayoutAction
::vcst::creatAssertAnalyzerAction
set ::vcst::EnableUDWin 0
qwConfig -type nWave -cmds [list {qwAddToolBarGroup -group "UDWinGroup"} {qwAddToolBarGroup -group "AssertAnalyzer"}]
srcSetOptions -lockActView on
::vcst::createAddTraceToWaveAction
source /home/ghonim/Synopsys/installed/vc_static/U-2023.03-SP2-1/auxx/monet/tcl/menu.tcl

verdiWindowPrependTitle -win $_nTrace1 -preTitle {}
set ::vcst::_compositeTrace {1}
verdiVcstSyncMsgColor -errorColor "default_red" -warningColor "default_none" -infoColor "default_none"
verdiSetRCValue -section appSetting -key font -value {Bitstream Vera Sans(11)};
verdiSetPrefEnv -monoFontSize "11"
setStyleFvProgress -css {font-family:Bitstream Vera Sans monospace;font-size:11px}
setStyleFvGoalProgress -css {font-family:Bitstream Vera Sans monospace;font-size:11px}
verdiSetFont -font "Bitstream Vera Sans" -size "11"
verdiVcstOnPropSelectionChanged -strNum 0 -propList {}
verdiDockWidgetSetCurTab -dock widgetDock_VCF:GoalList
viaLogViewerLoadVcstConsoleLogRc; set vcstMasterSourceDone 1
verdiDockWidgetSetCurTab -dock widgetDock_VCF:TaskList
verdiVcstSetAppmode -mode FPV -fromVcst
verdiVcstChangeGoalListTabName -tabName VCF:GoalList
vcstRunCovCmd -async {gui_vcst_set_parameters -status_msg { _EnableMedHighEffort_0}}
verdiVcstChangeGoalListTabName -tabName VCF:GoalList
set ::vcst::_fml_max_proof_depth {-1};set ::vcst::_fml_max_time {12H};catch {verdiVcstOnFmlVarChanged -key {fml_effort} -value {default}}
vcstRunCovCmd -async {gui_vcst_set_parameters -status_msg { _EnableMedHighEffort_0}}
verdiVcstChangeGoalListTabName -tabName VCF:GoalList
schSetPreference -displayAbstractSrc off 
vcstRunCovCmd -async {gui_vcst_set_parameters -status_msg { _EnableMedHighEffort_0}}
verdiVcstSetErrorIdentifier
