#SingleInstance, Force
#NoEnv
#NoTrayIcon

d1 := 320
d2 := 640
d3 := 960
d4 := 1600
passwordStatus := false

processDDL=
(Join|
Select Process|
01-ZeroFare - Today's Date
02-ZeroFare - Tomorrow's Date
)
;~ Adding Controls to GUI
Gui, Add, Checkbox, x9 y9 vCheckAll, All
Gui, Add, DropDownList, x51 y5 w204 vguiProcess, % processDDL
;~ Gui, Add, Button, x263 y4 Default gGO, Go
;~Gui, Add, Text, x325 y9 w103 h13 , XRS/ZF Delay in ms :
;~Gui, Add, ComboBox, x432 y6 w64 vguiLoadDelay  , 0|1000|2000||3000|5000|10000|20000
;~Gui, Add, ListView, x3 y35 w648 r9 vguiTasksList hwndLV1 LV0x10 NoSortHdr Grid Checked gSELECT_ROW_1,
Gui, Add, ListView, x3 y35 w648 r9 vguiTasksList hwndLV1 LV0x10 NoSortHdr Grid Checked,
Gui, Add, StatusBar
Gui, Show, w330 h253, ATPCO AUTOMATION V3.0
;~ gosub SCHEDULE_TASK


;~ TASKS_SELECT:
;~ {
;~ GuiControlGet, cAll, ,CheckAll
;~ MsgBox, 4160, %A_LineNumber% Info ... , %cAll%, 3.2
;~ Gui, 1:Submit , NoHide
;~ Gui, 1:ListView , guiListAccounts
;~ Loop, % LV_GetCount()
;~ LV_Modify( A_Index , "Icon" . 1 )
;~ if CheckAll
;~ {
;~ LV_Modify(0,  "Check" )
;~ }
;~ else
;~ {
;~ LV_Modify( 0, "-Check" )
;~ }
;~ return
;~ }