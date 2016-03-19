Given(/^I am on review page for (televisions)$/) do |category|
  which.review.load(category: category)
end

Then(/^I should see list of review results$/) do
  which.review.wait_for_results
  expect(which.review).to have_results
  expect(which.review.results.size).to be > 0

end

Then(/^review result should provide the following information$/) do |table|
  iterate_through_assertions(table) { |row| expect(which.review.results.first).to send("have_#{row[:information]}") }
end

Then(/^I should have the following sorting options$/) do |table|
  iterate_through_assertions(table) { |row| expect(which.review.sort_dropdown).to have_option(row[:options]) }
end

When(/^I sort the results by "([^"]*)"$/) do |option|
  which.review.sort_dropdown.sort_by(option)
end

Then(/^the review results should be sorted by Price (\(low to high\)|\(high to low\))$/) do |option|
  which.review.wait_until_loading_indicator_invisible
  actual = which.review.results.map {|result| result.info[:price]}
  expected = option == "(low to high)" ? actual.sort : actual.sort.reverse
  expect(actual).to eql(expected)
end

When(/^I refine the review results by "([^"]*)"$/) do |arg|
  pending
end

Then(/^the review results should be refined by "([^"]*)"$/) do |arg|
  pending
end

Then(/^sort option "([^"]*)" should be disabled$/) do |option|
  expect(which.review.sort_dropdown.disabled_option.text).to eql option
end

When(/^I refine the review results by screen size (.+)$/) do |option|
  which.review.screen_filter.filter_by(option)
end

Then(/^the review results should be refined by screen size (.+)$/) do |option|
  which.review.wait_until_loading_indicator_invisible
  facts =  which.review.results.map {|result| result.info[:key_fact][/\d+/].to_i}
  range = option.scan(/\d+/)
  facts.each {|fact| expect(fact).to be_between(range[0].to_i, range[1].to_i)}
end

def iterate_through_assertions(table)
  assertion_messages = []
  table.hashes.each do |row|
    begin
      yield row
    rescue RSpec::Expectations::ExpectationNotMetError, Capybara::ElementNotFound => e
      assertion_messages << (e.message + "#{row}")
    end
  end
  expect(assertion_messages).to eql []
end
