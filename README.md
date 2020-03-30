[![Build](https://github.com/uroesch/GitPortable/workflows/build-package/badge.svg)](https://github.com/uroesch/GitPortable/actions?query=workflow%3Abuild-package)
[![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/uroesch/GitPortable?include_prereleases)](https://github.com/uroesch/GitPortable/releases)
[![Runs on](https://img.shields.io/badge/runs%20on-Win64%20%26%20Win32-blue)](#runtime-dependencies)

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

| OS              | 32-bit                  | 64-bit         | 
|-----------------|:------------------:|:-------------------:|
| Windows XP      | :no_entry_sign:    | :no_entry_sign:     | 
| Windows Vista   | :white_check_mark: | :white_check_mark:  | 
| Windows 7       | :white_check_mark: | :white_check_mark:  |  
| Windows 8       | :white_check_mark: | :white_check_mark:  | 
| Windows 10      | :heavy_check_mark: | :heavy_check_mark:  |

Legend: :no_entry_sign: not supported; :white_check_mark: supposed to work but not verified; :heavy_check_mark: verified;

## Status 
This PortableApps project is in beta stage. 

## Todo
- [ ] Documentation

## Build

### Prerequisites

* [PortableApps.com Launcher](https://portableapps.com/apps/development/portableapps.com_launcher)
* [PortableApps.com Installer](https://portableapps.com/apps/development/portableapps.com_installer)
* [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7)
* [Wine (Linux / MacOS only)](https://www.winehq.org/)

### Build

To build the installer run the following command in the root of the git repository.

```
powershell Other/Update/Update.ps1
```
