Import-Module activedirectory
$computers = Get-ADComputers -Filter {(Get-WmiObject Win32_OperatingSystem).Name -like "*Windows Server*"}
foreach ($computer in $computers){
	$1 = "\\" + "$_.Name" + "\erecruit\erecruitservices"
	$2 = "\\" + "$_.Name" + "\erecruit\ServiceBus"
	$3 = "\\" + "$_.Name" + "\erecruit\srch1"
	$4 = "\\" + "$_.Name" + "\erecruit\dispatch"
	if ($computer.Name -like "*BE*"){
	 robocopy C:\erecruit D:\erecruitservices /MIR /PURGE /E /V /xf *.config *.odt *.pdf /xd AppData $3 $2 Logs
	}

	elseif ($computer.Name -like "*WEB*"){
		robocopy C:\erecruit D:\erecruitservices /MIR /PURGE /E /V /xf *.config *.odt *.pdf /xd AppData $1 $4 Logs
		}









	}