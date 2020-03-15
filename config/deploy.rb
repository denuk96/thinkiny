lock '~> 3.12.1'

set :application, 'thinkiny'
set :repo_url, 'git@github.com:denuk96/thinkiny.git'

set :user, 'deployer'
server '46.101.173.102', user: "#{fetch(:user)}", roles: %w[app db web], primary: true

set :pty, false

set :linked_files, %w[config/master.key config/database_secret.yml]

append :linked_files, 'config/database.yml', 'config/puma.rb'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'

set :config_example_suffix, '.example'
set :config_files, %w[config/database.yml config/database_secret.yml config/master.key]

set :rvm1_map_bins, fetch(:rvm1_map_bins).to_a.concat(%w(sidekiq sidekiqctl))


namespace :deploy do
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:jungle:setup'
  # before 'check:linked_files', 'puma:nginx_config'
  after 'puma:smart_restart', 'nginx:restart'
end

# task :add_default_hooks do
#   after 'deploy:starting', 'sidekiq:quiet'
#   after 'deploy:updated', 'sidekiq:stop'
#   after 'deploy:reverted', 'sidekiq:stop'
#   after 'deploy:published', 'sidekiq:start'
# end