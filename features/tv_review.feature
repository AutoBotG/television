Feature:
  As a user looking to buy television
  I want to be able to view reviews of televisions
  So that I can buy the television that suits my requirements


  Background:
    Given I am on review page for televisions

  @desktop @mobile @tablet
  Scenario: Television review page has results
    Then I should see list of review results

  @desktop @mobile @tablet
  Scenario: Review results should have require information
    Then review result should provide the following information
      | information  |
      | image        |
      | manufacturer |
      | model        |
      | key_fact     |
      | price        |
      | tested_date  |
