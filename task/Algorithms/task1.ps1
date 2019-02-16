
$input = (Get-Content "C:\Users\Dell-Inspiron\Desktop\task\Algorithms\task1")
$circularInput = $input.substring(0,1);
[int]$result=0
[int]$counter=0

For($i=0;$i -le $input.Length-1;$i++)
{
$lastInput=$item[$input.Length-1]
    if($item[$i] -eq $item[$i+1])
    {
    $result=[int]::Parse($item[$i]) + [int]::Parse($item[$i+1])                                                      
    [int]$counter=$i+2
        if($item[$i] -eq $item[$counter]){
            do{
                [int]$result=[int]::Parse($result) +[int]::Parse($item[$counter])
                $counter=$counter+1
            }while($item[$i] -eq $item[$counter])
        }
    $result
    }
}

if($lastInput -eq $circularInput)
{[int]$result=[int]::Parse($circularInput) + [int]::Parse($lastInput)}
$result
  

