function Run-Custom-Config { git --git-dir=$HOME/windows-env/ --work-tree=$HOME  $args } 
New-Alias -Name config -Value Run-Custom-Config