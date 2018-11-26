# login
Login-AzureRmAccount
# perform other Azure operations...

$currentAzureContext = Get-AzureRmContext
$tenantId = $currentAzureContext.Tenant.Id
$accountId = $currentAzureContext.Account.Id
Connect-AzureAD -TenantId $tenantId -AccountId $accountId