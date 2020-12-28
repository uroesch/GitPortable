[![Build](https://github.com/uroesch/GitPortable/workflows/build-package/badge.svg)](https://github.com/uroesch/GitPortable/actions?query=workflow%3Abuild-package)
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
| Windows XP      | ![ns][ns]          | ![ns][ns]           | 
| Windows Vista   | ![ns][ns]          | ![ns][ns]           | 
| Windows 7       | ![ns][ns]          | ![ns][ns]           |  
| Windows 8       | ![ps][ps]          | ![ps][ps]           |  
| Windows 10      | ![fs][fs]          | ![fs][fs]           |

Legend: ![ns][ns] not supported;  ![nd][nd] no data; ![ps][ps] supported but not verified; ![fs][fs] verified;`

**Note:** With version `2.27` the `mintty` terminal is stackdumping on Windows 7 and possibly Vista. 
  The last version supported and tested on Windows 7 is `2.26.2`.

## Status 
This PortableApps project is in beta stage. 

## Todo
- [ ] Documentation


<!-- Start include INSTALL.md -->
## Installation

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

#### Preparation 

##### Install build infra

Note: When building with docker this steps is not required. 

```
git clone https://github.com/uroesch/PortableApps.comInstaller.git
git clone -b patched https://github.com/uroesch/PortableApps.comLauncher.git
```

##### Clone repository

```
git clone https://github.com/uroesch/GitPortable.git
cd GitPortable
```

#### Windows 

##### Windows 10

The only supported build platform for Windows is version 10 other releases
have not been tested.

To build the installer run the following command in the root of the git
repository.

```
powershell -ExecutionPolicy ByPass -File Other/Update/Update.ps1
```

#### Linux

##### Docker

Note: This is currently the preferred way of building the PortableApps installer.

For a Docker build run the following command.

```
curl -sJL https://raw.githubusercontent.com/uroesch/PortableApps/master/scripts/docker-build.sh | bash
```

#### Local build

To build the installer under Linux with `Wine` and `PowerShell` installed run the
command below.

```
pwsh Other/Update/Update.ps1
```
<!-- End include BUILD.md -->

[nd]: Other/Icons/no_data.svg
[ns]: Other/Icons/no_support.svg
[ps]: Other/Icons/probably_supported.svg
[fs]: Other/Icons/full_support.svg
