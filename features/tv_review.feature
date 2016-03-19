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

  @mobile @desktop @tablet
  Scenario: Should have a number of sorting options
    Then I should have the following sorting options
      | options                   |
      | Most-recently tested      |
      | Highest Which? score      |
      | Price (low to high)       |
      | Price (high to low)       |
      | Screen size (high to low) |
      | Most-recently launched    |

  @mobile @desktop @tablet
  Scenario: Anonymous user should have Highest Which? score sort option disabled
    Then sort option "Highest Which? score" should be disabled

  @mobile @desktop @tablet
  Scenario: Should be able to sort the review results by price low to high
    When I sort the results by "Price (low to high)"
    Then the review results should be sorted by Price (low to high)

  @mobile @desktop @tablet
  Scenario: Should be able to sort the review results by price high to low
    When I sort the results by "Price (high to low)"
    Then the review results should be sorted by Price (high to low)

  @mobile @desktop @tablet
  Scenario: Should be able to refine the review results by screen size
    When I refine the review results by screen size 17-26"
    Then the review results should be refined by screen size 17-26"

  @wip
  Scenario: I should see a login/register modal
    Then I should see login modal

  @wip
  Scenario: I should be able to close the login/register modal
    When I close the login modal
    Then I should not see the login modal

  @wip
  Scenario: I should be able to clear all filters applied
    Given I refine the review results by the following options
      | filter type | filter option |
      | screen size | 17-26"        |
      | Brands      | LG            |
    When I clear all the filters
    Then I should see that no filters are applied

  @wip
  Scenario: I should see search result count
    Then I should see search results count

  @wip
  Scenario: Sign prompt on best by filter
    When I try to apply Best Buy filter
    Then I should see a Sign up now option

  @wip
  Scenario: I should be able to filter by Brand
    When I refine the review results by brand "LG"
    Then the review results should be refined by brand "LG"

  @wip
  Scenario: I should be able to filter by screen
    When I refine the review results by Screen "OLED"
    Then the review results should be refined by Screen "OLED"

  @wip
  Scenario: I should be able to filter by Resolution
    When I refine the review results by Resolution "Full HD"
    Then the review results should be refined by Resolution "Full HD"

  @wip
  Scenario: I should be able to filter by Features
    When I refine the review results by Features Smart TV
    Then the review results should be refined by Features Smart TV

  @wip
  Scenario: I should see show more... option when there are more filters
    Given brands filter has more than 6 options
    When I choose to view more brand
    Then I should see list of all the brands available

  @wip
  Scenario: I should be able to reduce the filter options listed
    Given I am viewing all the filter options for brand
    When I choose show few options for brand
    Then I should see only 6 options for brand are listed
    And I should have an option to show more

  @wip
  Scenario: I should be able to add multiple tvs to compare list
    When I add "1st,3rd,5th" tv to compare list
    Then I should see that "1st,3rd,5th" tv is added to the compare list

  @wip
  Scenario: Compare list of tvs
    Given I have added "1st,3rd,5th" tv to compare list
    When I choose to compare the tv listed in compare list
    Then I should be on the television compare page

  @wip
  Scenario: Should be able to remove tv from compare list
    Given I have added "1st,3rd,5th" tv to compare list
    When I remove the "1st" tv from the compare list
    Then I should see "3rd,5th" tv in compare list
    And I should not see "1st" tv in compare list

  @wip
  Scenario: remove all tvs from the compare list should hide the list
    Given I have added "1st,3rd,5th" tv to compare list
    When I remove all the tvs in the compare list
    Then I should not see compare list








