module Base
  class Review < SitePrism::Page
    set_url 'reviews{/category}'
    set_url_matcher /reviews\/\w+/

    element :loading_indicator, '.loading-indicator'
    section :filters, Base::Filters, '.SYw88'

    sections :results, Base::Result, 'ul.products li'
    section :sort_dropdown, Base::SortDropdown, 'select.sort-selector'

    def screen_filter
      filters.screen_filter
    end



  end
end