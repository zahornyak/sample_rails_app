lock "~> 3.11.2"

set :application, "sample_rails_app"
set :repo_url, "https://github.com/JetBrains/sample_rails_app"
set :branch, "capistrano-deploy"
set :deploy_to, "/home/deploy/#{fetch :application}"
append :linked_files, "config/database.yml"
append :linked_dirs, ".bundle", "tmp", "log"
set :keep_releases, 5
set :format, :pretty