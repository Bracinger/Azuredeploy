<#$f1=get-content -Path D:\test.xml
$f2=get-content -Path D:\test2.xml

foreach ($objf1 in $f1)
{
                $objf1 = $objf1.tostring().Trim()
                $objf1 = $objf1.Replace(" ","")
                $objf1 = $objf1.ToUpper()
                $found = $false
                foreach ($objf2 in $f2)
                {
                               $objf2=$objf2.Replace(" ", "")
                               $objf2=$objf2.Trim()
                               $objf2=$objf2.ToUpper()        
                               if ($objf1 -eq $objf2)
                               {                                            
                                               $found = $true                               
                               }                             
                }
                if ((!$found) -and ($objf1 -ne ""))
                {
                               $result += $objf1.tostring().trim() + "`r`n"
                }
}#>
$newFiles = "D:\test1"
$oldFiles = "D:\test2"

Get-Filehash $newFiles | ForEach-Object {

    $currentFile = $_

    $oldFileLocation = Get-FileHash -Recurse $oldFiles | Where-Object { $_ -Match "$currentFile" -and $currentfile.Extension -ne ".config"} | Select-Object -ExpandProperty DirectoryName

    if($oldFileLocation) {   # if this variable is not null, we've found original file location
        Write-Host "found file [$currentFile] in location: [$oldFileLocation]. overwriting the original."
        Copy-Item -Path $newFiles\$currentFile -Destination $oldFileLocation -Force
    }
    else {
        Write-Warning "could not find file [$currentFile] in location [$oldFiles]."
    }

}
set-content -path D:\resultFile.txt -value $result
$content=Get-Content -Path D:\resultFile.txt 
echo $content
pause