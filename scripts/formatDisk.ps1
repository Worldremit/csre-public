# Generic script to format the first available disk
param (
    [string]$driveLetter = 'L',
    [string]$driveLabel = 'logsDisk'
)

$disks = Get-Disk | Where partitionstyle -eq 'raw' | sort number

if ($disks) {
    write-output "Found a raw disk, formatting it as L:\ drive"
    $disks[0] |
    Initialize-Disk -PartitionStyle MBR -PassThru |
    New-Partition -UseMaximumSize -DriveLetter $driveLetter |
    Format-Volume -FileSystem NTFS -NewFileSystemLabel "$driveLabel" -Confirm:$false -Force
} else {
    write-output "No RAW disks found, checking for logs disk with incorrect drive letter"
    $volume = Get-Volume | where FileSystemLabel -eq 'logsDisk'
    if ($volume){
        write-output "Found a logsdisk with drive letter $($volume.DriveLetter), updating it to $driveLetter"
        $currentLetter = $volume.DriveLetter
        Get-Partition | where DriveLetter -eq $currentLetter | Set-Partition -NewDriveLetter $driveLetter
    }
}

sleep 5
$volume = Get-Volume | where FileSystemLabel -eq 'logsDisk'
if ($volume -and $volume.DriveLetter -ne $driveLetter){
    $currentLetter = $volume.DriveLetter
    write-output "Even after formatting it still has the wrong drive letter, changing it back to $driveLetter"
    Get-Partition | where DriveLetter -eq $currentLetter | Set-Partition -NewDriveLetter $driveLetter
}