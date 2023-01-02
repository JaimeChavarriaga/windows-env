# Windows environment

Configuration files (dotfiles) for Windows.

This repository is based on [the instructions in the Atalassian website](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).  It includes a `config` alias that can be used to manage the repository.

## Installation (using Powershell)

To install the configuration files, you must clone them into a [bare repository](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) and checkout the content into the `$HOME`.  

In addition, you must enable the execution of PowerShell scripts in order to run the `Profile.ps1` or the `Microsoft.PowerShell_profile.ps1` scripts at starting a session in Windows Terminal or Visual Studio Code. 

```
# clone repository
git clone --bare https://github.com/JaimeChavarriaga/windows-env.git $HOME/windows-env

# define alias for managing the configuration repository
function Run-Custom-Config { git --git-dir=$HOME/windows-env/ --work-tree=$HOME  $args } 
New-Alias -Name config -Value Run-Custom-Config

# define execution policy to run the profile scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# configure the repository
config config --local status.showUntrackedFiles no

# copy the configuration files overwritting existing ones
config checkout -f
```

**NOTE:** To use this configuration files in your own computers, you may configure `git` using a `.gitconfig` file and/or some of the following commands:

```
# configure git
git config --global user.name "Jaime Chavarriaga"
git config --global user.email JaimeChavarriaga@users.noreply.github.com
git config --global credential.helper manager
```

## Updating a configuration file

Use the `config` alias to update the configuration files.

```
config add <file-to-update>
config commit -m "<message-for-commit>"
config push -u origin main
```
