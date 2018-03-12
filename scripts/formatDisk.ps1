# Generic script to format the first available disk
param (
    [string]$driveLetter = 'L',
    [string]$driveLabel = 'logsDisk'
)

$disks = Get-Disk | Where partitionstyle -eq 'raw' | sort number

$disks[0] |
Initialize-Disk -PartitionStyle MBR -PassThru |
New-Partition -UseMaximumSize -DriveLetter $driveLetter |
Format-Volume -FileSystem NTFS -NewFileSystemLabel "$driveLabel" -Confirm:$false -Force