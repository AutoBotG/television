module Base
  class FilterOption < SitePrism::Section

    element :label, '._36Zts'
    element :count_element, '._1QnaN'
    element :check, '._3F1dv'

    def select
      check.click
    end

  end

end