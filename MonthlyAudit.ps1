# Monthly Account disable Activity 

# this will get you the current results of accounts 

$users= get-content C:\temp\SNAME2.txt
foreach($user in $users)
{
Get-ADUser $user -Properties * | select samaccountname,enabled,DistinguishedName,extensionattribute3,description | export-csv c:\temp\OU-for-DisabledUsersFinal.csv -Append

}

#############################################################################

