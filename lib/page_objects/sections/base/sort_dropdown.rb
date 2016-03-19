module Base
  class SortDropdown < SitePrism::Section
    elements :options, 'option'
    element :current_option, 'option[selected=selected]'
    element :disabled_option, 'option[disabled=disabled]'

    def sort_by(name)
      options.find { |option| option.text == name }.click
      parent_page.wait_for_loading_indicator(3)
    end

    def has_option?(name)
      options.find { |option| option.text == name } != nil
    end

  end
end