# PLInvBatch C# Deployment Guide

## Pre-Deployment Checklist

### System Requirements
- [ ] Windows Server 2019 or later (or Windows 10/11 for testing)
- [ ] .NET 8.0 Runtime installed (or include with self-contained deployment)
- [ ] Access to SQL Server database
- [ ] Network access for email notifications
- [ ] Sufficient disk space for logs and temporary files

### Dependencies
- [ ] PLInvBus.dll is available and registered as COM component
- [ ] Database connection string is configured
- [ ] Email server settings are configured
- [ ] PLInvDB.ini configuration file is prepared

## Deployment Steps

### 1. Build the Application
```bash
# Option 1: Framework-dependent deployment (requires .NET 8.0 Runtime on target)
dotnet publish --configuration Release --runtime win-x64

# Option 2: Self-contained deployment (includes .NET runtime)
dotnet publish --configuration Release --self-contained true --runtime win-x64
```

### 2. Prepare Target Environment
1. Create application directory (e.g., `C:\PLInvBatch\`)
2. Copy published files to target directory
3. Copy `PLInvDB.ini` configuration file to application directory
4. Ensure PLInvBus.dll is registered:
   ```cmd
   regsvr32 "path\to\PLInvBus.dll"
   ```

### 3. Configure Application
1. Edit `PLInvDB.ini` with correct settings:
   - Database connection string
   - Email server settings
   - Report file paths
   - Logging preferences

2. Test configuration:
   ```cmd
   PLInvBatch.exe /testconfig
   ```

### 4. Security Configuration
- [ ] Grant appropriate file system permissions
- [ ] Configure database access permissions
- [ ] Set up service account if running as scheduled task
- [ ] Configure firewall rules for database and email access

### 5. Testing
- [ ] Test each processing mode manually:
  - `PLInvBatch.exe` (full batch)
  - `PLInvBatch.exe costonly`
  - `PLInvBatch.exe manualonly`
  - `PLInvBatch.exe calldetailonly`
  - `PLInvBatch.exe recalconly`
  - `PLInvBatch.exe postprocessing`
- [ ] Verify log files are created
- [ ] Confirm email notifications are sent
- [ ] Check database updates

### 6. Schedule Setup
Create scheduled task or use Task Scheduler:
```cmd
schtasks /create /tn "PLInvBatch" /tr "C:\PLInvBatch\PLInvBatch.exe" /sc daily /st 02:00
```

## Configuration File Reference

### Required Sections in PLInvDB.ini

```ini
[Logging]
WriteBatchProcesstoFile=true

[Database]
ConnectionString=Data Source=SERVER;Initial Catalog=DATABASE;Integrated Security=true

[Email]
SMTPServer=mail.company.com
FromAddress=batch@company.com
ToAddress=notifications@company.com
```

## Troubleshooting

### Common Issues

1. **COM Component Registration**
   - Error: "Cannot create COM object"
   - Solution: Re-register PLInvBus.dll with `regsvr32`

2. **Database Connection**
   - Error: "Cannot connect to database"
   - Solution: Verify connection string and SQL Server access

3. **File Permissions**
   - Error: "Access denied" when writing logs
   - Solution: Grant write permissions to application directory

4. **Email Issues**
   - Error: "Cannot send email"
   - Solution: Verify SMTP settings and network connectivity

### Log Locations
- Application logs: `ErrorLog.txt` in application directory
- Batch logs: `BatchLog.txt` in Logs subdirectory (if enabled)
- Windows Event Log: Application log with source "PLInvBatch"

## Monitoring

### Key Metrics to Monitor
- Batch completion status
- Processing time
- Error rates
- Email delivery status
- Database performance

### Recommended Monitoring
- Set up alerts for batch failures
- Monitor log file sizes
- Track processing performance trends
- Verify scheduled task execution

## Rollback Plan

In case of issues with the C# version:

1. Stop scheduled tasks
2. Restore VB6 version if needed
3. Verify data integrity
4. Resume operations with previous version
5. Investigate and fix C# version issues

## Performance Comparison

After deployment, compare with VB6 version:
- Processing time for each batch type
- Memory usage
- Error rates
- System resource utilization

Document any significant differences and optimize as needed.

## Support Contacts

- Development Team: [contact info]
- System Administration: [contact info]
- Database Team: [contact info]
- Business Users: [contact info]