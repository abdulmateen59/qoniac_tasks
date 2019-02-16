
[int]$checkSum=0

foreach($line in Get-Content C:\Users\Dell-Inspiron\Desktop\task\Algorithms\task2)
{
    if($line -match $regex)
    {
         $arr = $line.split()| where {$_}
          [int]$MaxValue=$arr[0]
          [int]$MinValue=$arr[0]
          
         For($i=0;$i -le $arr.Length-1;$i++)
         {
                if([int]$arr[$i] -gt $MaxValue)
                {
                   $MaxValue= $arr[$i]
                }
                if([int]$arr[$i] -lt $MinValue)
                {
                 $MinValue= $arr[$i]
                }   
          }

       "------------------------------"
       write-host   "MAX is:",$MaxValue
       write-host   "Min is:",$MinValue     
       "------------------------------"
    } 
    [int]$diff=$MaxValue - $MinValue
    $checkSum+=$diff
}

Write-Host "Check Sum Result = ",$checkSum

