# Send-NewsDigestEmail.ps1
param(
    [Parameter(Mandatory=$true)]
    [string]$Date,
    [Parameter(Mandatory=$true)]
    [string]$HtmlUrl,
    [string]$To = "zizaiqizizhangxiqi@qq.com",
    [string]$From = "zizaiqizizhangxiqi@qq.com",
    [string]$SmtpServer = "smtp.qq.com",
    [int]$SmtpPort = 587,
    [string]$Username = "zizaiqizizhangxiqi@qq.com",
    [string]$Password = "akgxxrbxcfkeiaec"
)

$subject = "News Digest - $Date"

# 简化版HTML，避免here-string问题
$htmlTemplate = Get-Content -Path (Join-Path $PSScriptRoot "email-template.html") -Raw -Encoding UTF8
$bodyHtml = $htmlTemplate -replace "{{DATE}}", $Date -replace "{{URL}}", $HtmlUrl

try {
    $message = New-Object System.Net.Mail.MailMessage
    $message.From = $From
    $message.To.Add($To)
    $message.Subject = $subject
    $message.Body = $bodyHtml
    $message.IsBodyHtml = $true
    $message.BodyEncoding = [System.Text.Encoding]::UTF8
    $message.SubjectEncoding = [System.Text.Encoding]::UTF8
    
    $smtp = New-Object System.Net.Mail.SmtpClient
    $smtp.Host = $SmtpServer
    $smtp.Port = $SmtpPort
    $smtp.EnableSsl = $true
    $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)
    
    $smtp.Send($message)
    Write-Host "Email sent successfully"
}
catch {
    Write-Host "Error: $($_.Exception.Message)"
    exit 1
}
