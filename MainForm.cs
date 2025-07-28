using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace PLInvBatch
{
    public partial class MainForm : Form
    {
        #region Private Fields

        // Business logic objects (equivalent to VB6 WithEvents)
        private dynamic? oSch;
        private dynamic? oCostAlloc;

        private bool bFirstTime;
        private DateTime dStartDateTime;
        private DateTime dEndDateTime;

        private long lEDIProgressCount;
        private long lExProgressCount;
        private long lCallDetailCount;
        private long lInvoiceRecalcCount;
        private long lInvoicePostProc;
        private long lBatchChgSumCount;
        private long lBatchCallDetCount;
        private long lCurrentManualStep;
        private long lCurrentEDIStep;

        private bool bIniErr;
        private long lErrNo;
        private string sErrMsg = "";
        private string sWriteBatchLogtoFile = "";

        public bool bCancelBatch = false;

        private readonly string commandLine;

        #endregion

        #region Constructor

        public MainForm(string commandLine)
        {
            InitializeComponent();
            this.commandLine = commandLine;
        }

        #endregion

        #region Form Events

        private void MainForm_Load(object sender, EventArgs e)
        {
            try
            {
                InitializeForm();
                Show();
                bFirstTime = true;
            }
            catch (Exception ex)
            {
                string errorMessage = $"[***[{DateTime.Now} PLINVBatch.Form_Load]" +
                    $"[No: {ex.HResult}]" +
                    $"[{{Source: {ex.Source}}}]" +
                    $"[Desc: {ex.Message}]***]";

                ApplicationEventLog.LogError(errorMessage, ex);
                Close();
            }
        }

        private void BtnCancel_Click(object sender, EventArgs e)
        {
            bCancelBatch = true;
            MessageBox.Show("Processing interrupted by user.", "Cancelled", 
                MessageBoxButtons.OK, MessageBoxIcon.Critical);
            Close();
        }

        #endregion

        #region Initialization

        private void InitializeForm()
        {
            bCancelBatch = false;
            bFirstTime = false;

            // Initialize business objects (equivalent to VB6's Set oSch = New PLInvBus.cScheduler)
            try
            {
                var assemblyType = Type.GetTypeFromProgID("PLInvBus.cScheduler");
                if (assemblyType != null)
                {
                    oSch = Activator.CreateInstance(assemblyType);
                }

                assemblyType = Type.GetTypeFromProgID("PLInvBus.cCostAlloc");
                if (assemblyType != null)
                {
                    oCostAlloc = Activator.CreateInstance(assemblyType);
                }
            }
            catch (Exception ex)
            {
                ApplicationEventLog.LogError("Failed to initialize business objects", ex);
                throw;
            }

            // Initialize status indicators (equivalent to VB6's Wingdings font setup)
            InitializeStatusIndicators();
        }

        private void InitializeStatusIndicators()
        {
            // Set all status indicators to initial state (dash character in Wingdings)
            var statusControls = new[] 
            { 
                txtButton1, txtButton2, txtButton3, txtButton4, txtButton5, 
                txtStepInfo, txtButton7, txtCallDetail, txtRecalc, txtPostProcess 
            };

            foreach (var control in statusControls)
            {
                control.Font = new Font("Wingdings", 6F);
                control.Text = "l"; // Dash character in Wingdings
            }
        }

        #endregion

        #region Timer Processing

        private void Timer1_Tick(object sender, EventArgs e)
        {
            timer1.Enabled = false; // Prevent re-entry

            try
            {
                ProcessBatch();
            }
            catch (Exception ex)
            {
                HandleBatchError(ex);
            }
            finally
            {
                Close();
            }
        }

        private void ProcessBatch()
        {
            dStartDateTime = DateTime.Now.AddMinutes(-1);
            statusLabel.Text = $"Start Time: {dStartDateTime}";

            sWriteBatchLogtoFile = IniFileHelper.ReadBatchIniString("PLInvBatch", "Logging", 
                "WriteBatchProcesstoFile", "");

            if (string.Equals(sWriteBatchLogtoFile, "true", StringComparison.OrdinalIgnoreCase))
            {
                oSch?.InitBatchLog("BatchLog.txt");
            }

            // Set initial step indicator
            SetStatusIndicator(txtStepInfo, StatusIndicatorState.InProgress);
            lCurrentManualStep = 0;
            lCurrentEDIStep = 0;

            if (bIniErr)
            {
                return;
            }

            // Process based on command line arguments
            string lowerCommand = commandLine.ToLower();

            if (lowerCommand.Contains("costonly"))
            {
                ProcessCostOnly();
            }
            else if (lowerCommand.Contains("manualonly"))
            {
                ProcessManualOnly();
            }
            else if (lowerCommand.Contains("calldetailonly"))
            {
                ProcessCallDetailOnly();
            }
            else if (lowerCommand.Contains("recalconly"))
            {
                ProcessRecalcOnly();
            }
            else if (lowerCommand.Contains("postprocessing"))
            {
                ProcessPostProcessingOnly();
            }
            else
            {
                ProcessFullBatch();
            }

            oSch?.FinalizeBatchLog();
        }

        #endregion

        #region Processing Methods

        private void ProcessCostOnly()
        {
            oSch?.WritetoBatchLog("Start CostOnly Batch Run");
            SendEmailNotification("Cost Allocation Batch Started", $"Batch Started at {DateTime.Now}");

            lblStepInfo.Text = "No Setup Required";
            SetStatusIndicator(txtStepInfo, StatusIndicatorState.Complete);

            ApplicationEventLog.LogEvent("Start CostAlloc_ProcessInvoices");
            CostAlloc_ProcessInvoices();

            oSch?.Generate_BatchTotals_Email(dStartDateTime.ToString(), 3);
        }

        private void ProcessManualOnly()
        {
            oSch?.WritetoBatchLog("Start Manual Only Batch Run");
            SendEmailNotification("Manual Only Batch Started", $"Batch Started at {DateTime.Now}");

            ApplicationEventLog.LogEvent("Process Manual Only");
            oSch?.WritetoBatchLog("Start Manual PreProcessing");
            bool manualPreProcessingComplete = Manual_DoPreProcessing();
            oSch?.WritetoBatchLog($"Start Manual PreProcessing - Success: {manualPreProcessingComplete}");

            lblStepInfo.Text = "Setup Finished";
            SetStatusIndicator(txtStepInfo, StatusIndicatorState.Complete);

            Manual_ProcessExceptions();
            Manual_ProcessInvoices();

            ApplicationEventLog.LogEvent("Start CostAlloc_ProcessInvoices");
            CostAlloc_ProcessInvoices();

            dEndDateTime = DateTime.Now.AddMinutes(1);
            WriteBatchRptLog();

            oSch?.Generate_BatchTotals_Email(dStartDateTime.ToString(), 2);
        }

        private void ProcessCallDetailOnly()
        {
            oSch?.WritetoBatchLog("Start CallDetail Run");
            SendEmailNotification("CallDetail Batch Started", $"Batch Started at {DateTime.Now}");

            lblStepInfo.Text = "No Setup Required";
            SetStatusIndicator(txtStepInfo, StatusIndicatorState.Complete);

            ApplicationEventLog.LogEvent("Start Process_CallDetail");
            Process_CallDetail();

            SendEmailNotification("CallDetail Batch Finished", $"Batch Finished at {DateTime.Now}");
        }

        private void ProcessRecalcOnly()
        {
            oSch?.WritetoBatchLog("Start Invoice Recalc Run");
            SendEmailNotification("Invoice Recalc Batch Started", $"Batch Started at {DateTime.Now}");

            lblStepInfo.Text = "No Setup Required";
            SetStatusIndicator(txtStepInfo, StatusIndicatorState.Complete);

            ApplicationEventLog.LogEvent("Start Invoice Recalc");
            Process_InvoiceRecalc();

            SendEmailNotification("Invoice Recalc Batch Finished", $"Batch Finished at {DateTime.Now}");
        }

        private void ProcessPostProcessingOnly()
        {
            oSch?.WritetoBatchLog("Start Post Processing Run");

            lblStepInfo.Text = "No Setup Required";
            SetStatusIndicator(txtStepInfo, StatusIndicatorState.Complete);

            ApplicationEventLog.LogEvent("Start Post Processing");
            Process_PostProcessing(true);
        }

        private void ProcessFullBatch()
        {
            oSch?.WritetoBatchLog("Start Full Batch Run");
            SendEmailNotification("Full Batch Started", $"Batch Started at {DateTime.Now}");

            if (bFirstTime)
            {
                bFirstTime = false;

                oSch?.WritetoBatchLog("Start EDI PreProcessing");
                bool ediPreProcessingComplete = EDI_DoPreProcessing();
                oSch?.WritetoBatchLog($"Finish EDI PreProcessing - Success: {ediPreProcessingComplete}");

                oSch?.WritetoBatchLog("Start Manual PreProcessing");
                bool manualPreProcessingComplete = Manual_DoPreProcessing();
                oSch?.WritetoBatchLog($"Start Manual PreProcessing - Success: {manualPreProcessingComplete}");

                if (manualPreProcessingComplete && ediPreProcessingComplete)
                {
                    lblStepInfo.Text = "Setup Finished";
                    SetStatusIndicator(txtStepInfo, StatusIndicatorState.Complete);

                    EDI_ProcessExceptions();
                    EDI_ProcessInvoices();
                    Manual_ProcessExceptions();
                    Manual_ProcessInvoices();

                    CostAlloc_ProcessInvoices();
                    Process_InvoiceRecalc();
                    Process_PostProcessing(false);

                    dEndDateTime = DateTime.Now.AddMinutes(1);
                    oSch?.WritetoBatchLog("Write Batch Report Log");
                    WriteBatchRptLog();

                    DoCleanup();

                    oSch?.WritetoBatchLog("Send Email Notification Batch Finished");
                    oSch?.Generate_BatchTotals_Email(dStartDateTime.ToString(), 1);
                }
                else
                {
                    SetStatusIndicator(txtButton2, StatusIndicatorState.Complete);
                    string description = "Invoice Batch Error: Unable to process GLAccounts. " +
                        "Check tbl_Ref_Vendors and aaProfitlabClientVendorAccounts tables " +
                        "and run view vt_Potential_EDI_GLAcct_Add.";
                    
                    throw new ApplicationException(description);
                }
            }
        }

        #endregion

        #region Business Logic Methods

        private bool EDI_DoPreProcessing()
        {
            try
            {
                return oSch?.EDI_DoPreProcessing() ?? false;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("EDI_DoPreProcessing failed", ex);
            }
        }

        private bool Manual_DoPreProcessing()
        {
            try
            {
                return oSch?.Manual_DoPreProcessing() ?? false;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Manual_DoPreProcessing failed", ex);
            }
        }

        private bool EDI_ProcessExceptions()
        {
            try
            {
                SetStatusIndicator(txtButton1, StatusIndicatorState.InProgress);

                progressBarMain.Minimum = 1;
                lExProgressCount = oSch?.EDI_Ex_InvoiceCount ?? 0;
                
                if (lExProgressCount > 0)
                {
                    lblEnd.Text = lExProgressCount.ToString();
                    progressBarMain.Maximum = lExProgressCount == 1 ? 2 : (int)lExProgressCount;
                    progressBarMain.Value = 1;
                }
                else
                {
                    lblEnd.Text = "0";
                }

                bool result = false;
                if (lExProgressCount > 0)
                {
                    result = oSch?.EDI_ProcessNightlyExceptions(ref lBatchChgSumCount, ref lBatchCallDetCount) ?? false;
                }

                SetStatusIndicator(txtButton1, StatusIndicatorState.Complete);
                return result;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("EDI_ProcessExceptions failed", ex);
            }
        }

        private bool EDI_ProcessInvoices()
        {
            try
            {
                SetStatusIndicator(txtButton2, StatusIndicatorState.InProgress);

                lEDIProgressCount = oSch?.EDI_InvoiceCount ?? 0;
                
                if (lEDIProgressCount > 0)
                {
                    lblEnd.Text = lEDIProgressCount.ToString();
                    progressBarMain.Maximum = lEDIProgressCount == 1 ? 2 : (int)lEDIProgressCount;
                    progressBarMain.Value = 1;
                }
                else
                {
                    lblEnd.Text = "0";
                }

                bool result = false;
                if (lEDIProgressCount > 0)
                {
                    result = oSch?.EDI_ProcessNightlyInvoices(ref lBatchChgSumCount, ref lBatchCallDetCount) ?? false;
                }

                SetStatusIndicator(txtButton2, StatusIndicatorState.Complete);
                progressBarMain.Value = 1;
                return result;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("EDI_ProcessInvoices failed", ex);
            }
        }

        private bool Manual_ProcessExceptions()
        {
            try
            {
                SetStatusIndicator(txtButton3, StatusIndicatorState.InProgress);

                progressBarMain.Minimum = 1;
                lExProgressCount = oSch?.Manual_Ex_InvoiceCount ?? 0;
                
                if (lExProgressCount > 0)
                {
                    lblEnd.Text = lExProgressCount.ToString();
                    progressBarMain.Maximum = lExProgressCount == 1 ? 2 : (int)lExProgressCount;
                    progressBarMain.Value = 1;
                }
                else
                {
                    lblEnd.Text = "0";
                }

                bool result = false;
                if (lExProgressCount > 0)
                {
                    result = oSch?.Manual_ProcessNightlyExceptions(ref lBatchChgSumCount, ref lBatchCallDetCount) ?? false;
                }

                SetStatusIndicator(txtButton3, StatusIndicatorState.Complete);
                return result;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Manual_ProcessExceptions failed", ex);
            }
        }

        private bool Manual_ProcessInvoices()
        {
            try
            {
                SetStatusIndicator(txtButton4, StatusIndicatorState.InProgress);

                lEDIProgressCount = oSch?.Manual_InvoiceCount ?? 0;
                
                if (lEDIProgressCount > 0)
                {
                    lblEnd.Text = lEDIProgressCount.ToString();
                    progressBarMain.Maximum = lEDIProgressCount == 1 ? 2 : (int)lEDIProgressCount;
                    progressBarMain.Value = 1;
                }
                else
                {
                    lblEnd.Text = "0";
                }

                bool result = false;
                if (lEDIProgressCount > 0)
                {
                    result = oSch?.Manual_ProcessNightlyInvoices(ref lBatchChgSumCount, ref lBatchCallDetCount) ?? false;
                }

                SetStatusIndicator(txtButton4, StatusIndicatorState.Complete);
                progressBarMain.Value = 1;
                return result;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Manual_ProcessInvoices failed", ex);
            }
        }

        private bool Process_CallDetail()
        {
            try
            {
                SetStatusIndicator(txtCallDetail, StatusIndicatorState.InProgress);

                // Get invoices to process
                dynamic? rsData = oSch?.CallDetail_InvoicesToProcess;
                dynamic? rsOtherData = oSch?.CallDetail_OtherInvoicesToProcess;

                // Process main call detail data
                if (rsData != null && !rsData.EOF)
                {
                    ProcessCallDetailData(rsData);
                }

                // Process other call detail data
                if (rsOtherData != null && !rsOtherData.EOF)
                {
                    ProcessCallDetailOtherData(rsOtherData);
                }

                lblEnd.Text = "0";
                SetStatusIndicator(txtCallDetail, StatusIndicatorState.Complete);
                progressBarMain.Value = 1;
                return true;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Process_CallDetail failed", ex);
            }
        }

        private void ProcessCallDetailData(dynamic rsData)
        {
            lCallDetailCount = rsData.RecordCount;
            lblEnd.Text = lCallDetailCount.ToString();
            progressBarMain.Maximum = lCallDetailCount == 1 ? 2 : (int)lCallDetailCount;
            progressBarMain.Value = 1;

            if (lCallDetailCount > 0)
            {
                var oClass = Activator.CreateInstance(Type.GetTypeFromProgID("PLInvBus.cInvoiceProd"));
                var rsClone = rsData.Clone();

                while (!rsData.EOF)
                {
                    rsClone.Filter = "";
                    rsClone.Filter = $"InvoiceUniqueness={rsData.Fields["InvoiceUniqueness"].Value}";
                    
                    if (!rsClone.EOF)
                    {
                        Application.DoEvents();
                        oClass?.Move_Wireless_CallDetailToData(rsClone);
                    }

                    Application.DoEvents();
                    if (progressBarMain.Value < progressBarMain.Maximum)
                    {
                        progressBarMain.Value++;
                    }

                    rsData.MoveNext();
                }
            }
        }

        private void ProcessCallDetailOtherData(dynamic rsOtherData)
        {
            lCallDetailCount = rsOtherData.RecordCount;
            lblEnd.Text = lCallDetailCount.ToString();
            progressBarMain.Maximum = lCallDetailCount == 1 ? 2 : (int)lCallDetailCount;
            progressBarMain.Value = 1;

            if (lCallDetailCount > 0)
            {
                var oClassOther = Activator.CreateInstance(Type.GetTypeFromProgID("PLInvBus.cInvoiceProd"));
                var rsCloneOther = rsOtherData.Clone();

                while (!rsOtherData.EOF)
                {
                    rsCloneOther.Filter = "";
                    rsCloneOther.Filter = $"InvoiceUniqueness={rsOtherData.Fields["InvoiceUniqueness"].Value}";
                    
                    if (!rsCloneOther.EOF)
                    {
                        Application.DoEvents();
                        oClassOther?.Move_Wireless_CallDetailOtherToData(rsCloneOther);
                    }

                    Application.DoEvents();
                    if (progressBarMain.Value < progressBarMain.Maximum)
                    {
                        progressBarMain.Value++;
                    }

                    rsOtherData.MoveNext();
                }
            }
        }

        private bool Process_InvoiceRecalc()
        {
            try
            {
                SetStatusIndicator(txtRecalc, StatusIndicatorState.InProgress);

                dynamic? rsData = oSch?.InvoiceRecalc_InvoicesToRecalc;
                
                if (rsData != null && !rsData.EOF)
                {
                    lInvoiceRecalcCount = rsData.RecordCount;
                    lblEnd.Text = lInvoiceRecalcCount.ToString();
                    progressBarMain.Maximum = lInvoiceRecalcCount == 1 ? 2 : (int)lInvoiceRecalcCount;
                    progressBarMain.Value = 1;

                    if (lInvoiceRecalcCount > 0)
                    {
                        var oClass = Activator.CreateInstance(Type.GetTypeFromProgID("PLInvBus.cInvoiceProd"));

                        while (!rsData.EOF)
                        {
                            Application.DoEvents();
                            Refresh();
                            oClass?.Invoice_Recalc(rsData.Fields["Billerinvoiceid"].Value);
                            Application.DoEvents();
                            Refresh();

                            if (progressBarMain.Value < progressBarMain.Maximum)
                            {
                                progressBarMain.Value++;
                            }

                            rsData.MoveNext();
                        }
                    }
                }
                else
                {
                    lblEnd.Text = "0";
                }

                SetStatusIndicator(txtRecalc, StatusIndicatorState.Complete);
                progressBarMain.Value = 1;
                return true;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Process_InvoiceRecalc failed", ex);
            }
        }

        private bool Process_PostProcessing(bool includeClientRules = false)
        {
            try
            {
                SetStatusIndicator(txtPostProcess, StatusIndicatorState.InProgress);

                // For now, just return true as the original VB6 code does
                // TODO: Implement actual post-processing logic when requirements are defined
                
                SetStatusIndicator(txtPostProcess, StatusIndicatorState.Complete);
                progressBarMain.Value = 1;
                return true;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Process_PostProcessing failed", ex);
            }
        }

        private bool CostAlloc_ProcessInvoices()
        {
            try
            {
                SetStatusIndicator(txtButton7, StatusIndicatorState.InProgress);

                // Show GLLink progress bar
                progressBarGLLink.Visible = true;
                lblGLLinkStart.Visible = true;
                lblGLLinkEnd.Visible = true;
                lblGLLinkHeader.Text = "GLLinkIDs";
                lblGLLinkHeader.Visible = true;

                // Check if processing only one invoice
                string sBIDprocessOnly = "";
                if (commandLine.ToLower().Contains("/bid="))
                {
                    var commands = commandLine.Split('/');
                    foreach (var cmd in commands)
                    {
                        if (cmd.ToLower().StartsWith("bid="))
                        {
                            sBIDprocessOnly = cmd.Substring(4);
                            if (!long.TryParse(sBIDprocessOnly, out _))
                            {
                                sBIDprocessOnly = "";
                            }
                            break;
                        }
                    }
                }

                dynamic? invoices = oCostAlloc?.GetInvoices(sBIDprocessOnly);
                lEDIProgressCount = invoices?.RecordCount ?? 0;

                if (lEDIProgressCount > 0)
                {
                    progressBarMain.Maximum = lEDIProgressCount == 1 ? 2 : (int)lEDIProgressCount;
                    lblEnd.Text = lEDIProgressCount.ToString();
                    progressBarMain.Value = 1;
                }

                if (lEDIProgressCount > 0)
                {
                    // Process with retry logic for timeouts
                    int retryCount = 1;
                    while (retryCount < 5)
                    {
                        try
                        {
                            oCostAlloc?.PocessAllocations_ByProc(sBIDprocessOnly);
                            break;
                        }
                        catch (System.Runtime.InteropServices.COMException comEx) when (comEx.HResult == -2147217871)
                        {
                            // Timeout error - retry
                            retryCount++;
                        }
                    }
                }

                lblGLLinkHeader.Visible = false;
                dEndDateTime = DateTime.Now.AddMinutes(1);

                SetStatusIndicator(txtButton7, StatusIndicatorState.Complete);
                progressBarMain.Value = 1;
                progressBarGLLink.Visible = false;
                lblGLLinkStart.Visible = false;
                lblGLLinkEnd.Visible = false;
                lblGLLinkHeader.Visible = false;

                return true;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("CostAlloc_ProcessInvoices failed", ex);
            }
        }

        private void DoCleanup()
        {
            try
            {
                oSch?.DoCleanup();
            }
            catch (Exception ex)
            {
                throw new ApplicationException("DoCleanup failed", ex);
            }
        }

        private void WriteBatchRptLog()
        {
            try
            {
                var oInvBatch = Activator.CreateInstance(Type.GetTypeFromProgID("PLInvBus.cInvoiceBatch"));
                double processingMinutes = Math.Floor((dEndDateTime - dStartDateTime).TotalSeconds / 60) + 1;

                oInvBatch?.Add_BatchRptLog(dStartDateTime, dEndDateTime, processingMinutes, 
                    lBatchChgSumCount, lBatchCallDetCount);
            }
            catch (Exception ex)
            {
                throw new ApplicationException("WriteBatchRptLog failed", ex);
            }
        }

        #endregion

        #region Helper Methods

        private enum StatusIndicatorState
        {
            Waiting,
            InProgress,
            Complete
        }

        private void SetStatusIndicator(TextBox control, StatusIndicatorState state)
        {
            switch (state)
            {
                case StatusIndicatorState.Waiting:
                    control.Font = new Font("Wingdings", 6F);
                    control.Text = "l"; // Dash
                    break;
                case StatusIndicatorState.InProgress:
                    control.Font = new Font("Wingdings", 10F);
                    control.Text = "➤"; // Arrow
                    break;
                case StatusIndicatorState.Complete:
                    control.Font = new Font("Wingdings", 16F);
                    control.Text = "✓"; // Checkmark
                    break;
            }
            Refresh();
        }

        private void SendEmailNotification(string subject, string body)
        {
            try
            {
                oSch?.Send_eMail_Message(
                    "Batch_Notification@Profit-Lab.com",
                    "Batch_Notification@Profit-Lab.com",
                    "", "", "", "", "",
                    subject,
                    body);
            }
            catch (Exception ex)
            {
                ApplicationEventLog.LogError($"Failed to send email notification: {subject}", ex);
            }
        }

        private void HandleBatchError(Exception ex)
        {
            string errorMessage = $"[***[{DateTime.Now} ERROR: PLINVBatch.Timer1_Timer]" +
                $"[ERROR NO: {ex.HResult}]" +
                $"[{{ERROR SOURCE: {ex.Source}}}]" +
                $"[ERROR DESC: {ex.Message}]***]";

            ApplicationEventLog.LogError(errorMessage, ex);
            oSch?.WritetoBatchLog($"Batch Error Logging:{errorMessage}");

            // Send error notification
            oSch?.Generate_BatchTotals_Email(dStartDateTime.ToString(), 4);
            SendEmailNotification("Batch Error", $"Batch Error Failed at {DateTime.Now}{errorMessage}\r\n");

            dEndDateTime = DateTime.Now.AddMinutes(1);
            WriteBatchRptLog();
            oSch?.FinalizeBatchLog();
        }

        #endregion

        #region Form Cleanup

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                components?.Dispose();
                
                // Clean up COM objects
                if (oSch != null)
                {
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(oSch);
                    oSch = null;
                }
                
                if (oCostAlloc != null)
                {
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(oCostAlloc);
                    oCostAlloc = null;
                }
            }
            base.Dispose(disposing);
        }

        #endregion
    }
}