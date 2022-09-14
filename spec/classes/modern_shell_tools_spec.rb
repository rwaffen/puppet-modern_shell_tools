# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('modern_shell_tools::install')}
      it { is_expected.to contain_class('modern_shell_tools::install::bashtop')}
      it { is_expected.to contain_class('modern_shell_tools::install::broot')}
      it { is_expected.to contain_class('modern_shell_tools::install::dyff')}
      it { is_expected.to contain_class('modern_shell_tools::install::exa')}
      it { is_expected.to contain_class('modern_shell_tools::install::jc')}
      it { is_expected.to contain_class('modern_shell_tools::install::jq')}
      it { is_expected.to contain_class('modern_shell_tools::install::lfs')}
      it { is_expected.to contain_class('modern_shell_tools::install::viddy')}
      it { is_expected.to contain_class('modern_shell_tools::install::xsv')}
      it { is_expected.to contain_file('/opt/mst')}
      it { is_expected.to contain_package('git')}
      it { is_expected.to contain_package('unzip')}
      it { is_expected.to contain_package('wget')}
    end
  end
end
