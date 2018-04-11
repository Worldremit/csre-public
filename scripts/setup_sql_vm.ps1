param(
    [string]$dynaTraceId = "#{dynaTraceId}",
    [string]$dynaTraceToken = "#{dynaTraceToken}",
    [string]$msi = "#{msiUrl}"
)

Invoke-Expression $PSScriptRoot\install-dynatrace.ps1 $dynaTraceId $dynaTraceToken $msi

Invoke-Expression $PSScriptRoot\install-failoverclustering.ps1