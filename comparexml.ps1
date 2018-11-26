$f1=get-content -Path D:\test.xml
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
}
set-content -path D:\resultFile.txt -value $result
$content=Get-Content -Path D:\resultFile.txt 
echo $content
pause