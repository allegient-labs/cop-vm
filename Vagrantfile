
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = true

  # Port Forwarding Oracle Port
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # VirtualBox-specific configuration so you can fine-tune various
  config.vm.provider "virtualbox" do |vb|
    vb.name = "DMI-CoP-CentOS-7"
    vb.gui = false
    vb.linked_clone = true if Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new('1.8.0')
    vb.memory = "4096"
    vb.cpus = 2
  end

  # Enable provisioning with a shell script
  config.vm.provision :shell, path: "bootstrap.sh"
end
