Vagrant.configure("2") do |config|
  config.vm.box = "betadots/centos8p6"
  config.vm.synced_folder ".", "/etc/puppetlabs/code/environments/production/modules/modern_shell_tools"
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  config.vm.provider "virtualbox" do |vb|
    vb.cpus   = 2
    vb.memory = 1024
  end

  $rhel_script = <<-SCRIPT
    yum remove  -q -y puppet6-release
    yum install -q -y https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
    yum update  -q -y puppet-agent
    /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib
    /opt/puppetlabs/bin/puppet module install puppet-archive
  SCRIPT

  config.vm.provision :shell, inline: $rhel_script
end
