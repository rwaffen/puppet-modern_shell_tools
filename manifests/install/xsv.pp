# @summary A suite of CSV command line utilities
#
# @example
#   include modern_shell_tools::install::xsv
#
# @param arch
# @param build
# @param version
# @param archive_name
# @param install_path
# @param bin_path
# @param create_path
#
class modern_shell_tools::install::xsv (
  String[1] $arch                    = $facts['os']['architecture'],
  String[1] $build                   = 'linux',
  String[1] $version                 = '0.13.0',
  String[1] $archive_name            = "xsv-${version}-${arch}-unknown-${build}-musl.tar.gz",
  Stdlib::Absolutepath $install_path = "/opt/mst/xsv-${version}",
  Stdlib::Absolutepath $bin_path     = '/usr/local/sbin',
  Stdlib::Absolutepath $create_path  = "${install_path}/xsv",
) {
  include modern_shell_tools::install

  file { $install_path:
    ensure => directory,
  }

  -> archive { $archive_name:
    path         => "/tmp/${archive_name}",
    source       => "https://github.com/BurntSushi/xsv/releases/download/${version}/${archive_name}",
    extract      => true,
    extract_path => $install_path,
    creates      => $create_path,
    cleanup      => false,
  }

  -> file { "${bin_path}/xsv":
    ensure => link,
    target => $create_path,
  }
}
