module Mobile
  class FilterSection < Base::FilterSection

    def filter_by(name)
      find_option(name).select
      parent_page.wait_for_loading_indicator(3)
      parent_page.wait_until_loading_indicator_invisible
      parent_page.wait_for_apply_filter_btn(3)
      parent_page.apply_filter_btn.click
    end
  end
end