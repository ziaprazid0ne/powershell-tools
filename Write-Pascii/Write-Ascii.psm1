function Write-Ascii {
    param (
        [Parameter(Mandatory=$false)] [String] $file,
        [Parameter(Mandatory=$false)] [ValidateSet("DarkMagenta","DarkBlue","DarkCyan","DarkGreen","DarkYellow","DarkRed","Black","DarkGray","Gray","White","Red","Yellow","Green","Cyan","Blue", "Magenta")] [String] $FgColor = "None",
        [Parameter(Mandatory=$false)] [ValidateSet("DarkMagenta","DarkBlue","DarkCyan","DarkGreen","DarkYellow","DarkRed","Black","DarkGray","Gray","White","Red","Yellow","Green","Cyan","Blue", "Magenta")] [String] $BgColor = "None"
    )
    class entry {
        [string]$code
        [string]$color;
    }
    $ColorCodes = @(
        [entry]@{code="DM";color="DarkMagenta"} 
        [entry]@{code="DC";color="DarkCyan"}
        [entry]@{code="DG";color="DarkGreen"}
        [entry]@{code="DY";color="DarkYellow"}
        [entry]@{code="DR";color="DarkRed"}
        [entry]@{code="Bl";color="Black"}
        [entry]@{code="DA";color="DarkGray"}
        [entry]@{code="Ga";color="Gray"}
        [entry]@{code="Wh";color="White"}
        [entry]@{code="Re";color="Red"}
        [entry]@{code="Ye";color="Yellow"}
        [entry]@{code="Gr";color="Green"}
        [entry]@{code="Cy";color="Cyan"}
        [entry]@{code="Bl";color="Blue"}
        [entry]@{code="Ma";color="Magenta"}
    )
    If (!($FgColor -eq "None")) {
        $Override = $true  
    }
    If (!($Override -eq "$true")) {
        $FgColor = "Gray"
    }
    
    If ($file -eq $null) {

    }

    Foreach ($Line in Get-Content $File) {
        $Split = $Line -split "(β..)"
        $Count = $Split.Count
        $Print = 0
        Foreach ($Token in $Split) {
            $Print ++
            if ($Token -like 'β*') {
                if (!($Override -eq $true)) {
                    $Record = (0..($ColorCodes.Count-1)) | Where-Object {$ColorCodes[$_].code -eq $Token.Remove(0,2)}
                    $FgColor = $ColorCodes[$Record].color
                }
                continue
            }
            if ($Print -eq $Count) {
                if ($BGColor -eq "None") {
                    Write-Host $Token -ForegroundColor $FgColor
                } else {
                    Write-Host $Token -ForegroundColor $FgColor -BackgroundColor $BgColor
                }
            } else {
                if ($BGColor -eq "None") {
                    Write-Host $Token -ForegroundColor $FgColor -NoNewline
                } else {
                    Write-Host $Token -ForegroundColor $FgColor -BackgroundColor $BgColor -NoNewline
                }
            }
        }
    }
}