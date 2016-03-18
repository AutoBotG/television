Given(/^I am on review page for (televisions)$/) do |category|
  which.review.load(category: category)
end

Then(/^I should see list of review results$/) do
  which.review.wait_for_results
  expect(which.review).to have_results
  expect(which.review.results.size).to be > 0

end

Then(/^review result should provide the following information$/) do |table|
  assertion_messages = []
  table.hashes.each do |row|
    begin
      expect(which.review.results.first).to send("have_#{row[:information]}")
    rescue RSpec::Expectations::ExpectationNotMetError, Capybara::ElementNotFound => e
      assertion_messages << (e.message + "#{row}")
    end
  end
  expect(assertion_messages).to eql []
end