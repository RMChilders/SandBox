using System;
using System.Diagnostics;
using System.IO;

namespace PLInvBatch
{
    /// <summary>
    /// Provides application event logging functionality similar to VB6's App.LogEvent
    /// </summary>
    public static class ApplicationEventLog
    {
        private static string? logFilePath;
        private static readonly object lockObject = new object();

        /// <summary>
        /// Initialize the logging system
        /// </summary>
        public static void Initialize()
        {
            try
            {
                string appPath = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) ?? "";
                logFilePath = Path.Combine(appPath, "ErrorLog.txt");
            }
            catch (Exception ex)
            {
                // Fallback to Windows Event Log if file logging fails
                EventLog.WriteEntry("PLInvBatch", $"Failed to initialize file logging: {ex.Message}", EventLogEntryType.Warning);
            }
        }

        /// <summary>
        /// Log an event message
        /// </summary>
        /// <param name="message">The message to log</param>
        public static void LogEvent(string message)
        {
            LogMessage(message, EventLogEntryType.Information);
        }

        /// <summary>
        /// Log an error message
        /// </summary>
        /// <param name="message">The error message</param>
        /// <param name="exception">Optional exception details</param>
        public static void LogError(string message, Exception? exception = null)
        {
            string fullMessage = message;
            if (exception != null)
            {
                fullMessage += $"\nException: {exception}";
            }
            LogMessage(fullMessage, EventLogEntryType.Error);
        }

        /// <summary>
        /// Log a warning message
        /// </summary>
        /// <param name="message">The warning message</param>
        public static void LogWarning(string message)
        {
            LogMessage(message, EventLogEntryType.Warning);
        }

        private static void LogMessage(string message, EventLogEntryType entryType)
        {
            string timestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string logEntry = $"[{timestamp}] {entryType}: {message}";

            // Log to file
            if (!string.IsNullOrEmpty(logFilePath))
            {
                try
                {
                    lock (lockObject)
                    {
                        File.AppendAllText(logFilePath, logEntry + Environment.NewLine);
                    }
                }
                catch
                {
                    // If file logging fails, fall back to Event Log
                    LogToEventLog(message, entryType);
                }
            }
            else
            {
                LogToEventLog(message, entryType);
            }

            // Also output to debug console in debug builds
            Debug.WriteLine(logEntry);
        }

        private static void LogToEventLog(string message, EventLogEntryType entryType)
        {
            try
            {
                EventLog.WriteEntry("PLInvBatch", message, entryType);
            }
            catch
            {
                // If all else fails, at least write to debug output
                Debug.WriteLine($"LOGGING FAILED: {message}");
            }
        }
    }
}