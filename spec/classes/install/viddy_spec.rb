# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools::install::viddy' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_archive('viddy_0.3.6_Linux_x86_64.tar.gz') }
      it { is_expected.to contain_file('/usr/local/sbin/viddy') }
      it { is_expected.to contain_file('/opt/mst/viddy-0.3.6') }
    end
  end
end
