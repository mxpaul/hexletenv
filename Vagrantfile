Vagrant.configure("2") do |config|
  config.vm.hostname = "hexlet"
  config.vm.box = "centos/8"

  config.vm.network :private_network, ip: "192.168.42.42"
  config.vm.network "forwarded_port", guest: 8080, host: 8080

	config.ssh.username = "vagrant"

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--cpuexecutioncap", "50",
      "--memory", "512", # Mb
    ]
  end


	config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "ansible/playbook.yml"
  end

	config.vm.provision "docker", images: ["node"]
end
