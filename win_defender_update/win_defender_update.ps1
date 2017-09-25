#!powershell
# (c) 2017, David Baumann <daBONDi@users.noreply.github.com>
# GNU GENERAL PUBLIC LICENSE v3
#
# WANT_JSON
# POWERSHELL_COMMON

#Temporary fix
Set-StrictMode -Off

########################################################################################################################

$params = Parse-Args $args -supports_check_mode $true
$result = New-Object psobject;

Set-Attr $result "changed" $false;

$CheckMode = $False

$Attributes = $params.GetEnumerator() | where {$_.key -notlike "_ansible_*"}


$Attrib = @{} # Holder of Properties the Script work from
$ProcessedPropertys= @{}    # Holder of Information about the Process

foreach ($key in $Attributes)
{
    set-attr -obj $result -name $key.name -value $key.value
    $Attrib.Add($Key.Key,$Key.Value)
}
Set-Attr -obj $result -name "RequestPropertys" -value $Attrib

# Fetch Pre State
$preStatus = Get-MpComputerStatus;

# Call Update
Update-MpSignature;

# Fetch Post State
$postStatus = Get-MpComputerStatus;

# Check Pre vs Post State Signature and Application Versions
if($preStatus.AntispywareSignatureVersion -ne $postStatus.AntispywareSignatureVersion){
  Set-Attr $result "AntispywareSignatureVersion" $true
  Set-Attr $result "changed" $true;
}
if($preStatus.AntivirusSignatureVersion -ne $postStatus.AntivirusSignatureVersion){
  Set-Attr $result "AntivirusSignatureVersion" $true
  Set-Attr $result "changed" $true;
}
if($preStatus.NISSignatureVersion -ne $postStatus.NISSignatureVersion){
  Set-Attr $result "NISSignatureVersion" $true
  Set-Attr $result "changed" $true;
}
if($preStatus.AMServiceVersion -ne $postStatus.AMServiceVersion){
  Set-Attr $result "AMServiceVersion" $true
  Set-Attr $result "changed" $true;
}
if($preStatus.AMProductVersion -ne $postStatus.AMProductVersion){
  Set-Attr $result "AMProductVersion" $true
  Set-Attr $result "changed" $true;
}

Exit-Json -obj $result
