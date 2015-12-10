require 'yaml'

node[:deploy].each do |application, deploy|
  (deploy['rails_config'] || []).each do |filename, config|
    file File.join(deploy['deploy_to'], 'shared', 'config', filename + '.yml') do
      content YAML.dump(deploy['rails_env'] => config).gsub(/!ruby\/.+$/, '')
      user deploy[:user]
      group deploy[:group]
      mode 0770
      action :create

      only_if do
        File.exists?("#{node[:deploy][application][:deploy_to]}/shared/config")
      end
    end
    # Write config to shared/config
    # Link to APP/config
  end
end
