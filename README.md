# aptsimplesoftware

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with aptsimplesoftware](#setup)
    * [What aptsimplesoftware affects](#what-aptsimplesoftware-affects)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module configures the apt repositories, installs software from normal and backports sources and uninstalls software.

You should use this if you want to install a bunch of packages at once, which require no further configuration or actions.

## Setup

### What aptsimplesoftware affects

* This module clears out `/etc/apt/sources.list` and puts the repositories into `/etc/apt/sources.list.d/*`
* Also in `/etc/apt/preferences.d/*` files may be touched to pin packages
* Obiously this (un)installs software
* Dependencies: the apt module by puppetlabs
* Configure your mirrors!
* uninstalls happen before installs (so unknown dependencies may be reinstalled)

## Usage
Example:
```puppet
class { 'aptsimplesoftware':
  mirror => 'ftp://localmirror',
  mirror_security => 'ftp://localsecuritymirror',
  release => 'jessie',
  repos => 'main contrib non-free',
  packages => [ 'vim', 'tmux' ],
  backports => [ 'kernel', 'that', 'supports', 'this', 'centurys', 'hardware' ],
  uninstall => [ 'emacs', 'screen' ]
}
```
All parameters are optional.

## Reference
Parameters:

* `mirror`
The mirror to use. Defaults to ftp://ftp.debian.org

* `mirror_security`
The mirror for security updates to use. Defaults to ftp://security.debian.org

* `release`
The release name. Default to jessie

* `repos`
The repos to include. Defaults to main contrib non-free

* `packages`
The list of packages to install. Defaults to an empty list.

* `backports`
The list of packages to install from backports. Defaults to an empty list.

* `uninstall`
The list of packages to uninstall. Defaults to an empty list.

## Limitations

This module assumes debian, release jessie. On other releases or distributions based on debian your milage my vary.
Also I haven't done much of any testing as of yet.

## Development

Pull request and bug reports are very welcome :)
License is Apache 2.0
