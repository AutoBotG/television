Given(/^I am on (televisions) review page$/) do |category|
  which.review.load(category: category )
end

Then(/^I should see list of review results$/) do
  which.review.wait_for_results
  expect(which.review).to have_results
  expect(which.review.results.size).to be > 0

end