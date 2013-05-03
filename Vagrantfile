Vagrant.configure("2") do |config|
  config.vm.define "cf-dev-setup"

  config.vm.box = "precise64"

  config.vm.provider :vmware_fusion do |v|
    config.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
  end

  config.vm.provider :virtualbox do |v|
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  end

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    # chef.cookbooks_path = [ './travis-cookbooks/ci_environment', './cookbooks' ]

    chef.add_recipe "apt::default"

    # from travis-cookbooks
    chef.add_recipe 'git'
    chef.add_recipe 'chef-golang'
    chef.add_recipe 'rvm::system'
    chef.add_recipe 'rvm::vagrant'
    chef.add_recipe 'sqlite'
    chef.add_recipe 'mysql::server'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'redis'

    # from cookbooks
    chef.add_recipe 'cf-init'
    chef.add_recipe 'warden'
    chef.add_recipe 'dea'

    chef.json = {
      "rvm" => {
        "version" => "1.18.21",
        "default_ruby" => "1.9.3",
        "rubies" => [ "1.9.3" ],
        "gems" => [ { "name" => "bundler" } ]
      },
      "mysql" => {
        "server_root_password" => "",
        "server_repl_password" => "",
        "server_debian_password" => ""
      },
      "postgresql" => {
        "password" => {
          "postgres" => ""
        }
      }
    }
  end
end
