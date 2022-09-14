# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools::install::broot' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_archive('broot_1.13.1.zip') }
      it { is_expected.to contain_file('/usr/local/sbin/broot') }
      it { is_expected.to contain_file('/opt/mst/broot-1.13.1') }
    end
  end
end
