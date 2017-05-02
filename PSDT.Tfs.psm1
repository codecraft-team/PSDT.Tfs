<#
.Synopsis
   Performs a get latest operation.
.DESCRIPTION
   The cmdlet must be executed from within a local workspace to work.
.EXAMPLE
   Get-TfsLatest
   Performs a recurse get latest operation starting from the current location.
#>
Function Get-TfsLatest() {
	[CmdletBinding()]
	Param(
		[Parameter(ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$True)]
        [string[]]$Path = $PWD,
        [Switch]$Preview = $false,
        [Switch]$NotRecurse = $false,
        [Switch]$Force = $false
	)
	
	IF (!(Test-Tf)) {
		Write-Warning "Get-TfsLatest not executed."
		return;
	}
	
	$tf = "Tf.exe";
    
  $cmdlineArguments = @("get");

  Get-Item -Path $Path | % {$cmdlineArguments += "$($_.FullName)"};

  If ($Preview){$cmdlineArguments += "/preview"}
  If (!$NotRecurse){$cmdlineArguments += "/recursive"}
  If ($Force){$cmdlineArguments += "/force"}

	if ($PSBoundParameters['Verbose']) {
		Write-Verbose("Commandline: $tf $cmdlineArguments");
	}
	
	& $tf $cmdlineArguments;
}

Function Test-Tf() {
	$previousErrorActionPreference = $ErrorActionPreference;
	$ErrorActionPreference = 'stop';
		
	$tfAvailable = $false;
	
	try {
		Get-Command tf.exe;
		$tfAvailable = $true;
	}
	catch [System.Management.Automation.CommandNotFoundException] {
		Write-Warning "Tf.exe not found. Import VS Command Prompt first."
		return $false;
	}
	finally {
		$ErrorActionPreference = $previousErrorActionPreference
	}
	
	return $tfAvailable;
}

# Snapins can not be loaded from within a module
# see https://connect.microsoft.com/PowerShell/feedback/details/567037/loading-a-snapin-from-inside-a-module-function
Write-Verbose "Adding TFS PowerTools Cmdlets";

Add-PSSnapin Microsoft.TeamFoundation.PowerShell