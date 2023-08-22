#A PowerShell script to create new user profiles and add them to the Remote Desktop User Group for RDP permissions

#Display inputted password as asterisks
$password = Read-Host -AsSecureString
 
#Create a few new user profiles
New-LocalUser -Name "User1" -Password $password -FullName "Default User1" -Description "Test User1"
New-LocalUser -Name "User2" -Password $password -FullName "Default User1" -Description "Test User2"
New-LocalUser -Name "User3" -Password $password -FullName "Default User1" -Description "Test User3"

#Print list of current local users
Get-LocalUser

#Add new users to Remote Desktop Users group
NET LOCALGROUP "Remote Desktop Users" /Add "User1", "User2", "User3"

#Print member list for Remote Desktop Users group
Get-LocalGroupMember -Group "Remote Desktop Users"