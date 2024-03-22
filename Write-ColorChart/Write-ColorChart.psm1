function Write-ColorChart {
    <#
        .SYNOPSIS
            Writes out a chart with exaples of consoel color options.

        .NOTES
            Written by. Bradley Grubbs

            v2023_04_11 | None

        .DESCRIPTION
            Writes out a chart of all the combiations of foreground and background colors for writ-host commands

        .EXAMPLE
            Write-ColorChart
        
        .INPUTS
            None

        .OUTPUTS
            None
    #>
    $colors = ("DarkMagenta", "DarkBlue", "DarkCyan", "DarkGreen", "DarkYellow", "DarkRed", "Black", "DarkGray", "Gray", "White", "Red", "Yellow", "Green", "Cyan", "Blue", "Magenta"
    )
    Foreach ($bgcolor in $colors) {
        Foreach ($fgcolor in $colors) {
            Write-Host " $fgcolor "  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine
            Write-Host "  " -ForegroundColor $bgcolor -NoNewline
        }
        Write-Host " background " -NoNewline
        Write-Host "$bgcolor" -ForegroundColor $bgcolor
        write-host
    }
}