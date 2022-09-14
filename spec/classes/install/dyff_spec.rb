# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools::install::dyff' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_archive('dyff_1.5.4_linux_amd64.tar.gz') }
      it { is_expected.to contain_file('/usr/local/sbin/dyff') }
      it { is_expected.to contain_file('/opt/mst/dyff-1.5.4') }
    end
  end
end
