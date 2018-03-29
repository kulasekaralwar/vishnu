#Include %A_ScriptDir%\ADOSQL.ahk
connectionString := "Provider=SQLOLEDB.1;Password=SwiftArms;Persist Security Info=True;User ID=swiftarms;Initial Catalog=AGFA_UAT;Data Source=sinazedev08;"
;ColDelim=|
;RowDelim=|
;~ query := "update tblAccountEventStatus set CustomeField5=1 where UpdatedDate in (SELECT TOP 1 UpdatedDate FROM tblAccountEventStatus WHERE AccountID=159848 and activeflag=1 ORDER BY UpdatedDate DESC)"
query := "select top 5  AES.AccountID,  AES.StatusDescription from tblAccountEventStatus AES join tblaccounthdr AH on AES.AccountID=AH.AccountID  where AES.CustomeField5 is null and AES.activeflag=1 and AES.CreatedDate in (SELECT max(CreatedDate) as CreatedDate  FROM tblAccountEventStatus where CustomeField5 is null and activeflag=1 and CreatedDate is not null group by AccountID)"
objReturn := ADOSQL(connectionString, query, ColumnArray)
   MsgBox, % ColumnArray
      MsgBox, % objReturn
for index, element in ColumnArray 
{
 Loop, % objReturn.MaxIndex()
 {
   Value := objReturn[A_Index,index]
   If(element <> Value)
   {
     MsgBox, %element% :%Value% |
   }
 }
}
