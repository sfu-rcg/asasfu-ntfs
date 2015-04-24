# == Class: ntfs
#
# Module to allow yum install and dependency management of ntfs 
# while allowing you to pick repos to enable for the run.
#
# === Parameters
#
# [*ensure_version*]
#  Ensure parameter passed to Package resource to ensure specific version or other 
#   option such as latest
#   Default: latest
#
# === Examples
#
#  class { '::ntfs':
#    ensure_version => '2.1.5-2.el7.nux',
#  }
#
# === Authors
#
# Adam S <asa188@sfu.ca>
#
# === Copyright
#
# Copyright 2015 Simon Fraser University, unless otherwise noted.
#
class ntfs (
  $ensure_version = 'latest',
  $required_repos = $::ntfs::params::required_repos
  ) inherits ::ntfs::params {
  package { 'ntfs-3g':
    ensure          => "${ensure_version}",
    install_options => { "--enablerepo" => "${required_repos}" },
  }
  package { 'ntfsprogs':
    ensure          => "${ensure_version}",
    install_options => { "--enablerepo" => "${required_repos}" },
  }
}
