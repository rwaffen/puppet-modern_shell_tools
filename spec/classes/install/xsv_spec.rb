# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools::install::xsv' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_archive('xsv-0.13.0-x86_64-unknown-linux-musl.tar.gz') }
      it { is_expected.to contain_file('/usr/local/sbin/xsv') }
      it { is_expected.to contain_file('/opt/mst/xsv-0.13.0') }
    end
  end
end
