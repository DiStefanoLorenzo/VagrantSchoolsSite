# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false # Permette di accedere via SSH senza errori
    VMNAMEWEB = "web.m340"
    VMNAMEDB = "db.m340"
    VMRAM = "1024"
    BASE_INT_NETWORK = "10.10.20"
    BASE_HOST_ONLY_NETWORK = "192.168.56"
    
    # [Macchina Apache]
    config.vm.define VMNAMEWEB  do |subconfig|
      subconfig.vm.box = "ubuntu/jammy64"
      subconfig.vm.provision "shell", path: "provision-update.sh" # apt update
      subconfig.vm.provision "shell", path: "provision-apache-install.sh" # install apache php pdo
      subconfig.vm.provision "shell", path: "provision-site.sh"

      subconfig.vm.synced_folder "./sito", "/var/www/html"
  
      # Virtual Box
      subconfig.vm.provider "virtualbox" do |vbox|
        vbox.name = VMNAMEWEB 
        vbox.memory = VMRAM
        vbox.cpus = 2
      end
  
      # Rete
      subconfig.vm.hostname = VMNAMEWEB
      subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: "intnet" # Interfaccia [Intnet]
      subconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK }.10", name: "VirtualBox Host-Only Ethernet Adapter" # Interfaccia [Host Only]
    end
  
    # [Macchina MySQL]
    config.vm.define VMNAMEDB do |subconfig|
      subconfig.vm.box = "ubuntu/jammy64"
      subconfig.vm.provision "shell", path: "provision-update.sh" # apt update
      subconfig.vm.provision "shell", path: "provision-mysql-install.sh" # install mysql
      subconfig.vm.provision "shell", path: "provision-create-database.sh"
  
      # Virtual Box
      subconfig.vm.provider "virtualbox" do |vbox|
        vbox.name = VMNAMEDB 
        vbox.memory = VMRAM
        vbox.cpus = 2
      end
  
      # Rete
      subconfig.vm.hostname = VMNAMEDB
      subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: "intnet" # Interfaccia [Intnet]
      subconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK }.11", name: "VirtualBox Host-Only Ethernet Adapter" # Interfaccia [Host Only]
    end
  
  end