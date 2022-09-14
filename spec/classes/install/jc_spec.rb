# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools::install::jc' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_archive('jc-1.20.0-linux-x86_64.tar.gz') }
      it { is_expected.to contain_file('/usr/local/sbin/jc') }
      it { is_expected.to contain_file('/opt/mst/jc-1.20.0') }
    end
  end
end
