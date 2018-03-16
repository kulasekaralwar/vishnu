#SingleInstance, Force
#NoEnv
#NoTrayIcon

#Include %A_ScriptDir%\ADOSQL.ahk
;~ connectionString := "Provider=SQLOLEDB.1;Password=SwiftArms;Persist Security Info=True;User ID=swiftarms;Initial Catalog=AGFA_UAT;Data Source=sinazedev08;"
connectionString := "Provider=SQLOLEDB.1;Password=SwiftArms;Persist Security Info=True;User ID=swiftarms;Initial Catalog=RAC_Angular;Data Source=WusAzeDev03;"
;ColDelim=|
;RowDelim=|
;~ query := "update tblAccountEventStatus set CustomeField5=1 where UpdatedDate in (SELECT TOP 1 UpdatedDate FROM tblAccountEventStatus WHERE AccountID=159848 and activeflag=1 ORDER BY UpdatedDate DESC)"
;~ query := "select top 5  AES.AccountID,  AES.StatusDescription from tblAccountEventStatus AES join tblaccounthdr AH on AES.AccountID=AH.AccountID  where AES.CustomeField5 is null and AES.activeflag=1 and AES.CreatedDate in (SELECT max(CreatedDate) as CreatedDate  FROM tblAccountEventStatus where CustomeField5 is null and activeflag=1 and CreatedDate is not null group by AccountID)"

query := "select top 4 EmpId,FirstName,LastName,Salary from employee"





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
Gui, Add, ListView, x3 y35 w588 r9 vguiTasksList hwndLV1 LV0x10 NoSortHdr Grid Checked,
Gui, Add, StatusBar
Gui, Show, w588 h253, ATPCO AUTOMATION V3.0

LV_InsertCol(1,  0048, "EmpId")
LV_InsertCol(2,  0180, "FirstName")
LV_InsertCol(3,  0180, "LastName")
LV_InsertCol(4,  0180, "Salary")

LV_Delete()
objReturn := ADOSQL(connectionString, query, ColumnArray, columnCount)
   MsgBox, % objReturn.MaxIndex()
      ;~ MsgBox, % objReturn
for index, element in ColumnArray 
{
  MsgBox, % Test index
 Loop, % objReturn.MaxIndex()
 {
   Value := objReturn[A_Index,index]
   If(element <> Value)
   {
     MsgBox, %element% :%Value% |
   }
 }
}

for key, obj in objReturn
LV_Add("" 
, obj[1]
, obj[2]
, obj[3]
, obj[4])
  
;~ accountsBall := ObjLoad(A_ScriptDir . "\ATPCO-GoldProcessFusion.dat" )