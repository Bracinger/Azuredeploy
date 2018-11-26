$SourceDocs = Get-ChildItem –Path D:\test1 | where-object {$_.Extension -ne ".config"} | foreach  {Get-FileHash –Path $_.FullName}
$DestDocs = Get-ChildItem –Path D:\test2 | where-object {$_.Extension -ne ".config"} | foreach  {Get-FileHash –Path $_.FullName}
(Compare-Object -ReferenceObject $SourceDocs -DifferenceObject $DestDocs  -Property hash -PassThru).Path 
foreach ($file in $SourceDocs) {
    Write-Host
    Write-Host File Name: -ForegroundColor DarkYellow
    Write-Host $file.Name
    Write-Host File Path: -ForegroundColor DarkYellow
    Write-Host $file.FullName

    $SourceDocs = $file.FullName
    $DestDocs = "D:\test2\$($file.Name)"
    Copy-Item $SourceDocs $SourceDocs
}