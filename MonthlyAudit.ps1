# Monthly Account disable Activity 

# this will get you the current results of accounts 

$users= get-content C:\temp\SNAME2.txt
foreach($user in $users)
{
Get-ADUser $user -Properties * | select samaccountname,enabled,DistinguishedName,extensionattribute3,description | export-csv c:\temp\OU-for-DisabledUsersFinal.csv -Append

}

#############################################################################


# This will Disable , Move to OU , Add Descriptio for set of Accounts 
$users= get-content C:\temp\SNAME2.txt 
foreach($user in $users)
{


Set-ADuser -Identity $user -Enabled $false
Get-ADUser $user | Move-ADObject -TargetPath "OU=Deprovisioned,OU=User Accounts,OU=MSP01,DC=ten,DC=thomsonreuters,DC=com" -PassThru
Set-ADUser $user -Description "Do not re-enable the account*leaver account*"  
}
