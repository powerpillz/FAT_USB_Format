Add-Type -assembly System.Windows.Forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='USB Formatter'
$main_form.Width = 400
$main_form.Height = 100
$main_form.AutoSize = $true

$Label = New-Object System.Windows.Forms.Label
$Label.Text = "MT9106 9702 55"
$Label.Location  = New-Object System.Drawing.Point(0,10)
$Label.AutoSize = $true
$main_form.Controls.Add($Label)

$Label2 = New-Object System.Windows.Forms.Label
$Label2.Text = "Insert Fresh USB and Press Button"
$Label2.Location  = New-Object System.Drawing.Point(0,30)
$Label2.AutoSize = $true
$main_form.Controls.Add($Label2)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(300,10)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "FORMAT"
$main_form.Controls.Add($Button)

$Button.Add_Click(

{

ipmo storage
$destination = "F:"
Format-Volume -DriveLetter F -FileSystem fat -Confirm:$false
[media.SystemSounds]::("Hand").play()
Start-Sleep -s 3
$driveEject = New-Object -comObject Shell.Application
$driveEject.Namespace(17).ParseName("F:").InvokeVerb("Eject")

}

)

$main_form.ShowDialog()

