Vagrant.configure("2") do |config|
  config.vm.hostname = "hexlet"
  config.vm.box = "centos/8"


  #config.vbguest.no_install = true

  config.vm.synced_folder "Hexlet/", "/home/vagrant/Hexlet", disabled: false,
    create: true,
    id: "Hexlet"
  config.vm.synced_folder "Check/", "/home/vagrant/Check", disabled: false,
    create: true,
    id: "Check"


  config.vm.network :private_network, ip: "192.168.42.42"
  config.vm.network "forwarded_port", guest: 8080, host: 8080

	config.ssh.username = "vagrant"

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      #"--cpuexecutioncap", "50",
      "--memory", "512", # Mb
    ]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end


	config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "ansible/playbook.yml"
  end

	config.vm.provision "docker", images: ["node"]
end
