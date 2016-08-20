# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
  
  config.vm.provision "shell", path: "install_esp8266_toolchain.sh", privileged: false
end
