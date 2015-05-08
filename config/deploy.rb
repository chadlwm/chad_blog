lock '3.2.1'

set :application, 'chad_blog'
set :repo_url, 'git@example.com:me/my_repo.git'

set :scm, :git
set :repo_url, 'https://github.com/chadlwm/chad_blog.git'
set :deploy_to, "~/apps/blog"
set :rails_env, 'production'
set :ssh_options, { keys: %w{~/.ssh/id_rsa}, forward_agent: true, auth_methods: %w(publickey) }

SSHKit.config.command_map[:rake]  = "bundle exec rake"
SSHKit.config.command_map[:rails] = "bundle exec rails"

set :format, :pretty
set :log_level, :debug

set :linked_files, %w{
  config/database.yml
  config/secrets.yml
}

set :linked_dirs, %w{log tmp/cache public/uploads public/logger}

set :keep_releases, 5

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default value for :pty is false
# set :pty, true

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

namespace :deploy do

  desc "serurely manages database config file after deploy"
  task :setup_config do
    on roles(:web) do |host|
      execute :mkdir, "-p #{deploy_to}/shared/config"
    end
  end

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end

  desc "reload the database with seed data"
  task :seed do
    on roles(fetch(:migration_role)) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end

  after "deploy:migrate", "deploy:updated"
end