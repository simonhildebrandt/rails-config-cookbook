node[:deploy].each do |application, deploy|
  log "Creating #{deploy['deploy_to']}/shared/config"
  directory "#{deploy['deploy_to']}/shared/config" do
    group deploy[:group]
    owner deploy[:user]
    mode 0770
    action :create
    recursive true
  end
end
