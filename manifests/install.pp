# @summary A private class for installing prerequirements
#
# @example
#   include modern_shell_tools::install
class modern_shell_tools::install {
  assert_private()

  package { ['wget', 'unzip', 'git']:
    ensure => installed,
  }

  file { '/opt/mst':
    ensure => directory,
  }

  Archive {
    provider => 'wget',
    require  => Package['wget', 'unzip'],
  }
}
