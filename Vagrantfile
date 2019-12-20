Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.synced_folder ".", "/home/vagrant/sample_rails_app"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
end