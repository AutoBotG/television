require 'rake'
module RakeHelper
  extend self

  def platform
    return nil if Rake.application.top_level_tasks.empty?
    Rake.application.top_level_tasks.first.split(':')[1]
  end

  def driver
    return nil if Rake.application.top_level_tasks.empty?
    Rake.application.top_level_tasks.first.split(':')[2] unless Rake.application.top_level_tasks.first.split(':')[2].nil?
  end

end