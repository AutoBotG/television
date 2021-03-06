class App
  def initialize
    all_classes = SitePrismSubclass.results
    base_classes = all_classes.select { |class_name| class_name.to_s =~ /Base/ }
    sub_class_classes = all_classes.select { |class_name| class_name.to_s.include?("#{PLATFORM.capitalize}") }
    base_classes = base_classes.reject { |base_class_name| sub_class_classes.find { |sub_class_name| sub_class_name.to_s[/::\w+/] == base_class_name.to_s[/::\w+/] } != nil }
    (base_classes + sub_class_classes).each do |result|
      self.class.send(:define_method, result.to_s.demodulize.underscore) do
        result.new
      end
    end
  end
end
