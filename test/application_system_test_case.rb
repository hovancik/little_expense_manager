require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV["SELENIUM_HOST"]
    Capybara.server_host = "0.0.0.0"
    Capybara.server_port = ENV.fetch("CAPYBARA_SERVER_PORT", "45678").to_i
    Capybara.app_host = ENV.fetch(
      "CAPYBARA_APP_HOST",
      "http://rails-app:#{Capybara.server_port}"
    )

    driven_by :selenium,
              using: :headless_chrome,
              screen_size: [1400, 1400],
              options: {
                browser: :remote,
                url: "http://#{ENV["SELENIUM_HOST"]}:4444/wd/hub"
              }
  else
    driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400] do |chrome_options|
      chrome_options.binary = ENV["CHROME_BIN"] if ENV["CHROME_BIN"]
      chrome_options.add_argument("--no-sandbox") if ENV["CI"]
      chrome_options.add_argument("--disable-dev-shm-usage") if ENV["CI"]
    end
  end
end
