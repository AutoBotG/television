module Base
  class FilterSection < SitePrism::Section

    sections :options, Base::FilterOption, 'li'
    element :label, 'h3'

    def filter_by(name)
      find_option(name).select
      parent_page.wait_for_loading_indicator(3)
    end

    def count(name)
      find_option(name).count[/\d+/]
    end


    private
    def find_option(name)
      options.find {|option| option.label.text == name}
    end


  end

end