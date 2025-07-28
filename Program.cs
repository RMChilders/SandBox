using System;
using System.Threading;
using System.Windows.Forms;

namespace PLInvBatch
{
    internal static class Program
    {
        private const int ERROR_ALREADY_EXISTS = 183;
        private static Mutex? applicationMutex;

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            // Check if application is already running (similar to VB6 CreateMutex)
            bool createdNew;
            applicationMutex = new Mutex(true, "PLInvBatch", out createdNew);

            if (!createdNew)
            {
                // Application is already running
                MessageBox.Show("PLInvBatch is already running.", "Application Already Running", 
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            try
            {
                // Initialize logging
                ApplicationEventLog.Initialize();
                
                // Pass command line arguments to the main form
                string commandLine = string.Join(" ", args);
                Application.Run(new MainForm(commandLine));
            }
            catch (Exception ex)
            {
                ApplicationEventLog.LogError($"Application startup error: {ex.Message}", ex);
                MessageBox.Show($"Application startup error: {ex.Message}", "Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                applicationMutex?.ReleaseMutex();
                applicationMutex?.Dispose();
            }
        }
    }
}