# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools::install::lfs' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_archive('lfs_2.5.0.zip') }
      it { is_expected.to contain_file('/usr/local/sbin/lfs') }
      it { is_expected.to contain_file('/opt/mst/lfs-2.5.0') }
    end
  end
end
