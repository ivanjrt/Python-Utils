# copy and run segments by comments. if anything this is a Beta Version of a final product 
# which at the moment don't have the time to make it state of the art but feel free to help if you want to

#Install VSC
write-output "Installing Visual Studio Code..."
	if (!(Test-Path -Path c:\temp)) {md c:\temp}
	$output = "C:\Temp"
	iwr -Uri https://go.microsoft.com/fwlink/?Linkid=852157 -UseBasicParsing -OutFile $output\VSC_CODE.EXE
	Start-Process -Wait -FilePath $output\VSC_CODE.EXE -Argument "/VERYSILENT /MERGETASKS=!runcode"

#Install Ptython
write-output "Installing Python 3.9..."
	iwr -Uri "https://www.python.org/ftp/python/3.9.0/python-3.9.0-amd64.exe" -UseBasicParsing -OutFile $output\Python.EXE
	Start-Process -Wait -FilePath $output\Python.EXE -Argument "/quiet InstallAllUsers=1 PrependPath=1"
	
#adding exts Python Ext in VSC
write-output "Adding Extensions to VSC..."
	cd "C:\Program Files\Microsoft VS Code\bin"
	.\code --install-extension ms-python.python

	#Bonus -NOT required, But these are pretty cool 
	cd "C:\Program Files\Microsoft VS Code\bin"
	.\code.cmd --install-extension ms-python.python

write-verbose 'Ignore Errs if any...' -verbose
	#Bonus -NOT required, But these are pretty cool 
	$extensions = "ms-vscode.azurecli",
	    "msazurermtools.azurerm-vscode-tools",
	    "coenraads.bracket-pair-colorizer-2",
	    "ms-dotnettools.csharp",
	    "formulahendry.code-runner",
	    "streetsidesoftware.code-spell-checker",
	    "grapecity.gc-excelviewer",
	    "cliffordfajardo.highlight-line-vscode",
	    "buster.marko-beautify",
	    "aki12n.multiwindows-highlight",
	    "ms-vscode.powershell",
	    "esbenp.prettier-vscode"
	foreach ($extension in $extensions){
		.\code.cmd --install-extension $extension
	}

	
#Bonus: PowerShell 7
write-output "Installing PowerShell 7..."
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet"






#########JUST IN CASE DOESN'T DO THE PATH RIGHT
#Warning!!!. ScreenShot your Windows "ENVIROMEENT VARIABLES" location: USER > PATH, then apply the below
	#so if anything goes bad, then you know what to put back
	#or if you prefer do it manually, just add the path "c:\.... as shown below"
	write-output "Adding Pythong Variable Paths..."
 	$env:path += 'C:\Program Files\Python39\'
	$env:path += 'C:\Program Files\Python39\Scripts'
	$env:path += 'C:\Program Files\Microsoft VS Code'
	#RESTART YOUR CONSOLE
	
#To Upgrade your PIP
write-output "Upgrading PIP..."
	python -m pip install --upgrade pip
	#at first you will get a warning but if you do it again
	python.exe -m pip install --upgrade pip
	#warning should dissappear
############	
	
