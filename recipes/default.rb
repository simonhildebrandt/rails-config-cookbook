require 'yaml'

node[:deploy].each do |application, deploy|
  (deploy['rails_config'] || []).each do |filename, config|
    file File.join(deploy['deploy_to'], 'shared', 'config', filename + '.yml') do

      content config.kind_of?(String) ? config : YAML.dump(deploy['rails_env'] => config).gsub(/!ruby\/.+$/, '')
      user deploy[:user]
      group deploy[:group]
      mode 0770
      action :create
    end
    # Write config to shared/config
    # Link to APP/config
  end
end
