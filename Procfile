web: bundle exec puma -C config/puma.rb
webpacker: bundle exec bin/webpack
worker: rails jobs:work
release: rails db:migrate && rails recurring:init
