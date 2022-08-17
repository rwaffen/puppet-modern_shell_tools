# @summary A modern replacement for top/htop
#
# @example
#   include modern_shell_tools::install::bashtop
#
# @param version
# @param install_path
# @param bin_path
#
class modern_shell_tools::install::bashtop (
  String[1] $version                 = '0.9.25',
  Stdlib::Absolutepath $install_path = "/opt/mst/bashtop-${version}",
  Stdlib::Absolutepath $bin_path     = '/usr/local/sbin',
) {
  vcsrepo { $install_path:
    ensure   => present,
    provider => git,
    source   => 'https://github.com/aristocratos/bashtop.git',
    revision => "v${version}",
  }
  -> file { "${bin_path}/bashtop":
    ensure => link,
    target => "${install_path}/bashtop",
  }
}
