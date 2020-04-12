set :branch, 'master'
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :rails_env, :production
set :domain, 'thinkiny.pp.ua'
set :puma_conf, "#{shared_path}/config/puma.rb"
