# PLInvBatch - C# Migration

This project represents the successful migration of the PLInvBatch application from Visual Basic 6.0 to C# .NET 8.0.

## Overview

PLInvBatch is a ProfitLab Invoice Nightly Batch Application that processes various types of invoices including EDI invoices, manual invoices, cost allocations, call details, and post-processing operations.

## Migration Summary

### What was migrated:
- **Main Form (frmMain.frm)** → `MainForm.cs` + `MainForm.Designer.cs`
- **INI Functions Module (modIniFunctions.bas)** → `IniFileHelper.cs`
- **Application Entry Point** → `Program.cs`
- **Logging Functionality** → `ApplicationEventLog.cs`

### Key Features Preserved:
- ✅ Multiple processing modes (Full, CostOnly, ManualOnly, CallDetailOnly, RecalcOnly, PostProcessing)
- ✅ Progress tracking with visual indicators
- ✅ Email notifications for batch status
- ✅ Error handling and logging
- ✅ INI file configuration support
- ✅ Single instance application enforcement
- ✅ COM interop with existing PLInvBus.dll business logic
- ✅ Command-line argument processing

## Architecture Changes

### VB6 → C# Equivalents

| VB6 Component | C# Equivalent | Notes |
|---------------|---------------|-------|
| `App.LogEvent` | `ApplicationEventLog.LogEvent()` | Enhanced with file and Windows Event Log support |
| `ReadBatchIniString()` | `IniFileHelper.ReadBatchIniString()` | Uses Windows API via P/Invoke |
| `WithEvents` objects | `dynamic` objects with event handling | COM interop maintained |
| `Timer1_Timer` | `Timer1_Tick` event | Standard .NET Timer component |
| VB6 Forms | Windows Forms | Maintained similar UI layout |

### Modern C# Features Used:
- **Nullable reference types** for better null safety
- **Using statements** for proper resource disposal
- **Pattern matching** for exception handling
- **String interpolation** for cleaner string formatting
- **Regions** for better code organization
- **Exception handling** with proper error propagation

## Project Structure

```
PLInvBatch/
├── Program.cs                 # Application entry point
├── MainForm.cs               # Main form logic
├── MainForm.Designer.cs      # Form designer code
├── ApplicationEventLog.cs    # Logging utilities
├── IniFileHelper.cs         # INI file reading functionality
├── PLInvBatch.csproj        # Project file
└── README.md               # This file
```

## Dependencies

### NuGet Packages:
- `System.Data.SqlClient` (4.8.5) - Database connectivity
- `System.Configuration.ConfigurationManager` (8.0.0) - Configuration management

### External Dependencies:
- `PLInvBus.dll` - Business logic layer (COM component)
- `PLInvDB.ini` - Configuration file (must be in application directory)

## Command Line Arguments

The application supports the same command-line arguments as the original VB6 version:

- **No arguments**: Full batch processing
- **`costonly`**: Process cost allocations only
- **`manualonly`**: Process manual invoices only
- **`calldetailonly`**: Process call details only
- **`recalconly`**: Process invoice recalculations only
- **`postprocessing`**: Post-processing only
- **`/bid=<id>`**: Process specific invoice by BillerInvoiceID

## Configuration

The application reads configuration from `PLInvDB.ini` file located in the application directory.

### Key Configuration Sections:
```ini
[Logging]
WriteBatchProcesstoFile=true

[Database]
ConnectionString=...

[Email]
SMTPServer=...
```

## Building and Deployment

### Prerequisites:
- .NET 8.0 SDK or later
- Windows operating system
- PLInvBus.dll registered as COM component

### Build Instructions:
```bash
# Restore dependencies
dotnet restore

# Build the application
dotnet build --configuration Release

# Publish for deployment
dotnet publish --configuration Release --self-contained true --runtime win-x64
```

### Deployment Notes:
1. Ensure `PLInvBus.dll` is registered on the target system
2. Copy `PLInvDB.ini` to the application directory
3. Verify database connectivity and email configuration
4. Test with command-line arguments before scheduling

## Key Improvements Over VB6

### Performance:
- ✅ Better memory management with automatic garbage collection
- ✅ Improved exception handling with structured error information
- ✅ More efficient string operations

### Maintainability:
- ✅ Modern IDE support with IntelliSense
- ✅ Better debugging capabilities
- ✅ Structured code organization with regions and namespaces
- ✅ Type safety with nullable reference types

### Reliability:
- ✅ Proper resource disposal with `using` statements
- ✅ Comprehensive error logging
- ✅ Better COM object lifetime management

## Migration Notes

### COM Interop Considerations:
- The application maintains compatibility with the existing `PLInvBus.dll` COM component
- COM objects are properly disposed to prevent memory leaks
- Dynamic typing is used for COM method calls to maintain flexibility

### UI Fidelity:
- The Windows Forms UI closely matches the original VB6 interface
- Progress indicators use the same Wingdings font for visual consistency
- Form layout and control positioning preserved

### Behavioral Compatibility:
- All original processing modes are supported
- Email notifications maintain the same format and recipients
- Error handling produces similar log entries
- INI file reading behavior is identical

## Testing Recommendations

1. **Functional Testing**: Verify each processing mode works correctly
2. **Integration Testing**: Test COM component interaction
3. **Error Handling**: Test various error scenarios
4. **Performance Testing**: Compare processing times with VB6 version
5. **Deployment Testing**: Verify application works on target servers

## Future Enhancements

Potential improvements for future versions:
- Replace COM components with native .NET implementations
- Add async/await for better responsiveness
- Implement dependency injection for better testability
- Add configuration via appsettings.json
- Enhance logging with structured logging frameworks
- Add unit tests for business logic

## Support

For questions or issues related to this migration, please refer to:
- Original VB6 documentation for business logic understanding
- .NET 8.0 documentation for framework-specific questions
- COM interop documentation for integration issues