
param(
    [string]$dynaTraceId = 'site id',
    [string]$dynaTraceToken = 'site token',
    [string]$msi = "url to msi file",
    [string]$server = "https://$dynaTraceId.live.dynatrace.com:443"
)

$fileName = $msi.Split('/')[-1]
Invoke-WebRequest -Uri $msi -OutFile $fileName

if ($?){
    $DataStamp = get-date -Format yyyyMMddTHHmmss
    $logFile = '{0}-{1}.log' -f 'logfile',$DataStamp
    $MSIArguments = @(
        "/i"
        $fileName
        "/qn"
        "/norestart"
        "/L*v"
        $logFile
        "SERVER=$server"
        "TENANT=$dynaTraceId"
        "TENANT_TOKEN=$dynaTraceToken"
        "ALLOW_INFRASTRUCTURE_ONLY='0'"
        "ACTIVATE_HOST_GROUP='0'"
    )
    Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow

    if ($?){
        Remove-Item $fileName
    }
}



