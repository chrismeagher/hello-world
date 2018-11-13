function create-7zip([String] $aDirectory, [String] $aZipfile){
    [string]$pathToZipExe = "$($Env:ProgramFiles)\7-Zip\7z.exe";
#    [Array]$arguments = "a", "-tzip", "$aZipfile", "$aDirectory", "-r", "-mmt";
    [Array]$arguments = "a", "-tzip", "$aZipfile", "$aDirectory", "-mx9", "-mmt1";
    & $pathToZipExe $arguments;
}
 
Function delete-logfiles([string] $files){
remove-item $file
}
 
$path = "D:\Logs (Compressed)"
cd $path
$files = get-childitem $path "*.log"
#$zipfile = ($file.name.ToString() + ".zip")
foreach ($file in $files)
{
create-7zip  $file.Name ($file.name.ToString() + ".zip")
delete-logfiles
}


Copy the script to the server and change the $path variable to wherever the log files are.
Also check to make sure they’re .log files otherwise you’ll need to change the $files variable. 