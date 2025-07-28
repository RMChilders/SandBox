Attribute VB_Name = "modIniFunctions"
Option Explicit
'##CD This Module standardizes ini file access

Const MODULE_NAME = "PLInvBatch.modiniFunctions"
'##VD For error handling, track which class caused the error

Declare Function GetBatchPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" _
                (ByVal lpApplicationName As String, ByVal lpKeyName As Any, _
                 ByVal lpDefault As String, ByVal lpReturnedString As String, _
                 ByVal nSize As Long, ByVal lpFileName As String) As Long


Public Function ReadBatchIniString(appName As String, section As String, Key As String, _
                             Optional default As String) As String
  
'##BD Reads ini file to get ConnectionString

  Dim iRetLen As Integer
  Dim sReturnedString As String

On Error GoTo ErrorHandler

  sReturnedString = Space$(255)
  iRetLen = GetBatchPrivateProfileString(section, Key, default, sReturnedString, 255, _
                                    App.Path & "\PLInvDB.ini")
  ReadBatchIniString = Left$(sReturnedString, iRetLen)
  
Exit Function
ErrorHandler:
  Err.Raise "12345", MODULE_NAME, "ReadBatchIniString: " & Err.Description
End Function

