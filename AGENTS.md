# Little Expense Manager

- Production runs on Hatchbox. Its standard Rails web command is `bin/rails server -b 127.0.0.1 -p "$PORT"`. Check the Hatchbox process settings before changing Puma's bind.
- `.ruby-version` and `.node-version` pin the runtimes. Keep the Docker and dev container pins in sync with them. Install Ruby gems with `bundle install` and JavaScript dependencies with Yarn Classic using `yarn install --frozen-lockfile`.
- Run `yarn build` and `yarn build:css` to compile assets. Run `bundle exec rails test` and `bundle exec rails test:system` to verify changes. Tests use PostgreSQL, and system tests use Selenium.
