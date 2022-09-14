# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools::install::bashtop' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_vcsrepo('/opt/mst/bashtop-0.9.25') }
      it { is_expected.to contain_file('/usr/local/sbin/bashtop') }
    end
  end
end
