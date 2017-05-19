Add-Type -AssemblyName System.Web;
[void] ($remote = &git remote get-url origin);
[void] ($branchName = &git rev-parse --abbrev-ref HEAD);

$url = "$($remote)/pullrequestcreate?sourceRef=$([System.Web.HttpUtility]::UrlEncode($branchName) )&targetRef=master";
Start-Process "chrome.exe" $url
