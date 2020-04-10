
function Write-Color([String[]]$Text, [ConsoleColor[]]$Color = "White", [int]$StartTab = 0, [int] $LinesBefore = 0,[int] $LinesAfter = 0, [string] $LogFile = "", $TimeFormat = "yyyy-MM-dd HH:mm:ss") {
    # version 0.2
    # - added logging to file
    # version 0.1
    # - first draft
    # 
    # Notes:
    # - TimeFormat https://msdn.microsoft.com/en-us/library/8kb3ddd4.aspx

    $DefaultColor = $Color[0]
    if ($LinesBefore -ne 0) {  for ($i = 0; $i -lt $LinesBefore; $i++) { Write-Host "`n" -NoNewline } } # Add empty line before
    if ($StartTab -ne 0) {  for ($i = 0; $i -lt $StartTab; $i++) { Write-Host "`t" -NoNewLine } }  # Add TABS before text
    if ($Color.Count -ge $Text.Count) {
        for ($i = 0; $i -lt $Text.Length; $i++) { Write-Host $Text[$i] -ForegroundColor $Color[$i] -NoNewLine } 
    } else {
        for ($i = 0; $i -lt $Color.Length ; $i++) { Write-Host $Text[$i] -ForegroundColor $Color[$i] -NoNewLine }
        for ($i = $Color.Length; $i -lt $Text.Length; $i++) { Write-Host $Text[$i] -ForegroundColor $DefaultColor -NoNewLine }
    }
    Write-Host
    if ($LinesAfter -ne 0) {  for ($i = 0; $i -lt $LinesAfter; $i++) { Write-Host "`n" } }  # Add empty line after
    if ($LogFile -ne "") {
        $TextToFile = ""
        for ($i = 0; $i -lt $Text.Length; $i++) {
            $TextToFile += $Text[$i]
        }
        Write-Output "[$([datetime]::Now.ToString($TimeFormat))]$TextToFile" | Out-File $LogFile -Encoding unicode -Append
    }
}
function Set-WindowSize {
Param([int]$x=$host.ui.rawui.windowsize.width,
      [int]$y=$host.ui.rawui.windowsize.heigth)
    $size=New-Object System.Management.Automation.Host.Size($x,$y)
    $host.ui.rawui.WindowSize=$size   
}
function Move-Cursor([int]$x, [int] $y) {
 $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates $x , $y 
} 
Set-WindowSize 70 21
function End-Game {
$host.ui.RawUI.BackgroundColor = "Red"
cls

Move-Cursor 22 5
write-color -Text "YOU WERE HIT IN COMBAT" -Color Black 
Move-Cursor 24 7
write-color -Text "YOUR SCORE WAS $score" -Color Black  
[console]::beep(200,400)
[console]::beep(150,300)
[console]::beep(180,400)
[console]::beep(150,300)
[console]::beep(200,400)
do {

        Move-Cursor 23 18
        write-color -Text "PRESS ESC KEY TO EXIT" -Color Black  
        Start-Sleep -Milliseconds 700
        Move-Cursor 23 18
        write-color -Text "                     " -Color Black
        Start-Sleep -Milliseconds 700

} until ([Console]::KeyAvailable) #Press any key to exit.
exit
} 

#Sounds
Set-Content C:\Windows\Temp\laser.ps1 "[console]::beep(500,100)"
function laser {Start-Process -NoNewWindow -FilePath "powershell" C:\Windows\Temp\laser.ps1}

Set-Content C:\Windows\Temp\movement.ps1 "[console]::beep(300,200)"
function movement {Start-Process -NoNewWindow -FilePath "powershell" C:\Windows\Temp\movement.ps1}

Set-Content C:\Windows\Temp\bomb.ps1 "[console]::beep(300,100)"
Add-Content C:\Windows\Temp\bomb.ps1 "[console]::beep(400,100)"
function bomb {Start-Process -NoNewWindow -FilePath "powershell" C:\Windows\Temp\bomb.ps1}

#Console Dimensions and color
$host.ui.RawUI.ForegroundColor = "White"
$host.ui.RawUI.BackgroundColor = "Black"
$host.ui.RawUI.CursorSize = 0

cls
$score = 0
$location = 2


#Opening Screen



echo " "
echo "   ____                         ____        __                     "
echo "  / ___| _ __   ____  ___ ___  |  _ \  ___ / _| ___ _ __  ___  ___ "
echo "  \___ \| '_ \ / _  |/ __/ _ \ | | | |/ _ \ |_ / _ \ '_ \/ __|/ _ \"
echo "   ___) | |_) | (_| | (_|  __/ | |_| |  __/  _|  __/ | | \__ \  __/"
echo "  |____/| .__/ \__,_|\___\___| |____/ \___|_|  \___|_| |_|___/\___|"
echo "        |_| "

[console]::beep(480,300)
[console]::beep(330,100)
[console]::beep(440,200)
[console]::beep(360,200)
[console]::beep(480,200)
[console]::beep(480,200)
[console]::beep(480,200)
[console]::beep(390,200)
[console]::beep(360,200)
[console]::beep(530,200)
[console]::beep(330,200)
[console]::beep(290,200)
[console]::beep(330,200)
[console]::beep(360,200)
[console]::beep(290,500)

Move-Cursor 17 10
write-color -Text "Developed by Alejandro Burgueño Díaz" -Color Yellow 
Move-Cursor 22 12
write-color -Text "retrospectivePreposterous" -Color Yellow

do {

        Move-Cursor 23 18
        write-color -Text "PRESS ANY KEY TO START" -Color Red  
        Start-Sleep -Milliseconds 700
        if ([Console]::KeyAvailable) {break}
        Move-Cursor 23 18
        write-color -Text "                      " -Color Red
        Start-Sleep -Milliseconds 700

} until ([Console]::KeyAvailable)


# What hap

[void][System.Console]::ReadKey($true)      #Esto genera un pause sin texto. SOLO EN LA CONSOLA.
[console]::beep(200,300) #frequency and time
cls

#Screen text
Move-Cursor 20 19
write-color -Text "$score" -Color Green
Move-Cursor 5 19
write-color -Text "Total Score:" -Color Green
Move-Cursor 47 19
write-color -Text "Press ESC to exit" -Color Green
Move-Cursor 5 2
write-color -Text "D, F and SPACE to play" -Color Green

do {



do
{
    # wait for a key to be available:
    if ([Console]::KeyAvailable)
    {
        # read the key, and consume it so it won't
        # be echoed to the console:
        $keyInfo = [Console]::ReadKey($true)
        # exit loop
        break
    }

    # What happens if NO key is pressed
    # -----------------------------------------

    # bullets
    if (($ba -gt 0) -and ($ba -lt 40)) {
    $ba= $ba+1
    Move-Cursor (9+$ba) (5)
    write-color -Text " >" -Color Cyan
    } else {
    Move-Cursor (40) (5)
    write-color -Text "           " -Color Cyan
    $ba = 0
    }

    if (($bb -gt 0) -and ($bb -lt 40)) {
    $bb= $bb+1
    Move-Cursor (9+$bb) (10)
    write-color -Text " >" -Color Cyan
    } else {
    Move-Cursor (40) (10)
    write-color -Text "           " -Color Cyan
    $bb = 0
    }

    if (($bc -gt 0) -and ($bc -lt 40)) {
    $bc= $bc+1
    Move-Cursor (9+$bc) (15)
    write-color -Text " >" -Color Cyan
    } else {
    Move-Cursor (40) (15)
    write-color -Text "           " -Color Cyan
    $bc = 0
    }

    # SpaceShip location
    if ($location -gt 3) {
    $location = 3
    }
    if ($location -lt 1) {
    $location = 1
    }
    if ($location -eq 1) {
    Move-Cursor 5 5
    write-color -Text "}==>" -Color Yellow
    }
    if ($location -eq 2) {
    Move-Cursor 5 10
    write-color -Text "}==>" -Color Yellow
    }
    if ($location -eq 3) {
    Move-Cursor 5 15
    write-color -Text "}==>" -Color Yellow
    }

    # Enemies
    $asteroids = Get-Random -Minimum 0 -Maximum 10
    if (($asteroids -eq 1) -and ($ea -eq 0)){
    $ea = 70
    }
    if (($asteroids -eq 2) -and ($eb -eq 0)){
    $eb = 70
    }
    if (($asteroids -eq 3) -and ($ec -eq 0)){
    $ec = 70
    }

    if ($ea -gt 0) {
    $ea = $ea-1
    Move-Cursor ($ea) 5
    write-color -Text "* " -Color Red
    } else {
    $ea = 0
    }
    if ($eb -gt 0) {
    $eb = $eb-1
    Move-Cursor ($eb) 10
    write-color -Text "* " -Color Red
    } else {
    $eb = 0
    }
    if ($ec -gt 0) {
    $ec = $ec-1
    Move-Cursor ($ec) 15
    write-color -Text "* " -Color Red
    } else {
    $ec = 0
    }

    # removing explosions
    if ($na -gt 0){
    Move-Cursor ($na) 5
    write-color -Text "   " -Color White
    Move-Cursor ($na) 4
    write-color -Text "    " -Color White
    $na = 0
    }

    if ($nb -gt 0){
    Move-Cursor ($nb) 10
    write-color -Text "   " -Color White
    Move-Cursor ($nb) 9
    write-color -Text "    " -Color White
    $nb = 0
    }

    if ($nc -gt 0){
    Move-Cursor ($nc) 15
    write-color -Text "   " -Color White
    Move-Cursor ($nc) 14
    write-color -Text "    " -Color White
    $nc = 0
    }


    # bullet hitting asteroid
    if (($ba -gt 0) -and ( ((9+$ba) -eq $ea) -or ((10+$ba) -eq $ea) -or ((11+$ba) -eq $ea) )) {
    $na = $ea-1
    Move-Cursor ($na) 5
    write-color -Text "> <" -Color White
    Move-Cursor ($na) 4
    write-color -Text "+100" -Color White
    $score = $score+100
    Move-Cursor 20 19
    write-color -Text "$score" -Color Green
    bomb
    $ba = 0
    $ea = 0
    }

    if (($bb -gt 0) -and ( ((9+$bb) -eq $eb) -or ((10+$bb) -eq $eb) -or ((11+$bb) -eq $eb) )) {
    $nb = $eb-1
    Move-Cursor ($nb) 10
    write-color -Text "> <" -Color White
    Move-Cursor ($nb) 9
    write-color -Text "+100" -Color White
    $score = $score+100
    Move-Cursor 20 19
    write-color -Text "$score" -Color Green
    bomb
    $bb = 0
    $eb = 0
    }

    if (($bc -gt 0) -and ( ((9+$bc) -eq $ec) -or ((10+$bc) -eq $ec) -or ((11+$bc) -eq $ec) )) {
    $nc = $ec-1
    Move-Cursor ($nc) 15
    write-color -Text "> <" -Color White
    Move-Cursor ($nc) 14
    write-color -Text "+100" -Color White
    $score = $score+100
    Move-Cursor 20 19
    write-color -Text "$score" -Color Green
    bomb
    $bc = 0
    $ec = 0
    }

    # EngGame
    if (($ea -lt 5) -and ($ea -gt 0)) {End-Game}
    if (($eb -lt 5) -and ($eb -gt 0)) {End-Game}
    if (($ec -lt 5) -and ($ec -gt 0)) {End-Game}

    Start-Sleep -Milliseconds 50
    # -----------------------------------------

} while ($true)

# What happens if a key is pressed

$type = ($keyInfo.keychar)


if ($type -eq "D") {
Move-Cursor 5 5
write-color -Text "    " -Color Yellow
Move-Cursor 5 10
write-color -Text "    " -Color Yellow
Move-Cursor 5 15
write-color -Text "    " -Color Yellow
$location = $location-1
movement
}
if ($type -eq "F") {
Move-Cursor 5 5
write-color -Text "    " -Color Yellow
Move-Cursor 5 10
write-color -Text "    " -Color Yellow
Move-Cursor 5 15
write-color -Text "    " -Color Yellow
$location = $location+1
movement
}

if ($type -eq " "){
if (($location -eq 1) -and ($ba -eq 0)) {
$ba = 1
laser
}
if (($location -eq 2) -and ($bb -eq 0)) {
$bb = 1
laser
}
if (($location -eq 3) -and ($bc -eq 0)) {
$bc = 1
laser
}

}

    # -----------------------------------------
    if (($ba -gt 0) -and ($ba -lt 40)) {
    $ba= $ba+1
    Move-Cursor (9+$ba) (5)
    write-color -Text " >" -Color Cyan
    } else {
    Move-Cursor (40) (5)
    write-color -Text "           " -Color Cyan
    $ba = 0
    }

    if (($bb -gt 0) -and ($bb -lt 40)) {
    $bb= $bb+1
    Move-Cursor (9+$bb) (10)
    write-color -Text " >" -Color Cyan
    } else {
    Move-Cursor (40) (10)
    write-color -Text "           " -Color Cyan
    $bb = 0
    }

    if (($bc -gt 0) -and ($bc -lt 40)) {
    $bc= $bc+1
    Move-Cursor (9+$bc) (15)
    write-color -Text " >" -Color Cyan
    } else {
    Move-Cursor (40) (15)
    write-color -Text "           " -Color Cyan
    $bc = 0
    }

    Start-Sleep -Milliseconds 50
    # -----------------------------------------

} until ( $keyInfo.key -eq "Escape" ) #Press ESCape button to exit.
Remove-Item C:\Windows\Temp\laser.ps1
Remove-Item C:\Windows\Temp\movement.ps1
Remove-Item C:\Windows\Temp\bomb.ps1