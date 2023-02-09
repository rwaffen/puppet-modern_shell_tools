# @summary Installs a set of modern commandline tools
#
# @example
#   include modern_shell_tools
#
class modern_shell_tools {
  include modern_shell_tools::install
  include modern_shell_tools::install::bashtop
  include modern_shell_tools::install::bat
  include modern_shell_tools::install::broot
  include modern_shell_tools::install::dyff
  include modern_shell_tools::install::exa
  include modern_shell_tools::install::jc
  include modern_shell_tools::install::jq
  include modern_shell_tools::install::lfs
  include modern_shell_tools::install::viddy
  include modern_shell_tools::install::xsv
}
