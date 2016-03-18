class SitePrismSubclass
  def self.<< input
    @result ||= []
    @result << input
    @result
  end

  def self.results
    @result
  end
end