# Open Devops in Branch-compare modus

# In SourceTree add a new Custom Action (Tools > Options > Custom Actions)
# [x] Run command silently
# - Script to run: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
# - Parameters: "{path}\Utils\SourceTree\CompareCommit\CompareCommit.ps1" $SHA

# Select two commits, select the custom action ⚡magic


param (
    [Parameter(Mandatory=$true)][string]$source,
    [Parameter(Mandatory=$true)][string]$target
 )

Add-Type -AssemblyName System.Web

[void] ($remote = &git remote get-url origin)

$index = $remote.IndexOf("dev.azure")
$remote = "https://" + $remote.SubString($index)


$url = "$($remote)/branchCompare?baseVersion=GC$([System.Web.HttpUtility]::UrlEncode($source) )&targetVersion=GC$([System.Web.HttpUtility]::UrlEncode($target) )&_a=files"

Start-Process $url
