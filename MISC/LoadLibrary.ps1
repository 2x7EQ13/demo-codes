Add-Type @"
using System;
using System.Runtime.InteropServices;

public class NativeMethods
{
    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern IntPtr LoadLibrary(string lpFileName);
}
"@
$libraryPath = "\\?\Long-Path\SampleDLL.dll"
$handle = [NativeMethods]::LoadLibrary($libraryPath)
if ($handle -eq [IntPtr]::Zero) {
    $error = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error()
    Write-Host "Failed to load library. Error code: $error"
} else {
    Write-Host "Library loaded successfully. Handle: $handle"
}
