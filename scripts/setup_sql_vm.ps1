param(
    [string]$dynaTraceId = "#{dynaTraceId}",
    [string]$dynaTraceToken = "#{dynaTraceToken}",
    [string]$msi = "#{msiUrl}"
)

.$PSScriptRoot\install-dynatrace.ps1 -dynaTraceId $dynaTraceId -dynaTraceToken $dynaTraceToken -msi $msi

.$PSScriptRoot\install-failoverclustering.ps1