class LocalBrowserRegister
  def self.register_all_browsers
    local_browsers = YamlManager.load_config_yml('browsers')
    local_browsers['firefox'].each_value do |profile_name|
      profile_name.each do |browser_name, browser_properties|
        #the following may need updating if more than firefox browser
        Capybara.register_driver("firefox_#{browser_name}".to_sym) do |app|
          profile = Selenium::WebDriver::Firefox::Profile.new
          proxy = Selenium::WebDriver::Proxy.new({:auto_detect => 'AUTODETECT'})
          profile.proxy = proxy
          profile["intl.accept_languages"] = "en"
          profile["javascript.enabled"] = browser_properties['js_enabled']
          profile['general.useragent.override'] = browser_properties['user_agent']
          driver = Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
          driver.browser.manage.window.resize_to(browser_properties['width'], browser_properties['height'])
          driver
        end
      end
    end

    local_browsers['chrome'].each_value do |profile_name|
      profile_name.each do |browser_name, browser_properties|
        Capybara.register_driver("chrome_#{browser_name}".to_sym) do |app|
          switches = []
          switches << "--ignore-certificate-errors"
          switches << "--window-size=#{browser_properties['width']},#{browser_properties['height']}"
          switches << "--user-agent=#{browser_properties['user_agent']}"
          Capybara::Selenium::Driver.new(app, :browser => :chrome, args: switches)
        end
      end
    end
  end
end
