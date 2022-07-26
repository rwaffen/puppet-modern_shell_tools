# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include modern_shell_tools::install
class modern_shell_tools::install {
  package { ['wget', 'unzip']:
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
