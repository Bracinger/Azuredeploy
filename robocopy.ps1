$1 = Get-Item C:\erecruit\erecruitservices
$2 = Get-Item C:\erecruit\Buslistener
$3 = Get-Item C:\erecruit\srch1
robocopy C:\erecruit D:\erecruitservices /MIR /PURGE /E /V /xf *.config *.odt *.pdf /xd AppData $3 $2
