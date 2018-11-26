$pushcontent = Get-ChildItem C:\erecruit -Recurse 
If ($erefolder = Get-ChildItem -Recurse | Where-Object { $_.DirectoryName -match 'erecruitservices' }) {
	robocopy $pushcontent $erefolder /MIR /E /V /xf *.config /xd AppData
}

elseif ($Busfolder = Get-ChildItem -Path D:\Buslistener) {
	robocopy $pushcontent $Busfolder /MIR /E /V /xf *.config /xd AppData
}

