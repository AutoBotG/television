require 'yaml'
class YamlManager
  class << self
    attr_accessor :project_root
  end

  self.project_root = File.join(__dir__, '../../')

  def self.load_config_yml(file_name)
    load_yaml_file_in_dir('config', file_name)
  end

  private

  def self.load_yaml_file_in_dir(dirname, yaml_file_name)
    yml = YAML.load_file(File.join(project_root, dirname, "#{yaml_file_name}.yml"))
    yml = yml[ENVIRONMENT] if yml.has_key?(ENVIRONMENT)
    yml
  end

end


