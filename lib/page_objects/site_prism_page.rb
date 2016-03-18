require 'active_support/core_ext/string/inflections'
require "site_prism"
require 'capybara'

class SitePrism::Page
  def self.inherited subclass
    SitePrismSubclass << subclass
  end

  def url(expansion = {})
    Addressable::Template.new(get_page_url(self.class)).expand(expansion).to_s
  end

  def url_matcher
    get_page_url_matcher(self.class)
  end

  def get_page_url(cl)
    cl.url == nil ? get_page_url(cl.superclass) : cl.url
  end

  def get_page_url_matcher(cl)
    cl.url_matcher == nil ? get_page_url_matcher(cl.superclass) : cl.url_matcher
  end

end