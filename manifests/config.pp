class aptsimplesoftware::config inherits aptsimplesoftware {

  class { 'apt':
    purge => { 'sources.list' => true }
  }

  apt::source { 'debian':
    location => "$mirror/debian",
    release => $release,
    repos => $repos
  }

  apt::source { 'debian-updates':
    location => "$mirror/debian",
    release => "$release-updates",
    repos => $repos
  }

  apt::source { 'debian-backports':
    location => "$mirror/debian",
    release => "$release-backports",
    repos => $repos
  }

  apt::source { 'debian-security':
    location => "$mirror/debian-security",
    release => "$release/updates",
    repos => $repos
  }

  apt::pin { 'backports_packages':
    packages => $backports,
    priority => 600,
    release => 'jessie-backports'
  }

}
