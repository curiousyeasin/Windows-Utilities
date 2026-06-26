::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFCJRTReLMleeCaIS5Of66/m7sVQRWOM9bZzn2buANuUB/kznetsk1XVUi5NBDxRWbR2na0Jt/yBLtWvl
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAjk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCJRTReLMleeA6YX/Ofr09qk72kUVeUxd5zP07edbdQc5UmqcI4otg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off


powershell -NoProfile -Command ^
"Write-Host '========================================' -ForegroundColor DarkGreen; ^
Write-Host '      PC Diagnostic Tool v1.0' -ForegroundColor Green; ^
Write-Host '========================================' -ForegroundColor DarkGreen; ^
Write-Host 'Developed by: Md Yeasin' -ForegroundColor White; ^
Write-Host 'GitHub: github.com/curiousyeasin' -ForegroundColor Cyan; ^
Write-Host ''"

REM Write-Host 'Website: yourwebsite.com' -ForegroundColor Cyan; ^
REM Write-Host 'License: MIT' -ForegroundColor White; ^

echo(
powershell -NoProfile -Command ^
"Write-Host '======================================' -ForegroundColor DarkGreen; ^
Write-Host '          SCRIPT STARTED' -ForegroundColor Green; ^
Write-Host '======================================' -ForegroundColor DarkGreen"

echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Write-Host 'PowerShell is working'"


systeminfo > systeminfo.txt

echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        General Info' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"

findstr /C:"OS Name" systeminfo.txt
findstr /C:"OS Version" systeminfo.txt
findstr /C:"OS Manufacturer" systeminfo.txt
findstr /C:"OS Configuration" systeminfo.txt
findstr /C:"OS Build Type" systeminfo.txt
findstr /C:"Registered Owner" systeminfo.txt
findstr /C:"Product ID" systeminfo.txt
findstr /C:"Original Install Date" systeminfo.txt
findstr /C:"System Boot Time" systeminfo.txt
findstr /C:"System Model" systeminfo.txt
findstr /C:"System Type" systeminfo.txt


echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        Processor(CPU) Info' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"


findstr /C:"Processor(s)" systeminfo.txt
powershell -Command "Write-Host 'Processor Name:' (Get-CimInstance Win32_Processor).Name"
powershell -Command "Write-Host 'Cores:' (Get-CimInstance Win32_Processor).NumberOfCores"
powershell -Command "Write-Host 'Threads:' (Get-CimInstance Win32_Processor).NumberOfLogicalProcessors"
powershell -Command "$cpu=Get-CimInstance Win32_Processor; Write-Host 'Max Clock Speed:' ([math]::Round($cpu.MaxClockSpeed/1000,2)) 'GHz'"
powershell -Command "Write-Host 'L2 Cache:' (Get-CimInstance Win32_Processor).L2CacheSize 'KB'"
powershell -Command "Write-Host 'L3 Cache:' (Get-CimInstance Win32_Processor).L3CacheSize 'KB'"


echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        RAM Info' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"
powershell -Command "$ram=Get-CimInstance Win32_ComputerSystem; Write-Host 'Total RAM:' ([math]::Round($ram.TotalPhysicalMemory/1GB,2)) 'GB'"

powershell -Command ^
"$type=(Get-CimInstance Win32_PhysicalMemory).SMBIOSMemoryType; ^
if($type -eq 20){$ram='DDR'} ^
elseif($type -eq 21){$ram='DDR2'} ^
elseif($type -eq 24){$ram='DDR3'} ^
elseif($type -eq 26){$ram='DDR4'} ^
elseif($type -eq 34){$ram='DDR5'} ^
else{$ram='Unknown'}; ^
Write-Host 'RAM Type:' $ram"
powershell -Command "Write-Host 'Total RAM Sticks:' (Get-CimInstance Win32_PhysicalMemory).Count"

echo(
powershell -Command ^
"$rams=Get-CimInstance Win32_PhysicalMemory; ^
$i=1; ^
foreach($ram in $rams){ ^
Write-Host ('Stick #{0}:' -f $i); ^
Write-Host ('  Size         : {0} GB' -f [math]::Round($ram.Capacity/1GB,0)); ^
Write-Host ('  Speed        : {0} MHz' -f $ram.Speed); ^
Write-Host ('  Manufacturer : {0}' -f $ram.Manufacturer); ^
Write-Host ('  Serial Number: {0}' -f $ram.SerialNumber); ^
Write-Host ''; ^
$i++ ^
}"


echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        Virtual Memory Info' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"

findstr /C:"Available Physical Memory" systeminfo.txt
findstr /C:"Virtual Memory: Max Size" systeminfo.txt
findstr /C:"Virtual Memory: Available" systeminfo.txt
findstr /C:"Virtual Memory: In Use" systeminfo.txt
findstr /C:"Network Card(s)" systeminfo.txt
findstr /C:"Hyper-V Requirements" systeminfo.txt
findstr /C:"VM Monitor Mode Extensions" systeminfo.txt
findstr /C:"Virtualization Enabled In Firmware" systeminfo.txt


echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        Storage Info' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"
powershell -Command "Get-Disk | Select Number, FriendlyName, @{Name='Size(GB)';Expression={[math]::Round($_.Size/1GB,2)}}, SerialNumber, HealthStatus, OperationalStatus | Format-Table -AutoSize"



echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        Storage Partition Info' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"
powershell -Command "Get-Volume | Select DriveLetter, FileSystem, HealthStatus, @{Name='Free Space';Expression={if($_.SizeRemaining -ge 1TB){'{0:N2} TB' -f ($_.SizeRemaining/1TB)}else{'{0:N2} GB' -f ($_.SizeRemaining/1GB)}}}, @{Name='Total Size';Expression={if($_.Size -ge 1TB){'{0:N2} TB' -f ($_.Size/1TB)}else{'{0:N2} GB' -f ($_.Size/1GB)}}} | Format-Table -AutoSize"

echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        GPU Info' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"
powershell -NoProfile -Command "Get-CimInstance Win32_VideoController | ForEach-Object { $parts=$_.VideoModeDescription -split ' x '; $resolution=$parts[0]+' x '+$parts[1]; $colors=$parts[2] -replace ' colors',''; switch($colors){ '256'{$depth='8-bit'} '65536'{$depth='16-bit'} '16777216'{$depth='24-bit'} '4294967296'{$depth='32-bit'} default{$depth=$colors+' colors'} }; Write-Host 'GPU:' $_.Name; Write-Host 'Chipset:' $_.VideoProcessor; Write-Host 'VRAM:' ('{0:N2} GB' -f ($_.AdapterRAM/1GB)); Write-Host 'Driver Version:' $_.DriverVersion; Write-Host 'Driver Date:' ($_.DriverDate.ToString('yyyy-MM-dd')); Write-Host 'Resolution:' $resolution; Write-Host 'Color Depth:' $depth; Write-Host 'Refresh Rate:' ($_.CurrentRefreshRate.ToString() + ' Hz'); Write-Host '' }"


echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        Monitor Info' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"

choice /C YN /M "Do you want to display monitor information?"

if errorlevel 2 (
    echo Monitor Info Skipped.
) else (
    powershell -NoProfile -Command "Get-CimInstance -Namespace root\wmi WmiMonitorID | ForEach-Object { $m=(($_.ManufacturerName | Where-Object { $_ -ne 0 } | ForEach-Object { [char]$_ }) -join ''); $n=(($_.UserFriendlyName | Where-Object { $_ -ne 0 } | ForEach-Object { [char]$_ }) -join ''); $s=(($_.SerialNumberID | Where-Object { $_ -ne 0 } | ForEach-Object { [char]$_ }) -join ''); Write-Host 'Monitor Name:' $n; Write-Host 'Manufacturer:' $m; Write-Host 'Serial Number:' $s; Write-Host 'Manufactured:' ('Week {0}, {1}' -f $_.WeekOfManufacture,$_.YearOfManufacture); Write-Host ''; }; Get-CimInstance Win32_VideoController | ForEach-Object { Write-Host 'Resolution:' ($_.CurrentHorizontalResolution.ToString() + ' x ' + $_.CurrentVerticalResolution); Write-Host 'Refresh Rate:' ($_.CurrentRefreshRate.ToString() + ' Hz') }"
)


echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        Internet Info' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"

choice /C YN /M "Do you want to display internet information?"

if errorlevel 2 (
    echo Internet Info Skipped.
) else (
    powershell -NoProfile -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Write-Host 'Adapter:' $_.Name; Write-Host 'Description:' $_.InterfaceDescription; Write-Host 'MAC Address:' $_.MacAddress; Write-Host 'Link Speed:' $_.LinkSpeed; Write-Host '' }; Get-NetIPConfiguration | Where-Object {$_.IPv4Address} | ForEach-Object { Write-Host 'IPv4 Address:' $_.IPv4Address.IPAddress; Write-Host 'Default Gateway:' $_.IPv4DefaultGateway.NextHop; Write-Host 'DNS Server(s):' ($_.DNSServer.ServerAddresses -join ', '); Write-Host '' }; if(Test-Connection google.com -Count 1 -Quiet){Write-Host 'Internet Status: Connected'} else {Write-Host 'Internet Status: Not Connected'}"
)



echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        Battery Info' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"

powershell -NoProfile -ExecutionPolicy Bypass -Command "$isLaptop = (Get-CimInstance Win32_SystemEnclosure).ChassisTypes -match '8|9|10|14|30'; if($isLaptop){Write-Host 'Device Type: Laptop'} else {Write-Host 'Device Type: Desktop'}"

echo.

choice /C YN /M "Generate battery report?"

if errorlevel 2 goto skip

powercfg /batteryreport /output "%USERPROFILE%\battery-report.html" >nul
echo Battery report generated at: %USERPROFILE%\battery-report.html
echo Opening Battery Report...
timeout /t 2 >nul
start "" "%USERPROFILE%\battery-report.html"
goto end

:skip
echo Battery report skipped

:end

echo(
powershell -Command ^
"Write-Host '======================================' -ForegroundColor green; ^
Write-Host '        Windows Activation Status' -ForegroundColor Red; ^
Write-Host '======================================' -ForegroundColor green"

choice /C YN /M "Check Windows activation status?"

echo(
if errorlevel 2 goto skip
powershell -NoProfile -Command "Get-CimInstance SoftwareLicensingProduct | Where-Object {$_.PartialProductKey} | ForEach-Object { $status = switch ($_.LicenseStatus) { 0 {'Unlicensed'} 1 {'Activated'} 2 {'Initial Grace'} 3 {'Additional Grace'} 4 {'Non-Genuine Grace'} 5 {'Notification (Not Activated Properly)'} 6 {'Extended Grace'} default {'Unknown'} }; Write-Host ('Name: {0} | Status: {1}' -f $_.Name, $status) }"

goto end

:skip
echo Activation check skipped.

:end


echo.
powershell -NoProfile -Command ^
"Write-Host '======================================' -ForegroundColor White; ^
Write-Host '        SYSTEM REPORT COMPLETE' -ForegroundColor Cyan; ^
Write-Host '======================================' -ForegroundColor White"
echo.
choice /C YN /M "Do you want to close this window?"

if errorlevel 2 goto stay

exit

:stay
echo Window will remain open.
pause >nul






