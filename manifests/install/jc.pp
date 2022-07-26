# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include modern_shell_tools::install::jc
class modern_shell_tools::install::jc (
  String[1] $arch                    = $facts['os']['architecture'],
  String[1] $build                   = 'linux',
  String[1] $version                 = '1.20.0',
  String[1] $archive_name            = "jc-${version}-${build}-${arch}.tar.gz",
  Stdlib::Absolutepath $install_path = "/opt/mst/jc-${version}",
  Stdlib::Absolutepath $bin_path     = '/usr/local/sbin',
  Stdlib::Absolutepath $create_path  = "${install_path}/jc",
) {
  include modern_shell_tools::install

  file { $install_path:
    ensure => directory,
  }

  -> archive { $archive_name:
    path         => "/tmp/${archive_name}",
    source       => "https://github.com/kellyjonbrazil/jc/releases/download/v${version}/${archive_name}",
    extract      => true,
    extract_path => $install_path,
    creates      => $create_path,
    cleanup      => false,
  }

  -> file { "${bin_path}/jc":
    ensure => link,
    target => $create_path,
  }
}
