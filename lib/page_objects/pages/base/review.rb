module Base
  class Review < SitePrism::Page
    set_url 'reviews{/category}'
    set_url_matcher /reviews\/\w+/

    sections :results, Base::Result, 'ul.products li'

  end
end