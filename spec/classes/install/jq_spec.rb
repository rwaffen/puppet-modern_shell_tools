# frozen_string_literal: true

require 'spec_helper'

describe 'modern_shell_tools::install::jq' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_file('/opt/mst/jq-1.6/jq-linux64') }
      it { is_expected.to contain_file('/usr/local/sbin/jq') }
      it { is_expected.to contain_file('/opt/mst/jq-1.6') }
    end
  end
end
