# @summary A cat(1) clone with syntax highlighting and Git integration.
#
# @example
#   include modern_shell_tools::install::bat
#
# @param arch
# @param build
# @param version
# @param archive_name
# @param install_path
# @param bin_path
# @param create_path
#
class modern_shell_tools::install::bat (
  String[1] $arch                    = 'x86_64',
  String[1] $build                   = 'linux',
  String[1] $version                 = '0.22.1',
  String[1] $archive_name            = "bat-v${version}-${arch}-unknown-${build}-gnu.tar.gz",
  Stdlib::Absolutepath $install_path = "/opt/mst/bat-${version}",
  Stdlib::Absolutepath $bin_path     = '/usr/local/sbin',
  Stdlib::Absolutepath $create_path  = "${install_path}/bat-v${version}-${arch}-unknown-${build}-gnu",
) {
  include modern_shell_tools::install

  file { $install_path:
    ensure => directory,
  }

  -> archive { $archive_name:
    path         => "/tmp/${archive_name}",
    source       => "https://github.com/sharkdp/bat/releases/download/v${version}/${archive_name}",
    extract      => true,
    extract_path => $install_path,
    creates      => $create_path,
    cleanup      => false,
  }

  -> file { "${bin_path}/bat":
    ensure => link,
    target => "${create_path}/bat",
  }
}
