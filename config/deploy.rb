lock "~> 3.11.2"

set :application, "sample_rails_app"
set :repo_url, "https://github.com/JetBrains/sample_rails_app"
set :branch, "capistrano-deploy"
set :deploy_to, "/home/deploy/#{fetch :application}"
append :linked_files, "config/master.key"
set :keep_releases, 5
set :format, :pretty