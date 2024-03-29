# @summary δyƒƒ /ˈdʏf/ - a diff tool for YAML files, and sometimes JSON
#
# @example
#   include modern_shell_tools::install::dyff
#
# @param arch
# @param build
# @param version
# @param archive_name
# @param install_path
# @param bin_path
# @param create_path
#
class modern_shell_tools::install::dyff (
  String[1] $arch                    = 'amd64',
  String[1] $build                   = 'linux',
  String[1] $version                 = '1.5.4',
  String[1] $archive_name            = "dyff_${version}_${build}_${arch}.tar.gz",
  Stdlib::Absolutepath $install_path = "/opt/mst/dyff-${version}",
  Stdlib::Absolutepath $bin_path     = '/usr/local/sbin',
  Stdlib::Absolutepath $create_path  = "${install_path}/dyff",
) {
  include modern_shell_tools::install

  file { $install_path:
    ensure => directory,
  }

  -> archive { $archive_name:
    path         => "/tmp/${archive_name}",
    source       => "https://github.com/homeport/dyff/releases/download/v${version}/${archive_name}",
    extract      => true,
    extract_path => $install_path,
    creates      => $create_path,
    cleanup      => false,
  }

  -> file { "${bin_path}/dyff":
    ensure => link,
    target => $create_path,
  }
}
