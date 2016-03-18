$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'cucumber'
require 'selenium-webdriver'
require 'active_support/core_ext/string/inflections'
require 'rspec'
require 'require_all'
require 'site_prism'
require 'capybara'
require 'capybara/dsl'
require 'pry'

DRIVER = ENV['DRIVER'] || 'chrome_mobile_browser'
ENVIRONMENT = ENV['ENVIRONMENT'] || 'prod'
PLATFORM = ENV['PLATFORM'] || 'mobile'
require_all 'lib/helpers/*.rb'
app_config = YamlManager.load_config_yml('app_config')

BASE_URL = ENV['base_url'] || app_config["root_url"]

require 'page_objects/app'
require 'page_objects/site_prism_page'
require 'page_objects/site_prism_sub'

require_all 'lib/page_objects/sections/base'
require_all "lib/page_objects/sections/desktop"
require_all "lib/page_objects/sections/tablet"
require_all "lib/page_objects/sections/mobile"

require_all 'lib/page_objects/pages/base'
require_all 'lib/page_objects/pages/desktop'
require_all 'lib/page_objects/pages/tablet'
require_all "lib/page_objects/pages/mobile"

LocalBrowserRegister.register_all_browsers

World(Capybara::DSL)


Capybara.configure do |config|
  config.run_server = false
  config.default_driver = DRIVER.to_sym
  config.default_max_wait_time = 20
  config.app_host = BASE_URL
  config.match = :one
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
end




