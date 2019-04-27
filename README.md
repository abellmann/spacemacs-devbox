# Spacemacs Devbox

This installation creates an ubuntu based development environment for spacemacs. The intention is to have a minimal linux system with an X windows installation for keyboard enthusiasts preconfigured with spacemacs.

The system can and should be used without mouse interaction and provides all features, that make mouseless linux easy and fast.

The box is available on the vagrant box repository under <https://app.vagrantup.com/abellmann/boxes/spacemacs-devbox>. Setting up this box therefore just requires VirtualBox and Vagrant.

You can download and start this box with

``` sh
vagrant init abellmann/spacemacs-devbox
vagrant up
```

# Requirements

To create this box yourself you need to install vagrant and virtualbox. For vagrant you also need the vbguest plugin. You can install it with

``` sh
vagrant plugin install vagrant-vbguest
```

# Building this box

To run the provision process you just have to start the vagrant box with `vagrant up` 

If you want to restart the ansible provisioning process after the first start of the box , you can do the following

``` sh
vagrant provision --provision-with ansible_local
```

# Creating your own Ansible Galaxy box

You can install this box under your own galaxy account. To create and upload the box do the following

I publish the box as follows

``` sh
vagrant package --base spacemacs-devbox
vagrant cloud auth login
vagrant cloud publish abellmann/spacemacs-devbox 0.0.3 virtualbox package.box
```

# Ansible 

The box is provisioned with ansible. If you want to create this box from scratch, you can just clone this repository and then run `vagrant up` in the cloned directory.

This box includes the following features.

- A git installation
- zsh instead of standard bash shell
- an installation of oh-my-zsh with some of the most commonly used plugins
- an X windows installation
- the urxvt terminal manager
- the ratpoison window manager (no mouse control, everything controlled through the keyboard)
- A spacemacs installation
- docker and docker-compose
- an ansible installation to easily extend the dev box
- an us-english international keyboard without dead keys (see <https://zuttobenkyou.wordpress.com/2011/08/24/xorg-using-the-us-international-altgr-intl-variant-keyboard-layout>)
- the extended keyboard navigation layer of dreymar (see <https://forum.colemak.com/topic/2014-extend-extra-extreme/>)

Some notes regarding the installation:

## Ratpoison

Ratpoison is a simple Window Manager with no fat library dependencies, no fancy graphics, no window decorations, and no rodent dependence. All interaction with the window manager is done through keystrokes. See <https://www.nongnu.org/ratpoison/>

I preconfigured the following keystrokes. "Win" is the super key (i.e. on Windows machines the windows key, on Macos the command key, on others whatever is close to the alt key - see also <https://unix.stackexchange.com/questions/119212/mod-meta-super-keys)>:

- Win+e: Open a new emacs frame
- Win+x: open a bash window in urxvt terminal
- Win+f: open firefox
- Alt-Tab/Shift-Alt-Tab: switch between open windows
- Win+\ ?: show command reference with all other commands

## ZSH installation

I am using zsh with the oh-my-zsh extension to have an efficient and simple to use command line with power features.

The following oh-my-zsh extensions are installed:

- git and git-flow support (aliases for git commands)
- docker support (mostly docker aliases and shortcuts)
- z to jump around your most frequently used directories (see <https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z>)
- vi-mode to enable vim like editing of the command line
- syntax highlighting

## Spacemacs installation

The installation installs emacs and runs it as a daemon service and configures spacemacs with its defaults and provides some shell aliases for emacs, i.e.

- 'e': open file in emacs
- 'se': open file in emacs with admin permissions

The Source Code Pro fonts preferred by Spacemacs are also installed.

## Docker

This installation includes a docker and docker-compose installation to run any additional tools you might need.

## Ansible

This installation includes ansible to extend the basic installation provided.

## Users and directories

The VM uses the standard vagrant user (i.e the user is called "vagrant"). vagrant has sudo privileges

The following directories and files are configured

|Directory|Description|
|---------|-----------|
|/home/vagrant/.emacs.d/|The spacemacs installation|
|/home/vagrant/.spacemacs| The spacemacs config file|
|/home/vagrant/.xsession| X windows configuration|
|/home/vagrant/.zshrc| zsh configuration|
|/home/vagrant/.oh-my-zsh| the installation and configuration of oh-my-zsh|
|/home/vagrant/.ratpoisonrc| ratpoison configuration|
|/home/vagrant/extend-keyboard| the keyboard navigation layer installation|
