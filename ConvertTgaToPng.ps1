# PowerShell script to batch convert TGA files to PNG using ImageMagick's mogrify command
# This script uses mogrify to convert images directly within their folder or to a specified output folder.

# Define the path to the ImageMagick executable
$magickPath = "C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe"

# Set the path to the directory containing the TGA files
#$inputDirectoryPath = "C:\path\to\your\input\folder"
#$outputDirectoryPath = "C:\path\to\your\output\folder"  # Specify the same as input directory if you want in-place conversion

$inputDirectoryPath = "‪C:\Users\Sean\Desktop\MoneyWarsAssets\StylizedCharacter_1\Textures\Item\Weapon"
$outputDirectoryPath = "C:\Users\Sean\Desktop\MoneyWarsAssets\StylizedCharacter_1\Textures\Item\PNG"



# Ensure the output directory exists
if (-not (Test-Path -Path $outputDirectoryPath)) {
    New-Item -Path $outputDirectoryPath -ItemType Directory
}

# Construct the mogrify command arguments
$mogrifyArguments = "mogrify -path `"$outputDirectoryPath`" -format png `"$inputDirectoryPath\*.tga`""

try {
    # Execute the mogrify command using Start-Process
    $process = Start-Process -FilePath $magickPath -ArgumentList $mogrifyArguments -Wait -NoNewWindow -PassThru
    if ($process.ExitCode -eq 0) {
        Write-Host "All TGA files in $inputDirectoryPath have been converted to PNG in $outputDirectoryPath" -ForegroundColor Green
    } else {
        Write-Host "Error: The conversion process exited with code $($process.ExitCode)" -ForegroundColor Red
    }
} catch {
    # Catch and display errors
    Write-Host "Error during conversion process: $_" -ForegroundColor Red
}

# Keep the console window open until the user decides to close it
Write-Host "Press any key to exit..." -ForegroundColor Yellow
$null = Read-Host