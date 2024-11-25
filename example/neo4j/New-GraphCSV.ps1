<#  Copyright 2024 @Made_by_Madison | all rights reserved | ControlGroup: @MattSheehan  #>
[Boolean]$authERROR, $configERROR, $seedERROR = ( $false ), ( $false ), ( $false );
<#  AUTH  |  Set location, Elevate privileges of this script, and Authorizes the runtime  #>
try { Set-Location $env:HOME/Desktop/apps/made_by_madison_pub ; Unblock-File ./example/neo4j/Create-GraphCSV.ps1 } catch {
  @('CurrentUser', 'Process') | ForEach-Object { try { Set-ExecutionPolicy 'Bypass' -Scope ( $_ ) -Force } catch { return } };
  try { Set-Location $env:HOME/Desktop/apps/made_by_madison_pub } catch { $authERROR = $true ; throw };
  try { Unblock-File ./example/neo4j/Create-GraphCSV.ps1 } catch { $authERROR = $true ; throw }
};
<#  CONFIG  |  GETTER(s) && SETTER(s)  #>
if ( $authERROR ) { $configERROR = ( $true ); return } else {
  [String]$Neo4jPath = ("$env:HOME/Desktop/apps/made_by_madison_pub/example/neo4j");
  [System.Collections.ArrayList]$SchemaNodes = @();
  [Hashtable]$CSVSchema = @{
    _about   = [System.Collections.ArrayList]@("id", "aboutContent", "blogs", "docs", "contact", "tbd_0", "tbd_1", "tbd_2", "tbd_3", "tbd_4");
    _auth    = [System.Collections.ArrayList]@("id", "userId", "username", "password", "email", "mobile", "loginDate", "loginState", "rbacID", "acctState");
    _cart    = [System.Collections.ArrayList]@("id", "storeId", "productId", "buyerId", "sellerId", "price", "quantity", "dateAdded", "tbd_0");
    _home    = [System.Collections.ArrayList]@("id", "featuredContent", "promotedContent", "sales", "seasonal", "recommendations", "profileContent", "isAuth", "tbd_0");
    _product = [System.Collections.ArrayList]@("id", "shopId", "sellerId", "type", "name", "title", "subtitle", "imageUrl", "price", "currency", "color", "care", "quantity", "sizes");
    _profile = [System.Collections.ArrayList]@("id", "username", "password", "email", "homeNumber", "dateCreated", "rbacID", "companyName", "companyNumber", "acctState");
    _rbac    = [System.Collections.ArrayList]@("id", "roleID", "roleName", "accessID", "accessName", "description");
    _shop    = [System.Collections.ArrayList]@("id", "name", "title", "subtitle", "imageUrl", "category", "productIDs");
  } ; [Int32]$node_i, $rel_i = ( 1 ), ( 9 );
  @('About', 'Auth', 'Cart', 'Home', 'Product', 'Profile', 'RBAC', 'Shop') | ForEach-Object {
    [Hashtable]$csvNode = @{
      _caption = [String]("na");
      _cols    = [System.Collections.ArrayList]@();
      _guid    = [String]([System.Guid]::NewGuid().ToString());
      _id      = [String]("n$($node_i)");
      _label   = [String]("$_");
      _name    = [String]("na");
      _rel     = [Hashtable]@{ id = [String]("n$( $rel_i )"); fromId = [String](""); toId = [String](""); type = [String](""); direction = [String](""); properties = [Hashtable]@{} };
      _rows    = [System.Collections.ArrayList]@()
    };
    switch -Wildcard ("$( $csvNode._label )") {
      "*About*" { $csvNode._label = "$_"; $csvNode._cols += ($CSVSchema._about); $csvNode._name = ("about"); $csvNode._rows += @(); break }
      "*Auth*" { $csvNode._label = "$_"; $csvNode._cols += ($CSVSchema._auth); $csvNode._name = ("auth"); $csvNode._rows += @(); break }
      "*Cart*" { $csvNode._label = "$_"; $csvNode._cols += ($CSVSchema._cart); $csvNode._name = ("cart"); $csvNode._rows += @(); break }
      "*Home*" { $csvNode._label = "$_"; $csvNode._cols += ($CSVSchema._home); $csvNode._name = ("home"); $csvNode._rows += @(); break }
      { $_ -LIKE "*Product*" -OR $_ -LIKE "*Apparel*" -OR $_ -LIKE "*Art*" -OR $_ -LIKE "*Decor*" -OR $_ -LIKE "*Jewlery*" } {
        $csvNode._label = "$_"; $csvNode._cols += ($CSVSchema._product); $csvNode._name = ("shop"); $csvNode._rows += @();
        $csvNode._rel.toId = ( $csvNode._id ); $csvNode._rel.type = ("DESIGNS"); $csvNode._rel.direction = ('IN'); $csvNode._rel.properties = @{
          id = [String]([System.Guid]::NewGuid().ToString()); date = [String](Get-Date); userId = [String](""); storeId = [String](""); productId = [String]("")
        } ; break
      }
      { $_ -LIKE "*Profile*" -OR $_ -LIKE "*User*" -OR $_ -LIKE "*Teammate*" -OR $_ -LIKE "*Friend*" } {
        $csvNode._label = "$_"; $csvNode._cols += ($CSVSchema._profile); $csvNode._name = ("profile"); $csvNode._rows += @();
        $csvNode._rel.fromId = ( $csvNode._id ); $csvNode._rel.type = ("DESIGNS"); $csvNode._rel.direction = ('OUT'); $csvNode._rel.properties = @{
          id = [String]([System.Guid]::NewGuid().ToString()); date = [String](Get-Date); userId = [String](""); storeId = [String](""); productId = [String]("")
        } ; break
      }
      "*RBAC*" { $csvNode._label = "$_"; $csvNode._cols += ($CSVSchema._rbac); $csvNode._name = ("auth"); $csvNode._rows += @(); break }
      "*Shop*" { $csvNode._label = "$_"; $csvNode._cols += ($CSVSchema._shop); $csvNode._name = ("shop"); $csvNode._rows += @(); break }
      default { break }
    } ; $node_i += ( 1 ) ; $rel_i += ( 1 );
    $SchemaNodes += @([Hashtable]( $csvNode ))
  }
};
<#  MAIN  |  NOE: for $id && $date attributes, use [System.Guid]::NewGuid() && Get-Date -F yyyy:MM:ddTHH:mm:ss.ms  #>
function New-CSVGraph([Parameter(Mandatory = $true)][Hashtable]$props) {
  @('data', 'schema') | ForEach-Object {
    [String]$_csvDir = ("$( $props._basePath )/$_");
    if (!(Test-Path("$_csvDir"))) { New-Item ($props._basePath) -ItemType ('Directory') -Name ($_) }
    else { Remove-Item ("$_csvDir") -Recurse -Force ; Start-Sleep( 3 ) ; New-Item ($props._basePath) -ItemType ('Directory') -Name ($_) } ;
    $props._nodes | ForEach-Object { New-Item ("$_csvDir") -ItemType ('Directory') -Name ($_._name) }
  } ; Start-Sleep( 9 );
  $props._nodes | ForEach-Object {
    [String]$data_path, $schema_path = "$($props._basePath)/data/$($_._name)", "$($props._basePath)/schema/$($_._name)";
    try { ConvertFrom-Csv ("$( $_._cols )") -Delimiter (',') | Export-Csv ("$schema_path/$($_._label).csv") -NoTypeInformation } catch { throw };
    try { ConvertFrom-Csv ("$( $_._rows )") -Delimiter (',') -Header ( $_._cols ) | Export-Csv ("$data_path/$($_._label).csv") -NoTypeInformation } catch { throw }
  }
};
<#  DRIVER  |  Orchestrates calling Main() and FxHelpers() "safely"  #>
if ( $configERROR ) { return } else {
  try { New-CSVGraph @{ _basePath = [String]( $Neo4jPath ); _nodes = [System.Collections.ArrayList]( $SchemaNodes ) } } catch { throw ; return }
}