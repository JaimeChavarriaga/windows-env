# Create personal-env repository
git init --bare $HOME/personal-env

function Run-Personal-Config { git --git-dir=$HOME/personal-env/ --work-tree=$HOME  $args } 
New-Alias -Name secrets -Value Run-Personal-Config
secrets config --local status.showUntrackedFiles no
