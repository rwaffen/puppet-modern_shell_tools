# @summary A commandline JSON processor
#
# @example
#   include modern_shell_tools::install::jq
#
# @param build
# @param version
# @param archive_name
# @param install_path
# @param bin_path
# @param create_path
#
class modern_shell_tools::install::jq (
  String[1] $build                   = 'linux64',
  String[1] $version                 = '1.6',
  String[1] $archive_name            = "jq-${build}",
  Stdlib::Absolutepath $install_path = "/opt/mst/jq-${version}",
  Stdlib::Absolutepath $bin_path     = '/usr/local/sbin',
  Stdlib::Absolutepath $create_path  = "${install_path}/${archive_name}",
) {
  include modern_shell_tools::install

  file { $install_path:
    ensure => directory,
  }

  -> file { "${install_path}/${archive_name}":
    ensure => file,
    source => "https://github.com/stedolan/jq/releases/download/jq-${version}/${archive_name}",
    mode   => '0755',
  }

  -> file { "${bin_path}/jq":
    ensure => link,
    target => $create_path,
  }
}
