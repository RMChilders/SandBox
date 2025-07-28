namespace PLInvBatch
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.statusBar1 = new System.Windows.Forms.StatusStrip();
            this.statusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.btnCancel = new System.Windows.Forms.Button();
            this.progressBarMain = new System.Windows.Forms.ProgressBar();
            this.progressBarGLLink = new System.Windows.Forms.ProgressBar();
            this.frameProcess = new System.Windows.Forms.GroupBox();
            this.txtPostProcess = new System.Windows.Forms.TextBox();
            this.txtCallDetail = new System.Windows.Forms.TextBox();
            this.txtRecalc = new System.Windows.Forms.TextBox();
            this.txtStepInfo = new System.Windows.Forms.TextBox();
            this.txtButton7 = new System.Windows.Forms.TextBox();
            this.txtButton5 = new System.Windows.Forms.TextBox();
            this.txtButton4 = new System.Windows.Forms.TextBox();
            this.txtButton3 = new System.Windows.Forms.TextBox();
            this.txtButton2 = new System.Windows.Forms.TextBox();
            this.txtButton1 = new System.Windows.Forms.TextBox();
            this.lblPostProcess = new System.Windows.Forms.Label();
            this.lblRecalc = new System.Windows.Forms.Label();
            this.lblCallDetail = new System.Windows.Forms.Label();
            this.lblStepInfo = new System.Windows.Forms.Label();
            this.lblProc7 = new System.Windows.Forms.Label();
            this.lblProc5 = new System.Windows.Forms.Label();
            this.lblProc4 = new System.Windows.Forms.Label();
            this.lblProc3 = new System.Windows.Forms.Label();
            this.lblProc2 = new System.Windows.Forms.Label();
            this.lblProc1 = new System.Windows.Forms.Label();
            this.lblGLLinkHeader = new System.Windows.Forms.Label();
            this.lblInvoicesHeader = new System.Windows.Forms.Label();
            this.lblGLLinkEnd = new System.Windows.Forms.Label();
            this.lblGLLinkStart = new System.Windows.Forms.Label();
            this.lblEnd = new System.Windows.Forms.Label();
            this.lblStart = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.statusBar1.SuspendLayout();
            this.frameProcess.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // statusBar1
            // 
            this.statusBar1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.statusLabel});
            this.statusBar1.Location = new System.Drawing.Point(0, 428);
            this.statusBar1.Name = "statusBar1";
            this.statusBar1.Size = new System.Drawing.Size(610, 22);
            this.statusBar1.TabIndex = 0;
            this.statusBar1.Text = "statusStrip1";
            // 
            // statusLabel
            // 
            this.statusLabel.Name = "statusLabel";
            this.statusLabel.Size = new System.Drawing.Size(595, 17);
            this.statusLabel.Spring = true;
            this.statusLabel.Text = "Ready";
            this.statusLabel.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // timer1
            // 
            this.timer1.Interval = 1000;
            this.timer1.Tick += new System.EventHandler(this.Timer1_Tick);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(140, 340);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(81, 41);
            this.btnCancel.TabIndex = 1;
            this.btnCancel.Text = "&Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.BtnCancel_Click);
            // 
            // progressBarMain
            // 
            this.progressBarMain.Location = new System.Drawing.Point(240, 420);
            this.progressBarMain.Name = "progressBarMain";
            this.progressBarMain.Size = new System.Drawing.Size(346, 23);
            this.progressBarMain.TabIndex = 2;
            // 
            // progressBarGLLink
            // 
            this.progressBarGLLink.Location = new System.Drawing.Point(240, 471);
            this.progressBarGLLink.Name = "progressBarGLLink";
            this.progressBarGLLink.Size = new System.Drawing.Size(346, 23);
            this.progressBarGLLink.TabIndex = 3;
            this.progressBarGLLink.Visible = false;
            // 
            // frameProcess
            // 
            this.frameProcess.Controls.Add(this.txtPostProcess);
            this.frameProcess.Controls.Add(this.txtCallDetail);
            this.frameProcess.Controls.Add(this.txtRecalc);
            this.frameProcess.Controls.Add(this.txtStepInfo);
            this.frameProcess.Controls.Add(this.txtButton7);
            this.frameProcess.Controls.Add(this.txtButton5);
            this.frameProcess.Controls.Add(this.txtButton4);
            this.frameProcess.Controls.Add(this.txtButton3);
            this.frameProcess.Controls.Add(this.txtButton2);
            this.frameProcess.Controls.Add(this.txtButton1);
            this.frameProcess.Controls.Add(this.lblPostProcess);
            this.frameProcess.Controls.Add(this.lblRecalc);
            this.frameProcess.Controls.Add(this.lblCallDetail);
            this.frameProcess.Controls.Add(this.lblStepInfo);
            this.frameProcess.Controls.Add(this.lblProc7);
            this.frameProcess.Controls.Add(this.lblProc5);
            this.frameProcess.Controls.Add(this.lblProc4);
            this.frameProcess.Controls.Add(this.lblProc3);
            this.frameProcess.Controls.Add(this.lblProc2);
            this.frameProcess.Controls.Add(this.lblProc1);
            this.frameProcess.Location = new System.Drawing.Point(240, 10);
            this.frameProcess.Name = "frameProcess";
            this.frameProcess.Size = new System.Drawing.Size(351, 381);
            this.frameProcess.TabIndex = 4;
            this.frameProcess.TabStop = false;
            this.frameProcess.Text = "Process Nightly Invoices";
            // 
            // txtPostProcess
            // 
            this.txtPostProcess.BackColor = System.Drawing.SystemColors.Control;
            this.txtPostProcess.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtPostProcess.Font = new System.Drawing.Font("Wingdings", 6F);
            this.txtPostProcess.Location = new System.Drawing.Point(10, 310);
            this.txtPostProcess.Name = "txtPostProcess";
            this.txtPostProcess.ReadOnly = true;
            this.txtPostProcess.Size = new System.Drawing.Size(41, 11);
            this.txtPostProcess.TabIndex = 19;
            this.txtPostProcess.Text = "l";
            this.txtPostProcess.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtCallDetail
            // 
            this.txtCallDetail.BackColor = System.Drawing.SystemColors.Control;
            this.txtCallDetail.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtCallDetail.Font = new System.Drawing.Font("Wingdings", 6F);
            this.txtCallDetail.Location = new System.Drawing.Point(10, 250);
            this.txtCallDetail.Name = "txtCallDetail";
            this.txtCallDetail.ReadOnly = true;
            this.txtCallDetail.Size = new System.Drawing.Size(41, 11);
            this.txtCallDetail.TabIndex = 18;
            this.txtCallDetail.Text = "l";
            this.txtCallDetail.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtRecalc
            // 
            this.txtRecalc.BackColor = System.Drawing.SystemColors.Control;
            this.txtRecalc.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtRecalc.Font = new System.Drawing.Font("Wingdings", 6F);
            this.txtRecalc.Location = new System.Drawing.Point(10, 270);
            this.txtRecalc.Name = "txtRecalc";
            this.txtRecalc.ReadOnly = true;
            this.txtRecalc.Size = new System.Drawing.Size(41, 11);
            this.txtRecalc.TabIndex = 17;
            this.txtRecalc.Text = "l";
            this.txtRecalc.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtStepInfo
            // 
            this.txtStepInfo.BackColor = System.Drawing.SystemColors.Control;
            this.txtStepInfo.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtStepInfo.Font = new System.Drawing.Font("Wingdings", 6F);
            this.txtStepInfo.Location = new System.Drawing.Point(10, 30);
            this.txtStepInfo.Name = "txtStepInfo";
            this.txtStepInfo.ReadOnly = true;
            this.txtStepInfo.Size = new System.Drawing.Size(41, 11);
            this.txtStepInfo.TabIndex = 16;
            this.txtStepInfo.Text = "l";
            this.txtStepInfo.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtButton7
            // 
            this.txtButton7.BackColor = System.Drawing.SystemColors.Control;
            this.txtButton7.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtButton7.Font = new System.Drawing.Font("Wingdings", 6F);
            this.txtButton7.Location = new System.Drawing.Point(10, 210);
            this.txtButton7.Name = "txtButton7";
            this.txtButton7.ReadOnly = true;
            this.txtButton7.Size = new System.Drawing.Size(41, 11);
            this.txtButton7.TabIndex = 15;
            this.txtButton7.Text = "l";
            this.txtButton7.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtButton5
            // 
            this.txtButton5.BackColor = System.Drawing.SystemColors.Control;
            this.txtButton5.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtButton5.Font = new System.Drawing.Font("Wingdings", 6F);
            this.txtButton5.Location = new System.Drawing.Point(10, 180);
            this.txtButton5.Name = "txtButton5";
            this.txtButton5.ReadOnly = true;
            this.txtButton5.Size = new System.Drawing.Size(41, 11);
            this.txtButton5.TabIndex = 14;
            this.txtButton5.Text = "l";
            this.txtButton5.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtButton4
            // 
            this.txtButton4.BackColor = System.Drawing.SystemColors.Control;
            this.txtButton4.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtButton4.Font = new System.Drawing.Font("Wingdings", 6F);
            this.txtButton4.Location = new System.Drawing.Point(10, 150);
            this.txtButton4.Name = "txtButton4";
            this.txtButton4.ReadOnly = true;
            this.txtButton4.Size = new System.Drawing.Size(41, 11);
            this.txtButton4.TabIndex = 13;
            this.txtButton4.Text = "l";
            this.txtButton4.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtButton3
            // 
            this.txtButton3.BackColor = System.Drawing.SystemColors.Control;
            this.txtButton3.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtButton3.Font = new System.Drawing.Font("Wingdings", 6F);
            this.txtButton3.Location = new System.Drawing.Point(10, 120);
            this.txtButton3.Name = "txtButton3";
            this.txtButton3.ReadOnly = true;
            this.txtButton3.Size = new System.Drawing.Size(41, 11);
            this.txtButton3.TabIndex = 12;
            this.txtButton3.Text = "l";
            this.txtButton3.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtButton2
            // 
            this.txtButton2.BackColor = System.Drawing.SystemColors.Control;
            this.txtButton2.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtButton2.Font = new System.Drawing.Font("Wingdings", 6F);
            this.txtButton2.Location = new System.Drawing.Point(10, 90);
            this.txtButton2.Name = "txtButton2";
            this.txtButton2.ReadOnly = true;
            this.txtButton2.Size = new System.Drawing.Size(41, 11);
            this.txtButton2.TabIndex = 11;
            this.txtButton2.Text = "l";
            this.txtButton2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtButton1
            // 
            this.txtButton1.BackColor = System.Drawing.SystemColors.Control;
            this.txtButton1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtButton1.Font = new System.Drawing.Font("Wingdings", 6F);
            this.txtButton1.Location = new System.Drawing.Point(10, 60);
            this.txtButton1.Name = "txtButton1";
            this.txtButton1.ReadOnly = true;
            this.txtButton1.Size = new System.Drawing.Size(41, 11);
            this.txtButton1.TabIndex = 10;
            this.txtButton1.Text = "l";
            this.txtButton1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblPostProcess
            // 
            this.lblPostProcess.AutoSize = true;
            this.lblPostProcess.Location = new System.Drawing.Point(60, 300);
            this.lblPostProcess.Name = "lblPostProcess";
            this.lblPostProcess.Size = new System.Drawing.Size(101, 15);
            this.lblPostProcess.TabIndex = 9;
            this.lblPostProcess.Text = "Post Processing";
            // 
            // lblRecalc
            // 
            this.lblRecalc.AutoSize = true;
            this.lblRecalc.Location = new System.Drawing.Point(60, 270);
            this.lblRecalc.Name = "lblRecalc";
            this.lblRecalc.Size = new System.Drawing.Size(101, 15);
            this.lblRecalc.TabIndex = 8;
            this.lblRecalc.Text = "Recalc Invoices";
            // 
            // lblCallDetail
            // 
            this.lblCallDetail.AutoSize = true;
            this.lblCallDetail.Location = new System.Drawing.Point(60, 240);
            this.lblCallDetail.Name = "lblCallDetail";
            this.lblCallDetail.Size = new System.Drawing.Size(111, 15);
            this.lblCallDetail.TabIndex = 7;
            this.lblCallDetail.Text = "Process CallDetail";
            // 
            // lblStepInfo
            // 
            this.lblStepInfo.AutoSize = true;
            this.lblStepInfo.Location = new System.Drawing.Point(60, 30);
            this.lblStepInfo.Name = "lblStepInfo";
            this.lblStepInfo.Size = new System.Drawing.Size(66, 15);
            this.lblStepInfo.TabIndex = 6;
            this.lblStepInfo.Text = "Setup EDI";
            // 
            // lblProc7
            // 
            this.lblProc7.AutoSize = true;
            this.lblProc7.Location = new System.Drawing.Point(60, 210);
            this.lblProc7.Name = "lblProc7";
            this.lblProc7.Size = new System.Drawing.Size(181, 15);
            this.lblProc7.TabIndex = 5;
            this.lblProc7.Text = "Process Cost Allocations";
            // 
            // lblProc5
            // 
            this.lblProc5.AutoSize = true;
            this.lblProc5.Location = new System.Drawing.Point(60, 180);
            this.lblProc5.Name = "lblProc5";
            this.lblProc5.Size = new System.Drawing.Size(181, 15);
            this.lblProc5.TabIndex = 4;
            this.lblProc5.Text = "Pre Allocation Processing";
            // 
            // lblProc4
            // 
            this.lblProc4.AutoSize = true;
            this.lblProc4.Location = new System.Drawing.Point(60, 150);
            this.lblProc4.Name = "lblProc4";
            this.lblProc4.Size = new System.Drawing.Size(191, 15);
            this.lblProc4.TabIndex = 3;
            this.lblProc4.Text = "Process Manual Invoices";
            // 
            // lblProc3
            // 
            this.lblProc3.AutoSize = true;
            this.lblProc3.Location = new System.Drawing.Point(60, 120);
            this.lblProc3.Name = "lblProc3";
            this.lblProc3.Size = new System.Drawing.Size(211, 15);
            this.lblProc3.TabIndex = 2;
            this.lblProc3.Text = "Process Manual Exception Invoices";
            // 
            // lblProc2
            // 
            this.lblProc2.AutoSize = true;
            this.lblProc2.Location = new System.Drawing.Point(60, 90);
            this.lblProc2.Name = "lblProc2";
            this.lblProc2.Size = new System.Drawing.Size(191, 15);
            this.lblProc2.TabIndex = 1;
            this.lblProc2.Text = "Process EDI Invoices";
            // 
            // lblProc1
            // 
            this.lblProc1.AutoSize = true;
            this.lblProc1.Location = new System.Drawing.Point(60, 60);
            this.lblProc1.Name = "lblProc1";
            this.lblProc1.Size = new System.Drawing.Size(211, 15);
            this.lblProc1.TabIndex = 0;
            this.lblProc1.Text = "Process EDI Exception Invoices";
            // 
            // lblGLLinkHeader
            // 
            this.lblGLLinkHeader.Location = new System.Drawing.Point(290, 450);
            this.lblGLLinkHeader.Name = "lblGLLinkHeader";
            this.lblGLLinkHeader.Size = new System.Drawing.Size(241, 15);
            this.lblGLLinkHeader.TabIndex = 5;
            this.lblGLLinkHeader.Text = "GLLinkIDs";
            this.lblGLLinkHeader.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.lblGLLinkHeader.Visible = false;
            // 
            // lblInvoicesHeader
            // 
            this.lblInvoicesHeader.Location = new System.Drawing.Point(290, 400);
            this.lblInvoicesHeader.Name = "lblInvoicesHeader";
            this.lblInvoicesHeader.Size = new System.Drawing.Size(241, 15);
            this.lblInvoicesHeader.TabIndex = 6;
            this.lblInvoicesHeader.Text = "Invoices";
            this.lblInvoicesHeader.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblGLLinkEnd
            // 
            this.lblGLLinkEnd.Location = new System.Drawing.Point(510, 450);
            this.lblGLLinkEnd.Name = "lblGLLinkEnd";
            this.lblGLLinkEnd.Size = new System.Drawing.Size(71, 15);
            this.lblGLLinkEnd.TabIndex = 7;
            this.lblGLLinkEnd.Text = "0";
            this.lblGLLinkEnd.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.lblGLLinkEnd.Visible = false;
            // 
            // lblGLLinkStart
            // 
            this.lblGLLinkStart.Location = new System.Drawing.Point(240, 450);
            this.lblGLLinkStart.Name = "lblGLLinkStart";
            this.lblGLLinkStart.Size = new System.Drawing.Size(41, 15);
            this.lblGLLinkStart.TabIndex = 8;
            this.lblGLLinkStart.Text = "0";
            this.lblGLLinkStart.Visible = false;
            // 
            // lblEnd
            // 
            this.lblEnd.Location = new System.Drawing.Point(510, 400);
            this.lblEnd.Name = "lblEnd";
            this.lblEnd.Size = new System.Drawing.Size(71, 15);
            this.lblEnd.TabIndex = 9;
            this.lblEnd.Text = "0";
            this.lblEnd.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lblStart
            // 
            this.lblStart.Location = new System.Drawing.Point(240, 400);
            this.lblStart.Name = "lblStart";
            this.lblStart.Size = new System.Drawing.Size(41, 15);
            this.lblStart.TabIndex = 10;
            this.lblStart.Text = "0";
            // 
            // pictureBox1
            // 
            this.pictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pictureBox1.Location = new System.Drawing.Point(20, 10);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(201, 321);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 11;
            this.pictureBox1.TabStop = false;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(610, 450);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lblStart);
            this.Controls.Add(this.lblEnd);
            this.Controls.Add(this.lblGLLinkStart);
            this.Controls.Add(this.lblGLLinkEnd);
            this.Controls.Add(this.lblInvoicesHeader);
            this.Controls.Add(this.lblGLLinkHeader);
            this.Controls.Add(this.frameProcess);
            this.Controls.Add(this.progressBarGLLink);
            this.Controls.Add(this.progressBarMain);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.statusBar1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Invoice Nightly Batch Program";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.statusBar1.ResumeLayout(false);
            this.statusBar1.PerformLayout();
            this.frameProcess.ResumeLayout(false);
            this.frameProcess.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.StatusStrip statusBar1;
        private System.Windows.Forms.ToolStripStatusLabel statusLabel;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.ProgressBar progressBarMain;
        private System.Windows.Forms.ProgressBar progressBarGLLink;
        private System.Windows.Forms.GroupBox frameProcess;
        private System.Windows.Forms.TextBox txtPostProcess;
        private System.Windows.Forms.TextBox txtCallDetail;
        private System.Windows.Forms.TextBox txtRecalc;
        private System.Windows.Forms.TextBox txtStepInfo;
        private System.Windows.Forms.TextBox txtButton7;
        private System.Windows.Forms.TextBox txtButton5;
        private System.Windows.Forms.TextBox txtButton4;
        private System.Windows.Forms.TextBox txtButton3;
        private System.Windows.Forms.TextBox txtButton2;
        private System.Windows.Forms.TextBox txtButton1;
        private System.Windows.Forms.Label lblPostProcess;
        private System.Windows.Forms.Label lblRecalc;
        private System.Windows.Forms.Label lblCallDetail;
        private System.Windows.Forms.Label lblStepInfo;
        private System.Windows.Forms.Label lblProc7;
        private System.Windows.Forms.Label lblProc5;
        private System.Windows.Forms.Label lblProc4;
        private System.Windows.Forms.Label lblProc3;
        private System.Windows.Forms.Label lblProc2;
        private System.Windows.Forms.Label lblProc1;
        private System.Windows.Forms.Label lblGLLinkHeader;
        private System.Windows.Forms.Label lblInvoicesHeader;
        private System.Windows.Forms.Label lblGLLinkEnd;
        private System.Windows.Forms.Label lblGLLinkStart;
        private System.Windows.Forms.Label lblEnd;
        private System.Windows.Forms.Label lblStart;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}