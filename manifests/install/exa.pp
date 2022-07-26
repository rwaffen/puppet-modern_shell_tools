# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include modern_shell_tools::install::exa
class modern_shell_tools::install::exa (
  String[1] $arch                    = $facts['os']['architecture'],
  String[1] $build                   = 'linux',
  String[1] $version                 = '0.10.0',
  String[1] $archive_name            = "exa-${build}-${arch}-v${version}.zip",
  Stdlib::Absolutepath $install_path = "/opt/mst/exa-${version}",
  Stdlib::Absolutepath $bin_path     = '/usr/local/sbin',
  Stdlib::Absolutepath $create_path  = "${install_path}/bin",
) {
  include modern_shell_tools::install

  file { $install_path:
    ensure => directory,
  }

  -> archive { $archive_name:
    path         => "/tmp/${archive_name}",
    source       => "https://github.com/ogham/exa/releases/download/v${version}/${archive_name}",
    extract      => true,
    extract_path => $install_path,
    creates      => $create_path,
    cleanup      => false,
  }

  -> file { "${bin_path}/exa":
    ensure => link,
    target => "${create_path}/exa",
  }
}
