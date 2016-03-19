module Mobile
  class Review < Base::Review
    element :refine_btn , '.action-refine.button.button-primary-small'
    section :filters, Mobile::Filters, '.SYw88'
    element :apply_filter_btn, '.apply-filters.button.button-primary-small'


    def screen_filter
      refine_btn.click
      wait_for_filters
      filters.screen_filter
    end

  end
end