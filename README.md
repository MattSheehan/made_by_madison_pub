# made_by_madison_pub

Proof of concept for Madison Stone &amp; other interested peeps

```PowerShell
$ErrorActionPreference=("SilentlyContinue");[String]$gitMsg=((
  "UPDATE: search bar, nav bar, google auth is pop-up (redirect is obsolete), "+
  "and azure is ready whenever testing main finishes (obj: 1year). "+
  "TODO: finish stripes api, knowledge graphs"
)) ; git add . ; git commit -m "$gitMsg" ; git push ;
[Hashtable]$rmPkg=@{Path=('./package-lock.json');Force=($true)};
[Hashtable]$rmNode=@{Path=('./node_modules');Recurse=($true);Force=($true)}
if ("$(Get-Location)" -NOTLIKE "*apps*made_by_madison_pub*app") {
  Set-Location '/Users/mattsheehan/Desktop/apps/made_by_madison_pub/example/app'
};try {
  Remove-Item @rmPkg ; Remove-Item @rmNode ; Start-Sleep( 10 )
} catch { return };if ( Test-Path './package.json' ) { npm install } else {
  Write-Output( "_ERROR_(404)@{app.target='./package.json'}" )
};if ( Test-Path './package-lock.json' ) {
  npm start
}
```
