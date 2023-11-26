verdiSetActWin -dock widgetDock_<Message>
verdiWindowWorkMode -win $_Verdi_1 -formalVerification
verdiDockWidgetDisplay -dock windowDock_vcstConsole_2
srcSetPreference -vcstOpts \
           {-demo -file fpv_run_bridge.tcl -prompt vcf -fmode _default -new_verdi_comm}
verdiWindowResize -win $_Verdi_1 "64" "19" "1252" "802"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "558" "61" "1254" "804"
verdiSetActWin -win $_vcstConsole_2
debExit
