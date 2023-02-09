# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools::install::bat' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_archive('bat-v0.22.1-x86_64-unknown-linux-gnu.tar.gz') }
      it { is_expected.to contain_file('/usr/local/sbin/bat') }
      it { is_expected.to contain_file('/opt/mst/bat-0.22.1') }
    end
  end
end
