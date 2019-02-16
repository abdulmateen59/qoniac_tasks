function Assemblycheck{

$projectFiles = get-childitem . MigratorConsole.csproj -Recurse 

foreach( $projectFile in $projectFiles )
{
    $Xml = [xml] (get-content $projectFile.FullName)
    

    foreach( $itemGroup in $Xml.Project.ItemGroup )
    {
        if( $itemGroup.Reference.Count -eq 0 )
        {
            continue
        }

        foreach( $reference in $itemGroup.Reference )
        {
            if( $reference.Include -eq $null )
            {
                continue
            }

            if( $reference.HintPath -eq $null )
            {
             continue
            }
            else
            {
                if(Test-Path $reference.HintPath) 
                {
                    Write-Host $reference.HintPath, "Assembly Path is Valid."
                }
                else
                {     
                    Write-Host $reference.HintPath, "Assembly Path is Invalid."                       
                }
            }
        }
    }

}
}


Assemblycheck