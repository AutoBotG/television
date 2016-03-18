
Feature:
  As a user looking to buy television
  I want to be able to view reviews of televisions
  So that I can buy the television that suits my requirements


  Background:
    Given I am on review page for televisions

  @desktop @mobile @tablet
  Scenario: Television landing page has results
    Then I should see list of review results
