# TGAtoPNG_CLI
A simple command line tool (powershell) to batch convert all files in a directory, TGA to PNG. Uses ImageMagick's mogrify command.

# Requirements
- Windows support only
- ImageMagick's command line tool should be installed. You can get a copy (here)[https://imagemagick.org/script/download.php].

# Setup & Running
1. Download the .zip source file and extract it.
2. Modify the ConvertTgaToPng.ps1 file
  - Define the path to the ImageMagick executable. Example:

$magickPath = "C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe"

  - Set the path to the directory containing the TGA files. Note: Specify the same as input directory if you want in-place conversion

$inputDirectoryPath = "C:\path\to\your\input\folder"
$outputDirectoryPath = "C:\path\to\your\output\folder"  

3. Run the the ConvertTgaToPng.ps1 file with powershell.

Thanks!
Sean
