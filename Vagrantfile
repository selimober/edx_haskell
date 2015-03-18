# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = "haskell"

# Create a forwarded port mapping which allows access to a specific port
# within the machine from a port on the host machine. In the example below,
# accessing "localhost:8080" will access port 80 on the guest machine.
# config.vm.network "forwarded_port", guest: 80, host: 8080

    config.vm.provision :shell do |shell|
        shell.inline = "mkdir -p /etc/puppet/modules;
                        puppet module install -f puppetlabs-stdlib;
                        puppet module install -f acme-ohmyzsh"
    end

    config.vm.provision :puppet
end
