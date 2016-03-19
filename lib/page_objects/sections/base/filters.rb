module Base
  class Filters < SitePrism::Section

  sections :filters, Base::FilterSection, '._1Locb'

    def screen_filter
      find_filter('Screen size')
    end


    private
    def find_filter(name)
      filters.find {|filter| filter.label.text == name }
    end


  end

end