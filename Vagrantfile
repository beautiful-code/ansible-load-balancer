# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create management node
  config.vm.define :management do |management_config|
    management_config.vm.box = "ubuntu/trusty64"
    management_config.vm.hostname = "management"
    management_config.vm.network :private_network, ip: "10.0.15.10"
    management_config.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
    management_config.vm.provision :shell, path: "scripts/bootstrap-management.sh"
  end

  # create load balancer
  config.vm.define :lb do |lb_config|
    lb_config.vm.box = "ubuntu/trusty64"
    lb_config.vm.hostname = "lb"
    lb_config.vm.network :private_network, ip: "10.0.15.11"
    lb_config.vm.network "forwarded_port", guest: 80, host: 8080
    lb_config.vm.provider "virtualbox" do |vb|
      vb.memory = "256"
    end
  end

  # create some web servers
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..4).each do |i|
    config.vm.define "web#{i}" do |node|
      node.vm.box = "ubuntu/trusty64"
      node.vm.hostname = "web#{i}"
      node.vm.network :private_network, ip: "10.0.15.2#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
    end
  end

end

