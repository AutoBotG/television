module Base
  class Result < SitePrism::Section

    element :manufacturer, '.product-listing__manufacturer'
    element :model, '.product-listing__model'
    element :key_fact, '.product-listing__key-fact'
    element :price, '.price-value div[data-test=price-amount]'
    element :price_label, '.price-value div[data-test=price-label]'
    element :tested_date, '.product-listing__tested-date'
    element :add_compare_link, 'frm-comparison button.action-add'
    element :image, '.product-listing__thumb img'

    def info
      {manufacturer: manufacturer.text,
       model: model.text,
       key_fact: key_fact.text,
       price: price_in_float,
       }
    end

    private
    def price_in_float
      price.text.gsub('£','').to_f
    end

  end
end