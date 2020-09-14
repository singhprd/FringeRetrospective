# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

# set :application, "fringeapp"
# set :repo_url, "git@github.com:singhprd/FringeRetrospective.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
# set :deploy_to, "/home/rails/fringeapp"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# lock '3.3.5'

set :stage, :production

set :application, "fringeapp"
set :repo_url, "git@github.com:singhprd/FringeRetrospective.git"
set :deploy_to, "/home/deploy/fringeapp"
set :scm, :git
set :branch, "master"

set :group, "deploy"
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

set :format, :pretty
set :log_level, :debug
set :keep_releases, 5

namespace :deploy do
  after :finishing, "deploy:cleanup"
  after "deploy:publishing", "deploy:restart"
end

desc "Symlink shared config files"
task :symlink_config_files do
  run "#{try_sudo} ln -s #{deploy_to}/shared/config/database.yml #{current_path}/config/database.yml"
  run "#{try_sudo} ln -s #{deploy_to}/shared/config/secrets.yml #{current_path}/config/secrets.yml"
end

before "deploy:assets:precompile", "deploy:yarn_install"

namespace :deploy do
  desc "Run rake yarn:install"
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install")
      end
    end
  end
end
