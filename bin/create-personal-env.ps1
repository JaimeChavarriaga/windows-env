# create personal-env repository
git init --bare $HOME/personal-env

# create a PowerShell "secrets" alias for the personal-env repository 
function Run-Personal-Config { git --git-dir=$HOME/personal-env/ --work-tree=$HOME  $args } 
New-Alias -Name secrets -Value Run-Personal-Config

# configure the personal-env repository
secrets branch -M main
secrets config --local status.showUntrackedFiles no
