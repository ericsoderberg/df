set :application, "df"
set :user, 'discofi'
set :domain, 'discofi.org'
set :server_hostname, 'www.discofi.org'

set :git_account, 'ericsoderberg'

set :scm_passphrase,  Proc.new { Capistrano::CLI.password_prompt('Git Password: ') }

role :web, server_hostname
role :app, server_hostname
role :db, server_hostname, :primary => true

default_run_options[:pty] = true
set :repository,  "git@github.com:#{git_account}/#{application}.git"
set :scm, "git"

ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"

after 'deploy:symlink', 'deploy:finishing_touches'

namespace :deploy do
   task :finishing_touches, :roles => :app do
    run "cp -pf #{deploy_to}/shared/system/environment.rb #{current_path}/config/environment.rb"
    run "cp -pfr #{deploy_to}/shared/system/environments #{current_path}/config/"
    run "cp -pf #{deploy_to}/shared/system/database.yml #{current_path}/config/database.yml"
    run "cp -pf #{deploy_to}/shared/system/initializers/site_keys.rb #{current_path}/config/initializers/"
    run "ln -s #{deploy_to}/shared/files #{current_path}/public/files"
  end
end

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"
