# @summary A Modern watch command
#
# @example
#   include modern_shell_tools::install::viddy
#
# @param arch
# @param build
# @param version
# @param archive_name
# @param install_path
# @param bin_path
# @param create_path
#
class modern_shell_tools::install::viddy (
  String[1] $arch                    = $facts['os']['architecture'],
  String[1] $build                   = 'Linux',
  String[1] $version                 = '0.3.6',
  String[1] $archive_name            = "viddy_${version}_${build}_${arch}.tar.gz",
  Stdlib::Absolutepath $install_path = "/opt/mst/viddy-${version}",
  Stdlib::Absolutepath $bin_path     = '/usr/local/sbin',
  Stdlib::Absolutepath $create_path  = "${install_path}/viddy",
) {
  include modern_shell_tools::install

  file { $install_path:
    ensure => directory,
  }

  -> archive { $archive_name:
    path         => "/tmp/${archive_name}",
    source       => "https://github.com/sachaos/viddy/releases/download/v${version}/${archive_name}",
    extract      => true,
    extract_path => $install_path,
    creates      => $create_path,
    cleanup      => false,
  }

  -> file { "${bin_path}/viddy":
    ensure => link,
    target => $create_path,
  }
}
