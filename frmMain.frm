VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Invoice Nightly Batch Program"
   ClientHeight    =   6450
   ClientLeft      =   30
   ClientTop       =   330
   ClientWidth     =   7320
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6450
   ScaleWidth      =   7320
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtPostProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   3000
      TabIndex        =   29
      Text            =   "txtPP"
      Top             =   3720
      Width           =   492
   End
   Begin VB.TextBox txtCallDetail 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   3000
      TabIndex        =   25
      Text            =   "txtB8"
      Top             =   3000
      Width           =   492
   End
   Begin MSComctlLib.ProgressBar pbProcess 
      Height          =   375
      Left            =   2880
      TabIndex        =   6
      Top             =   5040
      Width           =   4155
      _ExtentX        =   7329
      _ExtentY        =   661
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   5
      Top             =   6075
      Width           =   7320
      _ExtentX        =   12912
      _ExtentY        =   661
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   1200
      Top             =   4080
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   495
      Left            =   1680
      TabIndex        =   0
      Top             =   4080
      Width           =   972
   End
   Begin MSComctlLib.ProgressBar pGLLink 
      Height          =   375
      Left            =   2880
      TabIndex        =   16
      Top             =   5640
      Visible         =   0   'False
      Width           =   4155
      _ExtentX        =   7329
      _ExtentY        =   661
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.Frame Frame1 
      Caption         =   "Process Nightly Invoices"
      Height          =   4575
      Left            =   2880
      TabIndex        =   1
      Top             =   120
      Width           =   4212
      Begin VB.TextBox txtRecalc 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         TabIndex        =   27
         Text            =   "txtB9"
         Top             =   3240
         Width           =   492
      End
      Begin VB.TextBox txtStepInfo 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         TabIndex        =   23
         Text            =   "Step"
         Top             =   360
         Width           =   492
      End
      Begin VB.TextBox txtButton7 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Text            =   "txtB7"
         Top             =   2520
         Width           =   492
      End
      Begin VB.TextBox txtButton3 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   120
         TabIndex        =   14
         Text            =   "txtb3"
         Top             =   1440
         Width           =   492
      End
      Begin VB.TextBox txtButton4 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   120
         TabIndex        =   12
         Text            =   "txtb4"
         Top             =   1800
         Width           =   492
      End
      Begin VB.TextBox txtButton5 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Text            =   "txtB5"
         Top             =   2160
         Width           =   492
      End
      Begin VB.TextBox txtButton2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   120
         TabIndex        =   8
         Text            =   "txtb2"
         Top             =   1080
         Width           =   492
      End
      Begin VB.TextBox txtButton1 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Text            =   "txtB1"
         Top             =   720
         Width           =   492
      End
      Begin VB.Label Label5 
         Caption         =   "Post Processing"
         Height          =   255
         Left            =   720
         TabIndex        =   30
         Top             =   3600
         Width           =   1215
      End
      Begin VB.Label Label4 
         Caption         =   "Recalc Invoices"
         Height          =   255
         Left            =   720
         TabIndex        =   28
         Top             =   3240
         Width           =   1215
      End
      Begin VB.Label Label3 
         Caption         =   "Process CallDetail"
         Height          =   255
         Left            =   720
         TabIndex        =   26
         Top             =   2880
         Width           =   1335
      End
      Begin VB.Label lblStepInfo 
         Caption         =   "Setup EDI"
         Height          =   255
         Left            =   720
         TabIndex        =   24
         Top             =   360
         Width           =   3375
      End
      Begin VB.Label lblProc7 
         Caption         =   "Process Cost Allocations"
         Height          =   255
         Left            =   720
         TabIndex        =   22
         Top             =   2520
         Width           =   2175
      End
      Begin VB.Label Label2 
         Caption         =   "Process Manual Exception Invoices"
         Height          =   255
         Left            =   720
         TabIndex        =   15
         Top             =   1440
         Width           =   2535
      End
      Begin VB.Label lblProc4 
         Caption         =   "Process Manual Invoices"
         Height          =   255
         Left            =   720
         TabIndex        =   13
         Top             =   1800
         Width           =   2295
      End
      Begin VB.Label lblProc5 
         Caption         =   "Pre Allocation Processing"
         Height          =   255
         Left            =   720
         TabIndex        =   4
         Top             =   2160
         Width           =   2175
      End
      Begin VB.Label lblProc2 
         Caption         =   "Process EDI Invoices"
         Height          =   255
         Left            =   720
         TabIndex        =   3
         Top             =   1080
         Width           =   2295
      End
      Begin VB.Label lblProc1 
         Caption         =   "Process EDI  Exception Invoices"
         Height          =   255
         Left            =   720
         TabIndex        =   2
         Top             =   720
         Width           =   2535
      End
   End
   Begin VB.Label lblGLLinkHeader 
      Alignment       =   2  'Center
      Caption         =   "GLLinkIDs"
      Height          =   255
      Left            =   3480
      TabIndex        =   20
      Top             =   5400
      Visible         =   0   'False
      Width           =   2895
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Invoices"
      Height          =   255
      Left            =   3480
      TabIndex        =   19
      Top             =   4800
      Width           =   2895
   End
   Begin VB.Label lblGLLinkEnd 
      Alignment       =   1  'Right Justify
      Caption         =   "0"
      Height          =   255
      Left            =   6120
      TabIndex        =   18
      Top             =   5400
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label lblGLLinkStart 
      Caption         =   "0"
      Height          =   255
      Left            =   2880
      TabIndex        =   17
      Top             =   5400
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label lblEnd 
      Alignment       =   1  'Right Justify
      Caption         =   "0"
      Height          =   255
      Left            =   6120
      TabIndex        =   11
      Top             =   4800
      Width           =   855
   End
   Begin VB.Label lblStart 
      Caption         =   "0"
      Height          =   255
      Left            =   2880
      TabIndex        =   10
      Top             =   4800
      Width           =   495
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   3855
      Left            =   240
      Picture         =   "frmMain.frx":0000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   2415
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Version 1.1.4
' Error Handling modified to give clearer description and bubble up to the top
' of the call stack correctly.


' Version 1.1.3
'   1)  Bug Fix:  Program hangs when unable to process GL Accts
'       tell them to check tbl_Ref_Vendors and
'       aaProfitLabClientVendorsAccouts
'   2)  Bug Fix:  All Monthly Rec move to exception not moving records to
'       exception tables.


'##OB This project is standalone executable to automatically process EDI invoices _
writen by <A href="http://www.castlesolutions.com">Castle Solutions</a>

'##CD This standalone exe module automatically processes EDI invoices

Private WithEvents oSch As PLInvBus.cScheduler
Attribute oSch.VB_VarHelpID = -1
'##VD Enable event bubbling to track when a invoice has been processed
Private WithEvents oCostAlloc As PLInvBus.cCostAlloc
Attribute oCostAlloc.VB_VarHelpID = -1
'##VD Enable event bubbling to track when a invoice has been allocated


Private bFirstTime As Boolean

Private dStartDateTime As Date
Private dEndDateTime As Date

Private lEDIProgressCount As Long
Private lExProgressCount As Long

Private lCallDetailCount As Long
Private lInvoiceRecalcCount As Long
Private lInvoicePostProc As Long

Private lBatchChgSumCount As Long
Private lBatchCallDetCount As Long

Private lCurrentManualStep As Long
Private lCurrentEDIStep As Long

Private bIniErr As Boolean
Private lErrNo As Long
Private sErrMsg As String

Private sWriteBatchLogtoFile As String

Private Const ERROR_ALREADY_EXISTS      As Long = 183

Private Type SECURITY_ATTRIBUTES
    nLength                             As Long
    lpSecurityDescriptor                As Long
    bInheritHandle                      As Long
End Type

'initialize to false in init sub
Public bCancelBatch As Boolean  '=false

Public Enum Reports
    '##EN Enum type for Reports
    NightlyBatchReport = 1
    CircuitInventoryReport = 2
End Enum

Private Declare Function CreateMutex Lib "kernel32" Alias "CreateMutexA" (lpMutexAttributes As SECURITY_ATTRIBUTES, ByVal bInitialOwner As Long, ByVal lpName As String) As Long


Private Function IsIDE() As Boolean
     On Error GoTo IDEInUse
     Debug.Print 1 \ 0 'division by zero error
     IsIDE = False
     Exit Function
IDEInUse:
     IsIDE = True
End Function


Private Sub cmdCancel_Click()
    '##BD Cancel and unload the program
    bCancelBatch = True
    MsgBox "Processing interupted by user.", vbCritical
    Unload Me
    
End Sub

Private Sub Form_Initialize()
    App.StartLogging App.Path & "\ErrorLog.txt", 0
End Sub

Private Sub Form_Load()
'##BD Load the program and initialize the timer, program objects. _
Calls _
    1) %GetReportName:ms-its:PLINVBUS.chm::cScheduler_GetReportName% Function _
    2) %GetPrinterName:ms-its:PLINVBUS.chm::cScheduler_GetPrinterName% Function _
    3) %GetConnStr:ms-its:PLINVBUS.chm::cScheduler_GetConnStr% Function

Dim sConnStr As String
Dim sPrinterName As String
Dim sRptPath As String
Dim sRptName As String


Dim bPrinterNameMatch As Boolean
Dim sError As String

Dim iCnt As Integer

On Error GoTo ErrHandler

'Verify if app is running - do not run this one
Dim sa As SECURITY_ATTRIBUTES
If Not IsIDE Then 'only process in compiled exe

    'Prevent running this program again if it's already running
     sa.bInheritHandle = 1
     sa.lpSecurityDescriptor = 0
     sa.nLength = Len(sa)
    
     Call CreateMutex(sa, 1, App.Title)
    
     If Err.LastDllError = ERROR_ALREADY_EXISTS Then
            'MsgBox App.Title & " is already running.", vbInformation
            App.LogEvent "Batch Cancelled - " & App.Title & " is already running."
            Unload frmMain
            Set frmMain = Nothing
            Exit Sub
     End If
     
End If

    sWriteBatchLogtoFile = ""

    bCancelBatch = False
    bFirstTime = False
    sError = "Set PLInvBus.cScheduler"
    Set oSch = New PLInvBus.cScheduler
    Set oCostAlloc = New PLInvBus.cCostAlloc

    txtButton1.FontSize = "10"
    txtButton2.FontSize = "10"
    txtButton3.FontSize = "10"
    txtButton4.FontSize = "10"
    txtButton5.FontSize = "10"
    txtStepInfo.FontSize = "10"
    txtButton7.FontSize = "10"
    txtCallDetail.FontSize = "10"
    txtRecalc.FontSize = "10"
    txtPostProcess.FontSize = "10"

    txtButton1.Font = "WingDings"
    txtButton2.Font = "WingDings"
    txtButton3.Font = "WingDings"
    txtButton4.Font = "WingDings"
    txtButton5.Font = "WingDings"
    txtStepInfo.Font = "WingDings"
    txtButton7.Font = "WingDings"
    txtCallDetail.Font = "WingDings"
    txtRecalc.Font = "WingDings"
    txtPostProcess.Font = "WingDings"
    
    txtButton1.FontSize = "6"
    txtButton1.Text = "l"
    txtButton2.FontSize = "6"
    txtButton2.Text = "l"
    txtButton3.FontSize = "6"
    txtButton3.Text = "l"
    txtButton4.FontSize = "6"
    txtButton4.Text = "l"
    txtButton5.FontSize = "6"
    txtButton5.Text = "l"
    txtStepInfo.FontSize = "6"
    txtStepInfo.Text = "l"
    txtButton7.FontSize = "6"
    txtButton7.Text = "l"
    txtCallDetail.FontSize = "6"
    txtCallDetail.Text = "l"
    txtRecalc.FontSize = "6"
    txtRecalc.Text = "l"
    txtPostProcess.FontSize = "6"
    txtPostProcess.Text = "l"
    
    ' Be sure we have the three things listed in the *.ini file
    ' even though we will not DO anything with these items

    ' 1) Three (3) Report Files
    'GST - bypass not used anymore 12/7/04
    
    If 1 = 2 Then
        For iCnt = 1 To 3
        
            Select Case iCnt
                Case 1
                    ' CostAllocNightlyReport
                    sRptPath = oSch.GetReportName("CostAllocNightlyReport")
                Case 2
                    ' CostAllocErrorReport
                    sRptPath = oSch.GetReportName("CostAllocErrorReport")
                Case 3
                    ' NightlyReportLocation
                    sRptPath = oSch.GetReportName("NightlyReportLocation")
            End Select
            
            sError = "Get oSch.ReportName"
            sError = "Get dir for report name (" & sRptPath & ")"
            sRptName = Dir(sRptPath)
        
            If sRptName = "" Then
                ' report file does not exist
                bIniErr = True
                lErrNo = 1 + vbObjectError + 512
                Err.Raise lErrNo, "PLInvBatch.frmMain.Load", _
                    "CostAllocNightlyReport filename found in PLInvDB.ini file does not exist."
                Exit For
            End If
                    
        Next iCnt
    End If
    
    ' 2) Printer Name
        ' method raises error if string is empty
    If 1 = 2 Then
        sError = "Get oSch.GetPrinterName"
        sPrinterName = oSch.GetPrinterName
    
        sError = "Get oSch.PrinterNameMatch(" & sPrinterName & ")"
        bPrinterNameMatch = oSch.PrinterNameMatch(sPrinterName)
    
        ' 3) ConnectionString to the Database
            ' method raises error if string is empty
        sError = "Get oSch.GetConnStr"
        sConnStr = oSch.GetConnStr
    End If

Me.Show
    bFirstTime = True
    Exit Sub
ErrHandler:
            
    sErrMsg = "[***[" & Now & " PLINVBatch.Form_Load]" & vbCr & _
        "[No: " & Err.Number & "]" & vbCr & _
        "[{Source: " & Err.Source & "}]" & vbCr & _
        "[Desc: " & sError & " " & Err.Description & "]***]"

    App.LogEvent sErrMsg
    Unload Me
    
End Sub

Private Function EDI_ProcessExceptions() As Boolean

    '##BD Process Exeception Invoices. _
    Calls _
    1) %ProcessNightlyExceptions:ms-its:PLINVBUS.chm::cScheduler_ProcessNightlyExceptions% Function _
    2) %ProcessEDIInvoices:ms-its:PLINVBatch.chm::frmMain_ProcessEDIInvoices% Function

On Error GoTo ErrHandler
    txtButton1.Font = "WingDings"
    txtButton1.FontSize = "10"
    txtButton1.Text = "à"
    frmMain.Refresh
    
    pbProcess.Min = 1
    lExProgressCount = oSch.EDI_Ex_InvoiceCount
    If lExProgressCount > 0 Then
        lblEnd.Caption = lExProgressCount
        If lExProgressCount = 1 Then
            pbProcess.Max = 2
        Else
            pbProcess.Max = lExProgressCount
        End If
        DoEvents
        pbProcess.Value = 1
    Else
        lblEnd.Caption = 0
    End If
    
    If lExProgressCount > 0 Then
        EDI_ProcessExceptions = oSch.EDI_ProcessNightlyExceptions( _
            lBatchChgSumCount, lBatchCallDetCount)
    End If
    
    '  set checkmark
    txtButton1.Font = "WingDings"
    txtButton1.FontSize = "16"
    txtButton1.Text = "ü"
    frmMain.Refresh
    
    Exit Function
    
ErrHandler:

    Err.Raise Err.Number, Err.Source, Err.Description
End Function

Private Function EDI_ProcessInvoices() As Boolean

'##BD Process Exeception Invoices. _
Calls _
1) %EDIInvoiceCount:ms-its:PLINVBUS.chm::cScheduler_EDIInvoiceCount% Function _
2) %ProcessNightlyEDIInvoices:ms-its:PLINVBUS.chm::cScheduler_ProcessNightlyEDIInvoices% Function _
3) %ProcessBatchRpt:ms-its:PLINVBatch.chm::frmMain_ProcessBatchRpt% Function

On Error GoTo ErrHandler
    '  set arrow
    txtButton2.Font = "WingDings"
    txtButton2.FontSize = "10"
    txtButton2.Text = "à"
    frmMain.Refresh
    
    '  Process EDI Invoices
    
    lEDIProgressCount = oSch.EDI_InvoiceCount
    If lEDIProgressCount > 0 Then
        lblEnd.Caption = lEDIProgressCount
        If lEDIProgressCount = 1 Then
            pbProcess.Max = 2
        Else
           
            pbProcess.Max = lEDIProgressCount
        End If
        DoEvents
        pbProcess.Value = 1
    Else
        lblEnd.Caption = 0
    End If
    
    If lEDIProgressCount > 0 Then
        EDI_ProcessInvoices = oSch.EDI_ProcessNightlyInvoices( _
            lBatchChgSumCount, lBatchCallDetCount)
    End If
    

    
    '  set checkmark
    txtButton2.Font = "WingDings"
    txtButton2.FontSize = "16"
    txtButton2.Text = "ü"
    frmMain.Refresh
    
    ' now print the nightly report
    pbProcess.Value = 1
    Exit Function

ErrHandler:

    Err.Raise Err.Number, Err.Source, Err.Description
End Function

Private Function ProcessBatchRpts(ByVal iRpt As Integer) As Boolean
  
'##BD Process Batch Report after run. _
Calls _
1) %ProcessNightlyReport:ms-its:PLINVBUS.chm::cScheduler_ProcessNightlyReport% Function _
2) %DoCleanup:ms-its:PLINVBatch.chm::frmMain_DoCleanup% Function


On Error GoTo ErrHandler

    
    Select Case iRpt
    Case 1
    '  set arrow
    txtButton5.Font = "WingDings"
    txtButton5.FontSize = "10"
    txtButton5.Text = "à"
    frmMain.Refresh
    Case 2
    '  set arrow
 '   txtButton6.Font = "WingDings"
 '   txtButton6.FontSize = "10"
 '   txtButton6.Text = "à"
    frmMain.Refresh
    End Select
    
    ' Process Batch Report
    
    ProcessBatchRpts = oSch.ProcessNightlyReports(iRpt, _
        dStartDateTime, dEndDateTime)

    Select Case iRpt
    Case Reports.NightlyBatchReport
    '  set checkmark
    txtButton5.Font = "WingDings"
    txtButton5.FontSize = "16"
    txtButton5.Text = "ü"
    frmMain.Refresh
    Case Reports.CircuitInventoryReport
    '  set checkmark
'    txtButton6.Font = "WingDings"
 '   txtButton6.FontSize = "16"
 '   txtButton6.Text = "ü"
    frmMain.Refresh
    End Select
    Exit Function
    
ErrHandler:

    Err.Raise Err.Number, Err.Source, Err.Description
End Function

Private Sub Form_Unload(Cancel As Integer)
    '##BD Unload program
    
On Error GoTo Eh
    Set oSch = Nothing
    
Exit Sub

Eh:
    sErrMsg = "[***[" & Now & " ERROR: PLINVBatch.Timer1_Timer]" & vbCr & _
        "[ERROR NO: " & Err.Number & "]" & vbCr & _
        "[{ERROR SOURCE: " & Err.Source & "}]" & vbCr & _
        "[ERROR DESC: " & Err.Description & "]***]"
    App.LogEvent sErrMsg
End Sub

Private Sub lblProc3_Click()

End Sub



Private Sub oSch_ProcessedOneEDIInvoice()
    '##BD Track counter of # of EDI Invoices Processed

On Error GoTo ErrHandler
    If pbProcess.Value + 1 > pbProcess.Max Then
        pbProcess.Value = pbProcess.Max
    Else
        pbProcess.Value = pbProcess.Value + 1
    End If
    frmMain.Refresh
    Exit Sub

ErrHandler:

    Err.Raise Err.Number, Err.Source, Err.Description
End Sub

Private Sub oSch_ProcessedOneExInvoice()
    '##BD Track counter of # of Exception Invoices Processed

On Error GoTo ErrHandler
    If pbProcess.Value + 1 > pbProcess.Max Then
        pbProcess.Value = pbProcess.Max
    Else
        pbProcess.Value = pbProcess.Value + 1
    End If
    frmMain.Refresh
    Exit Sub

ErrHandler:

    Err.Raise Err.Number, Err.Source, Err.Description
End Sub

Private Sub oSch_ProcessedOneManualInvoice()

On Error GoTo ErrHandler
    If pbProcess.Value + 1 > pbProcess.Max Then
        pbProcess.Value = pbProcess.Max
    Else
        pbProcess.Value = pbProcess.Value + 1
    End If
    frmMain.Refresh
    Exit Sub

ErrHandler:

    Err.Raise Err.Number, Err.Source, Err.Description

End Sub


Private Sub oSch_ProcessedManualPreProcStep(ByVal sStepName As String)

On Error GoTo ErrHandler
    lCurrentManualStep = lCurrentManualStep + 1
    lblStepInfo.Caption = "Setup Manual - Step: " & sStepName & " " & lCurrentManualStep & " of 8"
    frmMain.Refresh
    Exit Sub

ErrHandler:

    Err.Raise Err.Number, Err.Source, Err.Description

End Sub

Private Sub oSch_ProcessedEDIPreProcStep(ByVal sStepName As String)

On Error GoTo ErrHandler
    lCurrentEDIStep = lCurrentEDIStep + 1
    lblStepInfo.Caption = "Setup EDI - Step: " & sStepName & " " & lCurrentEDIStep & " of 4"
    frmMain.Refresh
    Exit Sub

ErrHandler:

    Err.Raise Err.Number, Err.Source, Err.Description

End Sub

Private Sub Text1_Change()

End Sub

Private Sub Timer1_Timer()
    '##BD When timer fires, start processing Invoices. _
    Calls _
    1) %DoPreProcessing:ms-its:PLINVBatch.chm::frmMain_DoPreProcessing% Function _
    2) %ProcessExeptions:ms-its:PLINVBatch.chm::frmMain_ProcessExeptions% Function

Dim sDesc As String
Dim iReturn As Integer
Dim strProcessStats As String

Dim EDI_DoPreProcessing_Complete As Boolean
Dim Manual_DoPreProcessing_Complete As Boolean

Dim cCostAlloc As PLInvBus.cCostAlloc
Dim cSch As PLInvBus.cScheduler
Dim cGet_ProcessStats As PLInvBus.cInvoiceProd

Dim bWriteBatchLog As Boolean
Dim lBatchStatStatus As Integer

Set cCostAlloc = New PLInvBus.cCostAlloc
Set cSch = New PLInvBus.cScheduler
Set cGet_ProcessStats = New PLInvBus.cInvoiceProd

bWriteBatchLog = False

On Error GoTo ErrHandler

dStartDateTime = DateAdd("n", -1, Now)
StatusBar1.SimpleText = "Start Time: " & dStartDateTime

sWriteBatchLogtoFile = ReadBatchIniString(App.EXEName, "Logging", _
                                         "WriteBatchProcesstoFile", "")
                                         
If sWriteBatchLogtoFile = "true" Then
    cSch.InitBatchLog "BatchLog.txt"   'txt file in Logs folder
End If

txtStepInfo.Font = "WingDings"
txtStepInfo.FontSize = "10"
txtStepInfo.Text = "à"
frmMain.Refresh

lCurrentManualStep = 0
lCurrentEDIStep = 0

    If bIniErr Then
        Unload Me
    Else
        'check if user passed command line argument to only process cost allocations
        If InStr(LCase(Command), "costonly") > 0 Then
        
            cSch.WritetoBatchLog "Start CostOnly Batch Run"
            cSch.WritetoBatchLog "Send Email Notification CostOnly Started"
            iReturn = cSch.Send_eMail_Message( _
                "Batch_Notification@Profit-Lab.com", _
                "Batch_Notification@Profit-Lab.com", _
                , _
                , _
                , _
                , _
                , "Cost Allocation Batch Started" _
                , "Batch Started at " & Now)
        
            'no preprocessing involved
            lblStepInfo.Caption = "No Setup Required"
            '  set checkmark
            txtStepInfo.Font = "WingDings"
            txtStepInfo.FontSize = "16"
            txtStepInfo.Text = "ü"
            frmMain.Refresh
    
            'now process allocations and their report
            App.LogEvent "Start CostAlloc_ProcessInvoices"
            CostAlloc_ProcessInvoices
            
            'send stats
            cSch.WritetoBatchLog "Send Email Notification CostOnly Finished"
            lBatchStatStatus = cSch.Generate_BatchTotals_Email(CStr(dStartDateTime), 3)
            
'            strProcessStats = cGet_ProcessStats.Get_ProcessCounts(CStr(dStartDateTime))
'
'            iReturn = cSch.Send_eMail_Message( _
'                "Batch_Notification@Profit-Lab.com", _
'                "Batch_Notification@Profit-Lab.com", _
'                , _
'                , _
'                , _
'                , _
'                , "Cost Allocation Batch Finished" _
'                , "Batch Finished at " & Now & strProcessStats)
                
            Unload Me
            'Exit Sub
            
        ElseIf InStr(LCase(Command), "manualonly") > 0 Then
        
            cSch.WritetoBatchLog "Start Manual Only Batch Run"
            cSch.WritetoBatchLog "Send Email Notification Manual Only Started"
            iReturn = cSch.Send_eMail_Message( _
                "Batch_Notification@Profit-Lab.com", _
                "Batch_Notification@Profit-Lab.com", _
                , _
                , _
                , _
                , _
                , "Manual Only Batch Started" _
                , "Batch Started at " & Now)
                
            App.LogEvent "Process Manual Only"
            cSch.WritetoBatchLog "Start Manual PreProcessing"
            Manual_DoPreProcessing_Complete = Manual_DoPreProcessing
            cSch.WritetoBatchLog "Start Manual PreProcessing - Success: " & Manual_DoPreProcessing_Complete
            
            '  set checkmark
            lblStepInfo.Caption = "Setup Finished"
            txtStepInfo.Font = "WingDings"
            txtStepInfo.FontSize = "16"
            txtStepInfo.Text = "ü"
            frmMain.Refresh
                    
            Manual_ProcessExceptions
            Manual_ProcessInvoices
            
            App.LogEvent "Start CostAlloc_ProcessInvoices"
            'now process allocations and their report
            CostAlloc_ProcessInvoices
            
            'round up to nearest minute
            dEndDateTime = DateAdd("n", 1, Now)
            WriteBatchRptLog
            bWriteBatchLog = True
                    
            App.LogEvent "Run Reports"
            'now process batch reports to show current status of allocation
            '''ProcessBatchRpts (Reports.NightlyBatchReport)
            'ProcessBatchRpts (Reports.CircuitInventoryReport)
            'cCostAlloc.PrintReport "FindManualExceptions"
                               
            'close out program
            cSch.WritetoBatchLog "Send Email Notification Manual Only Finished"
            lBatchStatStatus = cSch.Generate_BatchTotals_Email(CStr(dStartDateTime), 2)
            
'            strProcessStats = cGet_ProcessStats.Get_ProcessCounts(CStr(dStartDateTime))
'
'            iReturn = cSch.Send_eMail_Message( _
'                "Batch_Notification@Profit-Lab.com", _
'                "Batch_Notification@Profit-Lab.com", _
'                , _
'                , _
'                , _
'                , _
'                , "Manual Only Batch Finished" _
'                , "Batch Finished at " & Now & strProcessStats)
                
            Unload Me
            'Exit Sub
            
      ElseIf InStr(LCase(Command), "calldetailonly") > 0 Then
        
            cSch.WritetoBatchLog "Start CallDetail Run"
            cSch.WritetoBatchLog "Send Email Notification CallDetail Started"
            iReturn = cSch.Send_eMail_Message( _
                "Batch_Notification@Profit-Lab.com", _
                "Batch_Notification@Profit-Lab.com", _
                , _
                , _
                , _
                , _
                , "CallDetail Batch Started" _
                , "Batch Started at " & Now)
        
            'no preprocessing involved
            lblStepInfo.Caption = "No Setup Required"
            '  set checkmark
            txtStepInfo.Font = "WingDings"
            txtStepInfo.FontSize = "16"
            txtStepInfo.Text = "ü"
            frmMain.Refresh
    
            'now process allocations and their report
            App.LogEvent "Start Process_CallDetail"
            Process_CallDetail
            
            iReturn = cSch.Send_eMail_Message( _
                "Batch_Notification@Profit-Lab.com", _
                "Batch_Notification@Profit-Lab.com", _
                , _
                , _
                , _
                , _
                , "CallDetail Batch Finished" _
                , "Batch Finished at " & Now)
                
            'send stats
            'cSch.WritetoBatchLog "Send Email Notification CallDetail Finished"
            'lBatchStatStatus = cSch.Generate_BatchTotals_Email(CStr(dStartDateTime), 3)
            
            Unload Me
            'Exit Sub
            
        ElseIf InStr(LCase(Command), "recalconly") > 0 Then
        
            cSch.WritetoBatchLog "Start Invoice Recalc Run"
            cSch.WritetoBatchLog "Send Email Notification Invoice Recalc Started"
            iReturn = cSch.Send_eMail_Message( _
                "Batch_Notification@Profit-Lab.com", _
                "Batch_Notification@Profit-Lab.com", _
                , _
                , _
                , _
                , _
                , "CallDetail Batch Started" _
                , "Batch Started at " & Now)
        
            'no preprocessing involved
            lblStepInfo.Caption = "No Setup Required"
            '  set checkmark
            txtStepInfo.Font = "WingDings"
            txtStepInfo.FontSize = "16"
            txtStepInfo.Text = "ü"
            frmMain.Refresh
    
            'now process allocations and their report
            App.LogEvent "Start Invoice Recalc"
            Process_InvoiceRecalc
            
            iReturn = cSch.Send_eMail_Message( _
                "Batch_Notification@Profit-Lab.com", _
                "Batch_Notification@Profit-Lab.com", _
                , _
                , _
                , _
                , _
                , "Invoice Recalc Batch Finished" _
                , "Batch Finished at " & Now)
                

            Unload Me
    
        ElseIf InStr(LCase(Command), "postprocessing") > 0 Then
            cSch.WritetoBatchLog "Start Post Processing Run"
            'cSch.WritetoBatchLog "Send Email Notification Post Processing Started"
            'no preprocessing involved
            lblStepInfo.Caption = "No Setup Required"
            '  set checkmark
            txtStepInfo.Font = "WingDings"
            txtStepInfo.FontSize = "16"
            txtStepInfo.Text = "ü"
            frmMain.Refresh
            
            'now process allocations and their report
            App.LogEvent "Start Post Processing"
            Process_PostProcessing (True)
            
            'send email finished
            
            Unload Me
        Else

            cSch.WritetoBatchLog "Start Full Batch Run"
            cSch.WritetoBatchLog "Send Email Notification Batch Started"
            iReturn = cSch.Send_eMail_Message( _
                "Batch_Notification@Profit-Lab.com", _
                "Batch_Notification@Profit-Lab.com", _
                , _
                , _
                , _
                , _
                , "Full Batch Started" _
                , "Batch Started at " & Now)
                
            If bFirstTime = True Then
                bFirstTime = False
    
                cSch.WritetoBatchLog "Start EDI PreProcessing"
                EDI_DoPreProcessing_Complete = EDI_DoPreProcessing
                cSch.WritetoBatchLog "Finish EDI PreProcessing - Success: " & EDI_DoPreProcessing_Complete
                
                cSch.WritetoBatchLog "Start Manual PreProcessing"
                Manual_DoPreProcessing_Complete = Manual_DoPreProcessing
                cSch.WritetoBatchLog "Start Manual PreProcessing - Success: " & Manual_DoPreProcessing_Complete
                
                
                If Manual_DoPreProcessing_Complete And EDI_DoPreProcessing_Complete Then
                    '  set checkmark
                    lblStepInfo.Caption = "Setup Finished"
                    txtStepInfo.Font = "WingDings"
                    txtStepInfo.FontSize = "16"
                    txtStepInfo.Text = "ü"
                    frmMain.Refresh
    
                    EDI_ProcessExceptions
                    EDI_ProcessInvoices
                    Manual_ProcessExceptions
                    Manual_ProcessInvoices
                    
                    'handle pre allocation processing
                    
                    'now process allocations and their report
                    CostAlloc_ProcessInvoices
                    
                    'Start Any InvoiceRecalcs needed
                    Process_InvoiceRecalc
            
                    'post_processing for any invoices marked
                    Process_PostProcessing (False)
                    
                    'round up to nearest minute
                    dEndDateTime = DateAdd("n", 1, Now)
                    cSch.WritetoBatchLog "Write Batch Report Log"
                    WriteBatchRptLog
                    bWriteBatchLog = True
                    
                    'now process batch reports to show current status of allocation
                    ''' ProcessBatchRpts (Reports.NightlyBatchReport)
                    'ProcessBatchRpts (Reports.CircuitInventoryReport)
                    
                    'GST 10-17-02  Not used - may make web access
                    'cCostAlloc.PrintReport "FindManualExceptions"
                    
                    'close out program
                    DoCleanup
                    
                    cSch.WritetoBatchLog "Send Email Notification Batch Finished"
                    lBatchStatStatus = cSch.Generate_BatchTotals_Email(CStr(dStartDateTime), 1)
                    
'                    strProcessStats = cGet_ProcessStats.Get_ProcessCounts(CStr(dStartDateTime))
'                    iReturn = cSch.Send_eMail_Message( _
'                        "Batch_Notification@Profit-Lab.com", _
'                        "Batch_Notification@Profit-Lab.com", _
'                        , _
'                        , _
'                        , _
'                        , _
'                        , "Full Batch Finished" _
'                        , "Batch Finished at " & Now & strProcessStats)
                
                    Unload Me
                Else
                    'had an exception so abort the batch run and get out
                    'round up to nearest minute
    
                    '  set checkmark
                    txtButton2.Font = "WingDings"
                    txtButton2.FontSize = "16"
                    txtButton2.Text = "ü"
                    frmMain.Refresh
                    sDesc = "Invoice Batch Error:  Unable to process GLAccounts." & _
                        " Check tbl_Ref_Vendors and aaProfitlabClientVendorAccounts tables" & _
                        " and run view vt_Potential_EDI_GLAcct_Add."
                    lErrNo = 2 + vbObjectError + 512
                    Err.Raise lErrNo, "PLInvBatch.frmMain.Timer", sDesc
    
                End If
            End If
        End If
    End If
    
    cSch.FinializeBatchLog
    
    Set cCostAlloc = Nothing
    Set cSch = Nothing

    Unload Me
Exit Sub

ErrHandler:
    'first write error to event log
    sErrMsg = "[***[" & Now & " ERROR: PLINVBatch.Timer1_Timer]" & vbCr & _
        "[ERROR NO: " & Err.Number & "]" & vbCr & _
        "[{ERROR SOURCE: " & Err.Source & "}]" & vbCr & _
        "[ERROR DESC: " & Err.Description & "]***]"
    App.LogEvent sErrMsg
    cSch.WritetoBatchLog "Batch Error Logging:" & sErrMsg
    ' next send email to Batch_Notification distribution list
    
    'strProcessStats = cGet_ProcessStats.Get_ProcessCounts(CStr(dStartDateTime))
    lBatchStatStatus = cSch.Generate_BatchTotals_Email(CStr(dStartDateTime), 4)
    
    cSch.WritetoBatchLog "Send Email Notification Batch Error"
    iReturn = cSch.Send_eMail_Message( _
        "Batch_Notification@Profit-Lab.com", _
        "Batch_Notification@Profit-Lab.com", _
        , _
        , _
        , _
        , _
        , "Batch Error" _
        , "Batch Error Failed at " & Now & sErrMsg & vbCr)
        
    ' if iReturn <> 0 then we have an email send error so log it to event log
    If iReturn <> 0 Then
        sErrMsg = "[***[" & Now & " ERROR: PLINVBatch.Timer1_Timer]" & vbCr & _
            "[ERROR NO: " & iReturn & "]" & vbCr & _
            "[{ERROR SOURCE: cSch.Send_eMail_Message}]" & vbCr & _
            "[ERROR DESC: Send eMail to Batch Notification error. ***]"
        App.LogEvent sErrMsg
    End If
    
    'round up to nearest minute
    dEndDateTime = DateAdd("n", 1, Now)
    If bWriteBatchLog = False Then
        WriteBatchRptLog
    End If
    
    cSch.FinializeBatchLog   'txt file in Logs folder

    Set cCostAlloc = Nothing
    Set cSch = Nothing
    Unload Me

End Sub

Private Function EDI_DoPreProcessing() As Boolean
'##BD Process pre processing invoices. _
Calls %EDI_DoPreProcessing:ms-its:PLINVBus.chm::cScheduler_EDI_DoPreProcessing% Function

On Error GoTo ErrHandler
    EDI_DoPreProcessing = oSch.EDI_DoPreProcessing
Exit Function

ErrHandler:
   Err.Raise Err.Number, Err.Source, Err.Description
End Function

Private Function Manual_DoPreProcessing() As Boolean
'##BD Process pre processing invoices. _
Calls %Manaul_DoPreProcessing:ms-its:PLINVBus.chm::cScheduler_Manual_DoPreProcessing% Function

On Error GoTo ErrHandler
    Manual_DoPreProcessing = oSch.Manual_DoPreProcessing
Exit Function

ErrHandler:
   Err.Raise Err.Number, Err.Source, Err.Description
End Function



Private Function DoCleanup()
'##BD Preform cleanup functions. _
Calls %DoCleanup:ms-its:PLINVBus.chm::cScheduler_DoCleanup% Function
On Error GoTo ErrHandler
    oSch.DoCleanup
    Exit Function

ErrHandler:
    Err.Raise Err.Number, Err.Source, Err.Description
End Function

Private Sub WriteBatchRptLog()

'##BD Record when batch ran. _
Calls %Add_BatchRptLog:ms-its:PLINVBus.chm::cInvoiceBatch_Add_BatchRptLog% Function


Dim oInvProd As PLInvBus.cInvoiceProd
Dim oInvBatch As PLInvBus.cInvoiceBatch
Dim rsEDI As ADODB.Recordset
Dim rsEx As ADODB.Recordset
Dim bOK As Boolean
Dim dblProcessingMinutes As Double
Dim lTotalChgSumRecs As Long
Dim lTotalCallDetailRecs As Long
On Error GoTo ErrHandler
    Set oInvProd = New PLInvBus.cInvoiceProd
    Set oInvBatch = New PLInvBus.cInvoiceBatch
    Set rsEDI = New ADODB.Recordset
    Set rsEx = New ADODB.Recordset
    
    dblProcessingMinutes = Fix(DateDiff("s", dStartDateTime, dEndDateTime) / 60) + 1
        
    bOK = oInvBatch.Add_BatchRptLog( _
        dStartDateTime, _
        dEndDateTime, _
        dblProcessingMinutes, _
        lBatchChgSumCount, _
        lBatchCallDetCount)
    Exit Sub
    
ErrHandler:
   Err.Raise Err.Number, Err.Source, Err.Description
End Sub


Private Function Manual_ProcessExceptions() As Boolean

    '##BD Process Exception Invoices. _
    Calls _
    1) %ProcessNightlyExceptions:ms-its:PLINVBUS.chm::cScheduler_ProcessNightlyExceptions% Function _
    2) %ProcessEDIInvoices:ms-its:PLINVBatch.chm::frmMain_ProcessEDIInvoices% Function

On Error GoTo ErrHandler
    txtButton3.Font = "WingDings"
    txtButton3.FontSize = "10"
    txtButton3.Text = "à"
    frmMain.Refresh
    
    pbProcess.Min = 1
    lExProgressCount = oSch.Manual_Ex_InvoiceCount
    If lExProgressCount > 0 Then
        lblEnd.Caption = lExProgressCount
        If lExProgressCount = 1 Then
            pbProcess.Max = 2
        Else
            pbProcess.Max = lExProgressCount
        End If
        DoEvents
        pbProcess.Value = 1
    Else
        lblEnd.Caption = 0
    End If
    
    If lExProgressCount > 0 Then
        Manual_ProcessExceptions = oSch.Manual_ProcessNightlyExceptions( _
            lBatchChgSumCount, lBatchCallDetCount)
    End If
    
    '  set checkmark
    txtButton3.Font = "WingDings"
    txtButton3.FontSize = "16"
    txtButton3.Text = "ü"
    frmMain.Refresh
    
    Exit Function
    
ErrHandler:
    Err.Raise Err.Number, Err.Source, Err.Description
End Function


Private Function Manual_ProcessInvoices() As Boolean

'##BD Process Manual Invoices. _
Calls _
1) %EDIInvoiceCount:ms-its:PLINVBUS.chm::cScheduler_EDIInvoiceCount% Function _
2) %ProcessNightlyEDIInvoices:ms-its:PLINVBUS.chm::cScheduler_ProcessNightlyEDIInvoices% Function _
3) %ProcessBatchRpt:ms-its:PLINVBatch.chm::frmMain_ProcessBatchRpt% Function

On Error GoTo ErrHandler
    '  set arrow
    txtButton4.Font = "WingDings"
    txtButton4.FontSize = "10"
    txtButton4.Text = "à"
    frmMain.Refresh
    
    '  Process Manual Invoices
    
    
    lEDIProgressCount = oSch.Manual_InvoiceCount
    If lEDIProgressCount > 0 Then
        lblEnd.Caption = lEDIProgressCount
        If lEDIProgressCount = 1 Then
            pbProcess.Max = 2
        Else
            pbProcess.Max = lEDIProgressCount
        End If
        DoEvents
        pbProcess.Value = 1
    Else
        lblEnd.Caption = 0
    End If
    
    If lEDIProgressCount > 0 Then
        Manual_ProcessInvoices = oSch.Manual_ProcessNightlyInvoices( _
            lBatchChgSumCount, lBatchCallDetCount)
    End If
    
'    'round up to nearest minute
'    dEndDateTime = DateAdd("n", 1, Now)
'
'    WriteBatchRptLog
    
    '  set checkmark
    txtButton4.Font = "WingDings"
    txtButton4.FontSize = "16"
    txtButton4.Text = "ü"
    frmMain.Refresh
    
    ' now print the nightly report
    pbProcess.Value = 1
    Exit Function

ErrHandler:
   Err.Raise Err.Number, Err.Source, Err.Description
End Function


Private Function Process_CallDetail() As Boolean

'##BD Process CallDetail Invoices.

On Error GoTo ErrHandler
    '  set arrow
    txtCallDetail.Font = "WingDings"
    txtCallDetail.FontSize = "10"
    txtCallDetail.Text = "à"
    frmMain.Refresh
    
    Dim bProcessCallDetail As Boolean
    
    '  Determine how many to process
    Dim rsData As ADODB.Recordset
    Set rsData = oSch.CallDetail_InvoicesToProcess
    
    Dim rsOtherData As ADODB.Recordset
    Set rsOtherData = oSch.CallDetail_OtherInvoicesToProcess
    
    If Not rsData.EOF Then
        lCallDetailCount = rsData.RecordCount
        lblEnd.Caption = lCallDetailCount
        If lCallDetailCount = 1 Then
            pbProcess.Max = 2
        Else
            pbProcess.Max = lCallDetailCount
        End If
        DoEvents
        pbProcess.Value = 1
        
         If lCallDetailCount > 0 Then
            'start processing CallDetail

            Dim oClass As New PLInvBus.cInvoiceProd
            Dim rsClone As ADODB.Recordset
            Set rsClone = rsData.Clone
            Do While Not rsData.EOF
                bProcessCallDetail = True
                rsClone.Filter = ""
                rsClone.Filter = "InvoiceUniqueness=" & rsData.Fields("InvoiceUniqueness")
                If Not rsClone.EOF Then
                    DoEvents
                    bProcessCallDetail = oClass.Move_Wireless_CallDetailToData(rsClone)
                End If
                
                DoEvents
                On Error Resume Next
                If pbProcess.Value < pbProcess.Max Then
                    pbProcess.Value = pbProcess.Value + 1
                End If
                On Error GoTo 0
                
                If Not bProcessCallDetail Then
                    'TODO problem need update preproctranslog
                    
                End If
                rsData.MoveNext
            Loop
            Set oClass = Nothing
        End If

    End If
    
    'handle other data
    If Not rsOtherData.EOF Then
        lCallDetailCount = rsOtherData.RecordCount
        lblEnd.Caption = lCallDetailCount
        If lCallDetailCount = 1 Then
            pbProcess.Max = 2
        Else
            pbProcess.Max = lCallDetailCount
        End If
        DoEvents
        pbProcess.Value = 1
        
         If lCallDetailCount > 0 Then
            'start processing CallDetail
            
            Dim oClassOther As New PLInvBus.cInvoiceProd
            Dim rsCloneOther As ADODB.Recordset
            Set rsCloneOther = rsOtherData.Clone
            Do While Not rsOtherData.EOF
                bProcessCallDetail = True
                rsCloneOther.Filter = ""
                rsCloneOther.Filter = "InvoiceUniqueness=" & rsOtherData.Fields("InvoiceUniqueness")
                If Not rsCloneOther.EOF Then
                    DoEvents
                    bProcessCallDetail = oClassOther.Move_Wireless_CallDetailOtherToData(rsCloneOther)
                End If
                
                DoEvents
                On Error Resume Next
                If pbProcess.Value < pbProcess.Max Then
                    pbProcess.Value = pbProcess.Value + 1
                End If
                On Error GoTo 0
                
                If Not bProcessCallDetail Then
                    'TODO problem need update preproctranslog
                    
                End If
                rsOtherData.MoveNext
            Loop
            Set oClassOther = Nothing
        End If

    End If
    Set rsData = Nothing
    Set rsOtherData = Nothing


    lblEnd.Caption = 0
    
    '  set checkmark
    txtCallDetail.Font = "WingDings"
    txtCallDetail.FontSize = "16"
    txtCallDetail.Text = "ü"
    frmMain.Refresh
    
    ' now print the nightly report
    pbProcess.Value = 1
    Exit Function

ErrHandler:
   Err.Raise Err.Number, Err.Source, Err.Description
End Function


Private Function Process_InvoiceRecalc() As Boolean

'##BD Start Invoice Recalc.

On Error GoTo ErrHandler
    '  set arrow
    txtRecalc.Font = "WingDings"
    txtRecalc.FontSize = "10"
    txtRecalc.Text = "à"
    frmMain.Refresh
    
    
    '  Determine how many to process
    Dim rsData As ADODB.Recordset
    Set rsData = oSch.InvoiceRecalc_InvoicesToRecalc
    If Not rsData.EOF Then
        lInvoiceRecalcCount = rsData.RecordCount
        lblEnd.Caption = lInvoiceRecalcCount
        If lInvoiceRecalcCount = 1 Then
            pbProcess.Max = 2
        Else
            pbProcess.Max = lInvoiceRecalcCount
        End If
        DoEvents
        pbProcess.Value = 1
        
         If lInvoiceRecalcCount > 0 Then
            'start processing Recalc's
            Dim bProcessInvoice As Boolean
            Dim oClass As New PLInvBus.cInvoiceProd
           
            Do While Not rsData.EOF
                bProcessInvoice = True
                DoEvents
                frmMain.Refresh
                bProcessInvoice = oClass.Invoice_Recalc(rsData("Billerinvoiceid"))
                DoEvents
                frmMain.Refresh
                
                On Error Resume Next
                If pbProcess.Value < pbProcess.Max Then
                    pbProcess.Value = pbProcess.Value + 1
                End If
                On Error GoTo 0
                
                rsData.MoveNext
            Loop
            Set oClass = Nothing
        End If
    
    
    Else
        lblEnd.Caption = 0
    End If
    Set rsData = Nothing
    


    
    '  set checkmark
    txtRecalc.Font = "WingDings"
    txtRecalc.FontSize = "16"
    txtRecalc.Text = "ü"
    frmMain.Refresh
    
    ' now print the nightly report
    pbProcess.Value = 1
    Exit Function

ErrHandler:
   Err.Raise Err.Number, Err.Source, Err.Description
End Function



Private Function Process_PostProcessing(Optional ByVal bIncludeClientRules As Boolean = False) As Boolean

'##BD Start Post Processing

On Error GoTo ErrHandler
    '  set arrow on txtPostProcess label
    txtPostProcess.Font = "WingDings"
    txtPostProcess.FontSize = "10"
    txtPostProcess.Text = "à"
    frmMain.Refresh
    
    
    '  Determine how many to process
    Dim rsData As ADODB.Recordset
    
    If bIncludeClientRules = True Then
        'also get rules for client only processing after invoice have processed (ie  HR Feed)
        'Set rsData = oSch.InvoiceRecalc_InvoicesToRecalc
    Else
        'only get rules for invoices processing at this time
        'Set rsData = oSch.InvoiceRecalc_InvoicesToRecalc
    End If
    
    'for now till build function, return true
    Process_PostProcessing = True
    Exit Function
    
    
    If Not rsData.EOF Then
        lInvoicePostProc = rsData.RecordCount
        lblEnd.Caption = lInvoicePostProc
        If lInvoicePostProc = 1 Then
            pbProcess.Max = 2
        Else
            pbProcess.Max = lInvoicePostProc
        End If
        DoEvents
        pbProcess.Value = 1
        
         If lInvoicePostProc > 0 Then
            'start Post Processing
            Dim bProcessInvoice As Boolean
            Dim oClass As New PLInvBus.cInvoiceProd
           
            Do While Not rsData.EOF
                bProcessInvoice = True
                DoEvents
                frmMain.Refresh
                'bProcessInvoice = oClass.Invoice_Recalc(rsData("Billerinvoiceid"))
                DoEvents
                frmMain.Refresh
                
                On Error Resume Next
                If pbProcess.Value < pbProcess.Max Then
                    pbProcess.Value = pbProcess.Value + 1
                End If
                On Error GoTo 0
                
                rsData.MoveNext
            Loop
            Set oClass = Nothing
        End If
    
    
    Else
        lblEnd.Caption = 0
    End If
    Set rsData = Nothing
    


    
    '  set checkmark
    txtPostProcess.Font = "WingDings"
    txtPostProcess.FontSize = "16"
    txtPostProcess.Text = "ü"
    frmMain.Refresh
    
    ' now print the nightly report
    pbProcess.Value = 1
    Exit Function

ErrHandler:
   Err.Raise Err.Number, Err.Source, Err.Description
End Function


Private Function Processing_PreCostAlloc() As Boolean
    'handle preCostAlloc processing
    
    '1) remap allocations based on hr feed changing
    
    '2) update circuit linking
End Function
Private Function CostAlloc_ProcessInvoices() As Boolean

    '##BLOCK_DESCRIPTION Processes Cost Allocations for Invoices in production
    '##RETURN_TYPE_DESCRIPTION Returns Boolean
    
On Error GoTo ErrHandler
    '  set arrow
    txtButton7.Font = "WingDings"
    txtButton7.FontSize = "10"
    txtButton7.Text = "à"
    frmMain.Refresh
    
    '  Process CostAllocations for Invoices in production, setup progress bar
    'show gllinkid progress bar
    pGLLink.Visible = True
    lblGLLinkStart.Visible = True
    lblGLLinkEnd.Visible = True
    lblGLLinkHeader.Caption = "GLLinkIDs"
    lblGLLinkHeader.Visible = True
    
    'check if wanting to only process 1 invoice
    Dim sBIDprocessOnly As String
    Dim oItem As Variant
    If InStr(LCase(Command), "/bid=") > 0 Then
        Dim arrCmds() As String
        arrCmds = Split(Command, "/")
        For Each oItem In arrCmds
            If Mid(LCase(oItem), 1, 4) = "bid=" Then
                sBIDprocessOnly = Mid(oItem, 5)
                If Not IsNumeric(sBIDprocessOnly) Then
                    sBIDprocessOnly = ""
                End If
            End If
        Next
    End If
    
    
    lEDIProgressCount = oCostAlloc.GetInvoices(sBIDprocessOnly).RecordCount
    If lEDIProgressCount > 0 Then
        If lEDIProgressCount = 1 Then
            pbProcess.Max = 2
        Else
            lblEnd.Caption = lEDIProgressCount
            pbProcess.Max = lEDIProgressCount
        End If
        DoEvents
        pbProcess.Value = 1
    End If
    
    Dim lTotalRetryCount As Integer
    lTotalRetryCount = 1
    If lEDIProgressCount > 0 Then
        'process invoices
ReprocessAgain:
        On Error Resume Next
        If lTotalRetryCount < 5 Then
            'oCostAlloc.ProcessInvoices sBIDprocessOnly
            oCostAlloc.PocessAllocations_ByProc sBIDprocessOnly
        End If
        If Err.Number = -2147217871 Then
            'timeout - try multiple times
            Err.Clear
            lTotalRetryCount = lTotalRetryCount + 1
            GoTo ReprocessAgain
        End If
        On Error GoTo ErrHandler
    End If
    
    lblGLLinkHeader.Visible = False
    
    'round up to nearest minute
    dEndDateTime = DateAdd("n", 1, Now)
    
    'gst not used anymore 1-1-2013
    'Run Report to show cost allocations that processed/exceptioned and why
    'CostAlloc_ProcessInvoices = oCostAlloc.ProcessCostAllocReport(dStartDateTime, _
    '    dEndDateTime, "CostAllocErrorReport")
    
    'GST 10-17-02  Not used
    'Run Report to show breakdowns
    'CostAlloc_ProcessInvoices = oCostAlloc.ProcessCostAllocReport( _
        dStartDateTime, dEndDateTime, "CostAllocNightlyReport")
    
    
    '  set checkmark
    txtButton7.Font = "WingDings"
    txtButton7.FontSize = "16"
    txtButton7.Text = "ü"
    frmMain.Refresh
    
    pbProcess.Value = 1
    pGLLink.Visible = False
    lblGLLinkStart.Visible = False
    lblGLLinkEnd.Visible = False
    lblGLLinkHeader.Visible = False
    Exit Function

ErrHandler:
    Err.Raise Err.Number, Err.Source, Err.Description
End Function

Private Sub ocostalloc_ProcessedOneGLLinkID(sInvoiceNr As String, _
    sGLLinkID As String, sTotalRecords As String, sCount As String)
    
    pGLLink.Value = CLng(sCount)
    pGLLink.Max = CLng(sTotalRecords)
    lblGLLinkEnd.Caption = sTotalRecords
    DoEvents
End Sub



Private Sub ocostalloc_ProcessedOneInvoice()
On Error GoTo ErrHandler
    If pbProcess.Value + 1 > pbProcess.Max Then
        pbProcess.Value = pbProcess.Max
    Else
        pbProcess.Value = pbProcess.Value + 1
    End If
    Exit Sub

ErrHandler:
    Err.Raise Err.Number, Err.Source, Err.Description
End Sub

