$state_file = "$($args[0])\next_state.txt"
$next_state = Get-Content $state_file -First 1

Write-Host "Set Network-Adapters to state '$($next_state)'"

foreach ($NetAdapter in Get-NetAdapter) {
	if ($next_state -eq "on") {
		Enable-NetAdapter -Name $NetAdapter.Name -IncludeHidden -Confirm:$false
	} else {
		Disable-NetAdapter -Name $NetAdapter.Name -IncludeHidden -Confirm:$false
	}
}

if ($next_state -eq "on") {
	Out-File -FilePath $state_file -InputObject "off" -Encoding ASCII
} else {
	Out-File -FilePath $state_file -InputObject "on" -Encoding ASCII
}