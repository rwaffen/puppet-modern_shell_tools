# @summary A tree explorer and a customizable launcher
#
# @example
#   include modern_shell_tools::install::broot
#
# @param arch
# @param build
# @param version
# @param archive_name
# @param install_path
# @param bin_path
# @param create_path
#
class modern_shell_tools::install::broot (
  String[1] $arch                    = $facts['os']['architecture'],
  String[1] $build                   = 'linux',
  String[1] $version                 = '1.13.1',
  String[1] $archive_name            = "broot_${version}.zip",
  Stdlib::Absolutepath $install_path = "/opt/mst/broot-${version}",
  Stdlib::Absolutepath $bin_path     = '/usr/local/sbin',
  Stdlib::Absolutepath $create_path  = "${install_path}/${arch}-unknown-${build}-gnu",
) {
  include modern_shell_tools::install

  file { $install_path:
    ensure => directory,
  }

  -> archive { $archive_name:
    path         => "/tmp/${archive_name}",
    source       => "https://github.com/Canop/broot/releases/download/v${version}/${archive_name}",
    extract      => true,
    extract_path => $install_path,
    creates      => $create_path,
    cleanup      => false,
  }

  -> file { "${bin_path}/broot":
    ensure => link,
    target => "${create_path}/broot",
  }
}
