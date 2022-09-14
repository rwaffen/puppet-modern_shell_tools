# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools::install::exa' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_archive('exa-linux-x86_64-v0.10.0.zip') }
      it { is_expected.to contain_file('/usr/local/sbin/exa') }
      it { is_expected.to contain_file('/opt/mst/exa-0.10.0') }
    end
  end
end
