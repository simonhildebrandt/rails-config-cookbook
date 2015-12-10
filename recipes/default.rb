require 'yaml'

node[:deploy].each do |application, deploy|
  rails_configs(deploy) do |filename, config|
    file File.join(deploy['deploy_to'], 'shared', 'config', filename + '.yml') do
      content YAML.dump(deploy['rails_env'] => config).gsub(/!ruby\/.+$/, '')
      user deploy[:user]
      group deploy[:group]
      mode 0770
      action :create
    end
  end
end
