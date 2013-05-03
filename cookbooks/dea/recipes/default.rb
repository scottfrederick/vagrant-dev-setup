git "~" do
  repository "git://github.com/cloudfoundry/dea_ng.git"
  reference "master"
  enable_submodules true
  action :sync
end

execute "build_dea" do
  cwd "~/dea_ng"
  command "bundle install"
  action :run
end
