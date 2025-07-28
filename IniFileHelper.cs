using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;

namespace PLInvBatch
{
    /// <summary>
    /// Helper class for reading INI files, replacing the VB6 modIniFunctions module
    /// </summary>
    public static class IniFileHelper
    {
        [DllImport("kernel32.dll", CharSet = CharSet.Auto)]
        private static extern int GetPrivateProfileString(
            string lpApplicationName,
            string lpKeyName,
            string lpDefault,
            StringBuilder lpReturnedString,
            int nSize,
            string lpFileName);

        /// <summary>
        /// Reads a string value from an INI file
        /// Equivalent to the VB6 ReadBatchIniString function
        /// </summary>
        /// <param name="appName">The application name (not used in this implementation)</param>
        /// <param name="section">The section name in the INI file</param>
        /// <param name="key">The key name to read</param>
        /// <param name="defaultValue">Default value if key is not found</param>
        /// <returns>The value from the INI file or the default value</returns>
        public static string ReadBatchIniString(string appName, string section, string key, string defaultValue = "")
        {
            try
            {
                string appPath = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) ?? "";
                string iniFilePath = Path.Combine(appPath, "PLInvDB.ini");

                if (!File.Exists(iniFilePath))
                {
                    throw new FileNotFoundException($"INI file not found: {iniFilePath}");
                }

                StringBuilder returnedString = new StringBuilder(255);
                int result = GetPrivateProfileString(section, key, defaultValue, returnedString, 255, iniFilePath);

                return returnedString.ToString();
            }
            catch (Exception ex)
            {
                string errorMessage = $"ReadBatchIniString: {ex.Message}";
                ApplicationEventLog.LogError(errorMessage, ex);
                throw new ApplicationException(errorMessage, ex);
            }
        }

        /// <summary>
        /// Reads a boolean value from an INI file
        /// </summary>
        /// <param name="appName">The application name</param>
        /// <param name="section">The section name in the INI file</param>
        /// <param name="key">The key name to read</param>
        /// <param name="defaultValue">Default value if key is not found</param>
        /// <returns>The boolean value from the INI file</returns>
        public static bool ReadBatchIniBool(string appName, string section, string key, bool defaultValue = false)
        {
            string value = ReadBatchIniString(appName, section, key, defaultValue.ToString().ToLower());
            return string.Equals(value, "true", StringComparison.OrdinalIgnoreCase) ||
                   string.Equals(value, "1", StringComparison.OrdinalIgnoreCase) ||
                   string.Equals(value, "yes", StringComparison.OrdinalIgnoreCase);
        }

        /// <summary>
        /// Reads an integer value from an INI file
        /// </summary>
        /// <param name="appName">The application name</param>
        /// <param name="section">The section name in the INI file</param>
        /// <param name="key">The key name to read</param>
        /// <param name="defaultValue">Default value if key is not found</param>
        /// <returns>The integer value from the INI file</returns>
        public static int ReadBatchIniInt(string appName, string section, string key, int defaultValue = 0)
        {
            string value = ReadBatchIniString(appName, section, key, defaultValue.ToString());
            if (int.TryParse(value, out int result))
            {
                return result;
            }
            return defaultValue;
        }
    }
}