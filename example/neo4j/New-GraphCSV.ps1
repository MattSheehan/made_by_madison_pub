<#  Copyright 2024 @Made_by_Madison | all rights reserved | ControlGroup: @MattSheehan  #>
[Boolean]$authERROR, $configERROR = ( $false ), ( $false );
<#  AUTH  |  Elevates privileges IF need be (i.e., untrusted VSCode folder, VMs, AZ-console, AZ-functions, AWS-Lambda, Apple-Automator, MS-PowerAutomate)  #>
try { Set-Location $env:HOME/Desktop/apps/made_by_madison_pub ; Unblock-File ./example/neo4j/Create-GraphCSV.ps1 } catch {
  @('CurrentUser', 'Process') | ForEach-Object { try { Set-ExecutionPolicy 'Bypass' -Scope ( $_ ) -Force } catch { return } };
  try { Set-Location $env:HOME/Desktop/apps/made_by_madison_pub } catch { $authERROR = $true ; throw };
  try { Unblock-File ./example/neo4j/Create-GraphCSV.ps1 } catch { $authERROR = $true ; throw }
};
<#  CONFIG  |  GETTER(s) && SETTER(s)  #>
if ( $authERROR ) { $configERROR = ( $true ); return } else {
  [String]$Neo4jPath = ("$env:HOME/Desktop/apps/made_by_madison_pub/example/neo4j");
  [System.Collections.ArrayList]$Set_Nodes = @();
  [Int32]$node_i, $rel_i = ( 1 ), ( 9 );
  [Hashtable]$Get_Nodes = @{
    _about      = [System.Collections.ArrayList]@(
      "id", "caption", "label", "aboutContent", "blogs", "blogUrls", "contact", "top3Docs", "top3DocUrls", "clientStories", "sponsors", "apiConnectors", "GRCDocTitle", "GRCDocContent"
    ); _auth    = [System.Collections.ArrayList]@(
      "id", "caption", "label", "userId", "username", "password", "email", "mobile", "loginDate", "rbacID", "acctState", "method1Pass", "method2Pass", "authToken", "store0Token"
    ); _cart    = [System.Collections.ArrayList]@("id", "caption", "label", "shopId", "productIDs", "instanceId", "buyerId", "sellerId", "price", "dateAdded", "isActive", "paymentMethod");
    _home       = [System.Collections.ArrayList]@("id", "caption", "label", "featuredContent", "promotionals", "sales", "seasonal", "recommendations", "profileContent", "isAuth");
    _product    = [System.Collections.ArrayList]@(
      "id", "caption", "label", "guid", "shopId", "sellerId", "type", "name", "title", "subtitle", "imageUrl", "price", "currency", "color", "care", "quantity", "sizes", "specials", "dateCreated"
    ); _profile = [System.Collections.ArrayList]@(
      "id", "caption", "label", "username", "password", "email", "homeNumber", "dateSignedIn", "dateCreated", "rbacId", "companyName", "companyNumber", "acctState", "linkedStore0", "linkedStore0Url"
    ); _rbac    = [System.Collections.ArrayList]@("id", "caption", "label", "userId", "roleName", "accessId", "accessName", "homeNumber", "description", "acctState");
    _shop       = [System.Collections.ArrayList]@("id", "caption", "label", "name", "title", "subtitle", "imageUrl", "type", "category", "productIDs", "specials");
  };
  @('About', 'Auth', 'Cart', 'Home', 'Product', 'Profile', 'RBAC', 'Shop') | ForEach-Object {
    [Hashtable]$csvNode, $csvRelationship = @{
      _caption = [String]("na");
      _cols    = [System.Collections.ArrayList]@();
      _guid    = [String]("$([System.Guid]::NewGuid())");
      _id      = [String]("n$($node_i)");
      _label   = [String]("$_");
      _name    = [String]("na");
      _rows    = [System.Collections.ArrayList]@()
    }, @{
      id = [String]("n$( $rel_i )"); fromId = [String](""); toId = [String](""); type = [String](""); direction = [String](""); properties = [Hashtable]@{
        id = [String]("$([System.Guid]::NewGuid())"); date = [String](""); userId = [String](""); storeId = [String](""); productId = [String]("")
      }
    };
    switch -Wildcard ("$( $csvNode._label )") {
      "*About*" { $csvNode._label = "$_"; $csvNode._cols += ($Get_Nodes._about); $csvNode._name = ("about"); $csvNode._rows += @(",,,,,,,,,`n", ",,,,,,,,,`n", ",,,,,,,,,`n"); break }
      "*Auth*" { $csvNode._label = "$_"; $csvNode._cols += ($Get_Nodes._auth); $csvNode._name = ("auth"); $csvNode._rows += @(",,,,,,,,,`n", ",,,,,,,,,`n", ",,,,,,,,,`n"); break }
      "*Cart*" { $csvNode._label = "$_"; $csvNode._cols += ($Get_Nodes._cart); $csvNode._name = ("cart"); $csvNode._rows += @(",,,,,,,,,`n", ",,,,,,,,,`n", ",,,,,,,,,`n"); break }
      "*Home*" { $csvNode._label = "$_"; $csvNode._cols += ($Get_Nodes._home); $csvNode._name = ("home"); $csvNode._rows += @(",,,,,,,,,`n", ",,,,,,,,,`n", ",,,,,,,,,`n"); break }
      { $_ -LIKE "*Product*" -OR $_ -LIKE "*Apparel*" -OR $_ -LIKE "*Art*" -OR $_ -LIKE "*Decor*" -OR $_ -LIKE "*Jewlery*" } {
        $csvNode._label = "$_"; $csvNode._cols += ($Get_Nodes._product); $csvNode._name = ("shop"); $csvNode._rows += @(",,,,,,,,,`n", ",,,,,,,,,`n", ",,,,,,,,,`n");
        $csvNode._rel.toId = ( $csvNode._id ); $csvNode._rel.type = ("DESIGNS"); $csvNode._rel.direction = ('IN'); $csvNode._rel.properties = ( $csvRelationship.properties ); break
      }
      { $_ -LIKE "*Profile*" -OR $_ -LIKE "*User*" -OR $_ -LIKE "*Teammate*" -OR $_ -LIKE "*Friend*" } {
        $csvNode._label = "$_"; $csvNode._cols += ($Get_Nodes._profile); $csvNode._name = ("profile"); $csvNode._rows += @(",,,,,,,,,`n", ",,,,,,,,,`n", ",,,,,,,,,`n");
        $csvNode._rel.fromId = ( $csvNode._id ); $csvNode._rel.type = ("DESIGNS"); $csvNode._rel.direction = ('OUT'); $csvNode._rel.properties = ( $csvRelationship.properties ); break
      }
      "*RBAC*" { $csvNode._label = "$_"; $csvNode._cols += ($Get_Nodes._rbac); $csvNode._name = ("auth"); $csvNode._rows += @(",,,,,,,,,`n", ",,,,,,,,,`n", ",,,,,,,,,`n"); break }
      "*Shop*" { $csvNode._label = "$_"; $csvNode._cols += ($Get_Nodes._shop); $csvNode._name = ("shop"); $csvNode._rows += @(",,,,,,,,,`n", ",,,,,,,,,`n", ",,,,,,,,,`n"); break }
      default { break }
    };
    $Set_Nodes += @([Hashtable]( $csvNode )); $node_i += ( 1 ); $rel_i += ( 1 );
  }
};
<#  MAIN  |  NOTE: for $id && $date attributes, use [System.Guid]::NewGuid() && Get-Date -F yyyy:MM:ddTHH:mm:ss.ms  #>
function New-CSVGraph([Parameter(Mandatory = $true)][Hashtable]$props) {
  @('data', 'schema') | ForEach-Object {
    [String]$_csvDir = ("$( $props._basePath )/$_");
    if (!(Test-Path("$_csvDir"))) { New-Item ($props._basePath) -ItemType ('Directory') -Name ($_) }
    else { Remove-Item ("$_csvDir") -Recurse -Force ; Start-Sleep( 3 ) ; New-Item ($props._basePath) -ItemType ('Directory') -Name ($_) } ;
    $props._nodes | ForEach-Object { New-Item ("$_csvDir") -ItemType ('Directory') -Name ($_._name) }
  } ; Start-Sleep( 9 );
  $props._nodes | ForEach-Object {
    [String]$data_path, $schema_path = "$($props._basePath)/data/$($_._name)", "$($props._basePath)/schema/$($_._name)";
    try { ConvertFrom-Csv ("$($_._cols)") -Delimiter (',') | Export-Csv ("$schema_path/$($_._label).csv") -NoTypeInformation } catch { throw };
    try { ConvertFrom-Csv ("$($_._rows)") -Delimiter (',') -Header ($_._cols) | Export-Csv ("$data_path/$($_._label).csv") -NoTypeInformation } catch { throw }
  }
};
<#  DRIVER  |  Orchestrates calling Main() and FxHelpers() "safely"  #>
if ( $configERROR ) { return } else { try { New-CSVGraph @{ _basePath = [String]( $Neo4jPath ); _nodes = [System.Collections.ArrayList]( $Set_Nodes ) } } catch { throw ; return } }