require 'bundler/capistrano'

server '109.234.154.252', :app, :web, :db, primary: true
set :deploy_to, '/var/rails/nikita'
set :user, 'nikita'
set :use_sudo, false
ssh_options[:forward_agent] = true

set :deploy_via, :remote_cache
set :repository,  "https://github.com/100lp/gurme_app.git"
set :scm, :git

set :normalize_asset_timestamps, false
set :shared_children, shared_children + %w[public/uploads]

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
