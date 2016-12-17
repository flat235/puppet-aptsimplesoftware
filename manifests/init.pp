# Class: aptsimplesoftware
# ===========================
#
# (Un)Installs packages via apt.
#
# Parameters
# ----------
#
# Document parameters here.
# 
# * `mirror`
# The mirror to use. Defaults to ftp://ftp.debian.org
#
# * `mirror_security`
# The mirror for security updates to use. Defaults to ftp://security.debian.org
#
# * `release`
# The release name. Default to jessie
#
# * `repos`
# The repos to include. Defaults to main contrib non-free
#
# * `packages`
# The list of packages to install. Defaults to an empty list.
#
# * `backports`
# The list of packages to install from backports. Defaults to an empty list.
#
# * `uninstall`
# The list of packages to uninstall. Defaults to an empty list.
# Uninstalls happen before installs, so packages may be reinstalled because of dependencies.
#
# Examples
# --------
#
# @example
#    class { 'aptsimplesoftware':
#      mirror => 'ftp://localmirror',
#      mirror_security => 'ftp://localsecuritymirror',
#      release => 'jessie',
#      repos => 'main contrib non-free',
#      packages => [ 'vim', 'tmux' ],
#      backports => [ 'kernel', 'that', 'supports', 'this', 'centurys', 'hardware' ],
#      uninstall => [ 'emacs', 'screen' ]
#    }
#
# Authors
# -------
#
# Moritz Bellach <moritzbellach@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Moritz Bellach, unless otherwise noted.
#
class aptsimplesoftware (
  String $mirror = $params::mirror,
  String $mirror_security = $params::mirror_security,
  String $release = $params::release,
  String $repos = $params::repos,
  Array[String] $packages = [],
  Array[String] $backports = [],
  Array[String] $uninstall = []
) inherits aptsimplesoftware::params {

  contain aptsimplesoftware::config
  contain aptsimplesoftware::install

  Class['aptsimplesoftware::config'] ->
  Class['aptsimplesoftware::uninstall'] ->
  Class['aptsimplesoftware::install']
  
}
