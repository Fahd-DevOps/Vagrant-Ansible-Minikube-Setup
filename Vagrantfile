IMAGE_NAME = "fedora/36-cloud-base"
NODE_NAME = "fedora-minikube"

Vagrant.configure("2") do |config|
    config.vm.box_download_options = {"ssl-revoke-best-effort" => true}
    config.vm.provider "virtualbox" do |v|
        v.memory = 4048
        v.cpus = 2
    end
    config.vm.synced_folder "./", "/home/vagrant"
    config.ssh.insert_key = true
    config.ssh.forward_agent = true
    config.vm.network "forwarded_port",
    guest: 80,
    host:  8081,
    auto_correct: true
    config.vm.define NODE_NAME do |master|     

        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", type: "dhcp", virtualbox__intnet:"intnet"
        master.vm.hostname = NODE_NAME
        master.vm.provision "ansible_local" do |ansible|
            ansible.compatibility_mode = "2.0"
            ansible.playbook = "playbook.yml"
        end
        master.vm.provision "shell", path: "user_setup.sh"
    end
end