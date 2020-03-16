set :stage, 'staging'
set :branch, 'development'
set :deploy_to, "/home/#{fetch(:user)}/apps/thinkiny_staging"
set :rails_env, :staging
set :domain, 'thinkiny-stage.pp.ua'
set :puma_conf, "#{shared_path}/config/puma.rb"
