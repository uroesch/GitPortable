[![Build](https://github.com/uroesch/GitPortable/workflows/build-linux/badge.svg)](https://github.com/uroesch/GitPortable/actions?query=workflow%3Abuild-linux)
[![Build](https://github.com/uroesch/GitPortable/workflows/build-windows/badge.svg)](https://github.com/uroesch/GitPortable/actions?query=workflow%3Abuild-windows)
[![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/uroesch/GitPortable?include_prereleases)](https://github.com/uroesch/GitPortable/releases)
[![Runs on](https://img.shields.io/badge/runs%20on-Win64%20%26%20Win32-blue)](#runtime-dependencies)
![GitHub All Releases](https://img.shields.io/github/downloads/uroesch/GitPortable/total?style=flat)

# Git Portable for PortableApps.com

<img src="App/AppInfo/appicon_128.png" align=left>

[Git for Windows](https://gitforwindows.org/) focuses on offering a lightweight,
native set of tools that bring the full feature set of the Git SCM to Windows
while providing appropriate user interfaces for experienced Git users and novices
alike.

Packaged with this PortableApps build is the BASH emulation used to run Git from the
command line. \*NIX users should feel right at home, as the BASH emulation behaves
just like the "git" command in LINUX and UNIX environments.

## Runtime dependencies
* 32-bit or 64-bit version of Windows Vista or greater.

## Support matrix

| OS              | 32-bit             | 64-bit              |
|-----------------|:------------------:|:-------------------:|
| ReactOS 0.4.14  | ![ns][ns]          | ![na][na]           |
| ReactOS 0.4.15  | ![ns][ns]          | ![ns][ns]           |
| Windows XP      | ![ns][ns]          | ![ns][ns]           |
| Windows Vista   | ![ns][ns]          | ![ns][ns]           |
| Windows 7       | ![ns][ns]          | ![ns][ns]           |
| Windows 8       | ![ps][ps]          | ![ps][ps]           |
| Windows 10      | ![fs][fs]          | ![fs][fs]           |
| Windows 11      | ![na][na]          | ![fs][fs]           |

Legend: ![ns][ns] not supported; ![na][na] not applicable; ![nd][nd] no data; ![ps][ps] supported but not verified; ![fs][fs] verified;

**Note:** With version `2.27` the `mintty` terminal is stackdumping on Windows 7 and possibly Vista.
  The last version supported and tested on Windows 7 is `2.26.2`.

## Status
This PortableApps project is in beta stage.

## SSH key setup

To keep the git settings and the SSH keys portable accross machines the
home and start directory of the user are set to `%PAL:DataDir%\home` or in
more user friendly notation `...\PortableApps\GitPortable\Data\home`.

All the private SSH keys should be stored under the home's `.ssh` directory.

### Git Bash

#### OpenSSH

##### Generating a private key and public ssh key

After opening a `git-bash` session issue the command `ssh-keygen -t ed25519`
For more options and switches for `ssh-keygen` issue `ssh-keygen --help` or
consult the manual.

**Note**: Because the key may be used on potentially unsafe hosts it is strongly
  advised to protect the private key with a passphrase!

```console
$ ssh-keygen -t ed25519
Generating public/private ed25519 key pair.
Enter file in which to save the key (/e/PortableApps/GitPortable/Data/home/.ssh/id_ed25519): ⏎
Enter passphrase (empty for no passphrase): *******⏎
Enter same passphrase again: *******⏎
Your identification has been saved in /e/PortableApps/GitPortable/Data/home/.ssh/id_ed25519
Your public key has been saved in /e/PortableApps/GitPortable/Data/home/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:NT+krIKluNrqEOC3jCuomgfTMBuM5ZyxRlVPHpR+f5o urs@winnie-the-poo
The key's randomart image is:
+--[ED25519 256]--+
|   ....oo        |
|  +   .=         |
|+= + .  . = .    |
|B.* .    S =     |
|.O . .. S o o    |
|+.=..+.  .   .   |
|o+.oo.. .        |
|+oo.  ..    E    |
|@*o    ...o+     |
+----[SHA256]-----+
```

##### Passwordless git over SSH

Since the private SSH key is protected with a password each time `git` fetches
or pulls data via the SSH protocol the password prompt appears. But one can
start an `ssh-agent` add the key.


```console
$ eval $(ssh-agent)
Agent pid 1337

$ ssh-add
Enter passphrase for /e/PortableApps/GitPortable/Data/home/.ssh/id_ed25519: *******⏎
Identity added: /e/PortableApps/GitPortable/Data/home/.ssh/id_ed25519 (urs@winnie-the-poo)
```

Once setup remote git commands over the SSH protocol work without password prompts.

```console
$ git clone git@github.com:uroesch/GitPortable.git
Cloning into 'GitPortable'...
remote: Enumerating objects: 848, done.
remote: Counting objects: 100% (399/399), done.
remote: Compressing objects: 100% (230/230), done.
remote: Total 848 (delta 195), reused 265 (delta 128), pack-reused 449
Receiving objects: 100% (848/848), 417.09 KiB | 273.00 KiB/s, done.
Resolving deltas: 100% (382/382), done.
```

#### PuTTY

If PuTTY and its SSH agent `pageant` is already in use or more suitable
for your environment it can be used instead of the packaged OpenSSH.

##### Generating a PuTTY private key

Open the program `puttygen` to create a PuTTY private key.

<img src="Other/Images/puttygen-create-key.png" width="400">

Store the key preferably under `.../PortableApps/GitPortable/Data/home/.ssh/`

Open `pageant` and load the generated key into memory.

<img src="Other/Images/pageant-load-key.png" width="400">

Ensure the key is loaded unencrypted.

<img src="Other/Images/pageant-loaded-key.png" width="400">

##### Passwordless git over SSH

Once `pageant` is running and holding keys the following command allows
git to use it for authentication.

```console
$ eval $(ssh-pageant.exe)
ssh-pageant pid 1515
```

And then a git operation to verify.

```console
$ git clone git@github.com:uroesch/GitPortable.git
Cloning into 'GitPortable'...
remote: Enumerating objects: 856, done.
remote: Counting objects: 100% (407/407), done.
remote: Compressing objects: 100% (235/235), done.
remote: Total 856 (delta 199), reused 272 (delta 130), pack-reused 449
Receiving objects: 100% (856/856), 419.32 KiB | 657.00 KiB/s, done.
Resolving deltas: 100% (386/386), done.
```

### Git Cmd

#### OpenSSH

##### Generating a private key and public ssh key

To create a ssh private and public key follo the instructions under
the **Git Bash** section they are identical under `git-cmd`.

##### Passwordless git over SSH

Once the keys are in place there is a CMD script which starts an agent and adds
the keys available in the home's `.ssh` directory into the store.

```console
E:\PortableApps\GitPortable\Data\home>start-ssh-agent
Removing old ssh-agent sockets
Starting ssh-agent:  done
Enter passphrase for /e/PortableApps/GitPortable/Data/home/.ssh/id_ed25519:
Identity added: /e/PortableApps/GitPortable/Data/home/.ssh/id_ed25519 (urs@winnie-the-poo)
```

Once the key is added git can be used passwordless with SSH URLs.

```console
E:\PortableApps\GitPortable\Data\home>git clone git@github.com:uroesch/GitPortable.git
Cloning into 'GitPortable'...
remote: Enumerating objects: 893, done.
remote: Counting objects: 100% (444/444), done.
remote: Compressing objects: 100% (262/262), done.
Receiving objects: 100% (893/893), 604.09 KiB | 2.65 MiB/s, done.d 449Receiving objects:  95% (849/893)

Resolving deltas: 100% (408/408), done.
```

#### PuTTY


##### Generating a PuTTY private key

For creating a PuTTY private key refer to the `git-bash` section above.

##### Passwordless git over SSH

To link the running `pageant` process with the git command use the
`start-ssh-pageant` CMD script.

```console
E:\PortableApps\GitPortable\Data\home>start-ssh-pageant
Starting ssh-pageant...
SSH_AUTH_SOCK='/tmp/ssh-V7OwXRH4HEpm/agent.660'
```

Once done SSH URLs will work without asking for a password.

```console
E:\PortableApps\GitPortable\Data\home>git clone git@github.com:uroesch/GitPortable.git
Cloning into 'GitPortable'...
remote: Enumerating objects: 893, done.
remote: Counting objects: 100% (444/444), done.
remote: Compressing objects: 100% (262/262), done.
Receiving objects:  94% (840/893), 348.01 KiB | 548.00 KiB/sremote: Total 893 (delta 221), reused 297 (delta 140), pack-Receiving objects: 100% (893/893), 604.09 KiB | 676.00 KiB/s, done.

Resolving deltas: 100% (408/408), done.
```

<!-- Start include INSTALL.md -->
## Installation

### Download

Since this is not an official PortableApp the PortableApps installer must
be download first. Navigate to https://github.com/uroesch/GitPortable/releases
for a selection of releases.

### Install via the PortableApps.com Platform

After downloading the `.paf.exe` installer navigate to your PortableApps.com Platform
`Apps` Menu &#10102; and select `Install a new app (paf.exe)` &#10103;.

<img src="Other/Images/install_newapp_menu.png" width="400">

From the dialog choose the previously downloaded `.paf.exe` file. &#10104;

<img src="Other/Images/install_newapp_dialog.png" width="400">

After a short while the installation dialog will appear.

<img src="Other/Images/install_newapp_installation.png" width="400">


### Install outside of the PortableApps.com Platform

The Packages found under the release page are not digitally signed so there the installation
is a bit involved.

After downloading the `.paf.exe` installer trying to install may result in a windows defender
warning.

<img src="Other/Images/info_defender-protected.png" width="260">

To unblock the installer and install the application follow the annotated screenshot below.

<img src="Other/Images/howto_unblock-file.png" width="600">

1. Right click on the executable file.
2. Choose `Properties` at the bottom of the menu.
3. Check the unblock box.
<!-- End include INSTALL.md -->

<!-- Start include BUILD.md -->
### Build

#### Windows

##### Windows 10

The only supported build platform for Windows is version 10 other releases
have not been tested.

###### Clone repositories

```
git clone https://github.com/uroesch/PortableApps.comInstaller.git
git clone -b patched https://github.com/uroesch/PortableApps.comLauncher.git
git clone https://github.com/uroesch/GitPortable.git
```

###### Build installer

```
cd GitPortable
powershell -ExecutionPolicy ByPass -File Other/Update/Update.ps1
```

#### Linux

##### Docker

Note: This is currently the preferred way of building the PortableApps installer.

For a Docker build run the following command.

###### Clone repo

```
git clone https://github.com/uroesch/GitPortable.git
```

###### Build installer

```
cd GitPortable
curl -sJL https://raw.githubusercontent.com/uroesch/PortableApps/master/scripts/docker-build.sh | bash
```

#### Local build

##### Ubuntu 20.04

To build the installer under Ubuntu 20.04 `Wine`, `PowerShell`, `7-Zip` and when building headless
`Xvfb` are required.

###### Setup
```
sudo snap install powershell --classic
sudo apt --yes install git wine p7zip-full xvfb
```

When building headless run the below command starts a virtual Xserver required for the build to
succeed.

```
export DISPLAY=:7777
Xvfb ${DISPLAY} -ac &
```

###### Clone repositories

```
git clone https://github.com/uroesch/PortableApps.comInstaller.git
git clone -b patched https://github.com/uroesch/PortableApps.comLauncher.git
git clone https://github.com/uroesch/GitPortable.git
```

###### Build installer

```
cd GitPortable
pwsh Other/Update/Update.ps1
```

##### Ubuntu 18.04

To build the installer under Ubuntu 18.04 `Wine`, `PowerShell`, `7-Zip` and when building headless
`Xvfb` are required.

###### Setup
```
sudo snap install powershell --classic
sudo apt --yes install git p7zip-full xvfb
sudo dpkg --add-architecture i386
sudo apt update
sudo apt --yes install wine32
```

When building headless run the below command starts a virtual Xserver required for the build to
succeed.

```
export DISPLAY=:7777
Xvfb ${DISPLAY} -ac &
```

###### Clone repositories

```
git clone https://github.com/uroesch/PortableApps.comInstaller.git
git clone -b patched https://github.com/uroesch/PortableApps.comLauncher.git
git clone https://github.com/uroesch/GitPortable.git
```

###### Build installer

```
cd GitPortable
pwsh Other/Update/Update.ps1
```
<!-- End include BUILD.md -->

[nd]: Other/Icons/no_data.svg
[na]: Other/Icons/not_applicable.svg
[ns]: Other/Icons/no_support.svg
[ps]: Other/Icons/probably_supported.svg
[fs]: Other/Icons/full_support.svg
