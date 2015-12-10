node[:deploy].each do |application, deploy|
  (deploy['rails_config'] || []).each do |filename, config|
    default[:deploy][application]['symlink_before_migrate']["config/#{filename}.yml"] = "config/#{filename}.yml"
  end
end
