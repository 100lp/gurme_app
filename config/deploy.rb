require 'bundler/capistrano'

server "5.9.59.102", :web, :app, :db, :primary => true
set :user, :nikita
set :use_sudo, false
set :deploy_to, "/var/rails/nikita"
set :scm, :git
set :repository, 'git://github.com/100lp/gurme_app.git'
set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
