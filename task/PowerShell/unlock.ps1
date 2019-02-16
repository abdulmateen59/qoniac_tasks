function Unlock{
    param ([string]$filePath )
    $filelocked = $false
    $fileInfo = New-Object System.IO.FileInfo $filePath
    trap {
        Set-Variable -name filelocked -value $true -scope 1
        continue
    }
    $fileStream = $fileInfo.Open([System.IO.FileAccess]::ReadWrite)
    if ($fileStream) {
        $fileStream.Close()
    }

    write-host
    write-host "File Path <---------------> " , $filePath
    write-host "Locked?   <--------------->  "  , $filelocked
    Write-warning "----------------------------------------------------------------------------------"


     IF((Test-Path -Path $filePath) -eq $Null) 
     { 
       Write-host "File or directory does not exist."        
     } 
     else
     {
       $LockingProcess = CMD /C "openfiles /query /fo table | find /I ""$filePath""" 
       Write-Host $LockingProcess
       get-process $LockingProcess | stop-Process
     }

      
}





unlock "C:\Users\Dell-Inspiron\Desktop\task\PowerShell\test.docx"



