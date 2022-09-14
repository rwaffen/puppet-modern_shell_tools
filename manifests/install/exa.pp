# @summary A modern replacement for ls
#
# @example
#   include modern_shell_tools::install::exa
#
# @param arch
# @param build
# @param version
# @param archive_name
# @param install_path
# @param bin_path
# @param create_path
#
class modern_shell_tools::install::exa (
  String[1] $arch                    = 'x86_64',
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
