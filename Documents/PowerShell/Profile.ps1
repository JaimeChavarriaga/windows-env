# Profile for PowerShell

# Add-Path function
# https://www.splunk.com/en_us/blog/tips-and-tricks/powershell-profiles-and-add-path.html

function Add-Path {
  <#
    .SYNOPSIS
      Adds a Directory to the Current Path
    .DESCRIPTION
      Add a directory to the current path.  This is useful for 
      temporary changes to the path or, when run from your 
      profile, for adjusting the path within your powershell 
      prompt.
    .EXAMPLE
      Add-Path -Directory "C:\Program Files\Notepad++"
    .PARAMETER Directory
      The name of the directory to add to the current path.
  #>

  [CmdletBinding()]
  param (
    [Parameter(
      Mandatory=$True,
      ValueFromPipeline=$True,
      ValueFromPipelineByPropertyName=$True,
      HelpMessage='What directory would you like to add?')]
    [Alias('dir')]
    [string[]]$Directory
  )

  PROCESS {
    $Path = $env:PATH.Split(';')

    foreach ($dir in $Directory) {
      if ($Path -contains $dir) {
        Write-Verbose "$dir is already present in PATH"
      } else {
        if (-not (Test-Path $dir)) {
          Write-Verbose "$dir does not exist in the filesystem"
        } else {
          $Path += $dir
        }
      }
    }

    $env:PATH = [String]::Join(';', $Path)
  }
}

# add $HOME/bin to PATH
Add-Path -Directory $HOME/bin

# set 'config' alias for managing configuration files
function Run-Custom-Config { git --git-dir=$HOME/windows-env/ --work-tree=$HOME  $args } 
New-Alias -Name config -Value Run-Custom-Config

# set 'secrets' alias for managing secrets and personal files
function Run-Personal-Config { git --git-dir=$HOME/personal-env/ --work-tree=$HOME  $args } 
New-Alias -Name secrets -Value Run-Personal-Config

