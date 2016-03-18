require 'rubygems'
require 'cucumber'
require 'pry'
require 'cucumber/rake/task'
require 'yaml'
require 'rake/clean'

require File.join(File.dirname(__FILE__), '/lib/helpers/rake_helper')
require File.join(File.dirname(__FILE__), '/lib/helpers/yaml_manager')

ENVIRONMENT = ENV['ENVIRONMENT'] || 'prod'
REPORTS_DIR = File.dirname(__FILE__) + '/reports'
OPTS = ENV['OPTS']
DRIVER = ENV['DRIVER'] ||= RakeHelper.driver || 'chrome_mobile_browser'
PLATFORM = ENV['PLATFORM'] ||= RakeHelper.platform ||'mobile'


CLOBBER.include("#{REPORTS_DIR}/*")
FileUtils::mkdir_p "#{REPORTS_DIR}"

local_browsers = YamlManager.load_config_yml('browsers')

namespace :local do
  time = Time.now
  local_browsers.keys.each do |browser|
    local_browsers["#{browser}"].each do |view_port, view_port_properties|
      namespace view_port.to_sym do
        view_port_properties.keys.each do |browser_name|
          Cucumber::Rake::Task.new("#{browser}_#{browser_name}".to_sym, "Runs test for #{view_port} using #{browser}") do |task|
            task.profile = view_port
            task.cucumber_opts = "--format html -o reports/#{browser}_#{browser_name+time.min.to_s+time.sec.to_s}.html -f pretty "
            task.cucumber_opts << "#{OPTS} -r features/step_definitions -r features/support" unless OPTS.nil?
          end
        end
      end
    end
  end
end
