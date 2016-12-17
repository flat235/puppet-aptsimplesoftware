class aptsimplesoftware::install inherits aptsimplesoftware {

  package { $packages: ensure => latest }
  package { $backports: ensure => latest }

}
