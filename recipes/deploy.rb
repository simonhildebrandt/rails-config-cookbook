node[:deploy].each do |application, deploy|
  rails_configs(deploy) do |filename, config|
    node.default[:deploy][application]['symlink_before_migrate']["config/#{filename}.yml"] = "config/#{filename}.yml"
  end
end

log node.inspect
