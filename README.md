# Television
Sample test frame work with Ruby , Cucumber and Capybara

## Steps to set up

###Clone the tests

```bash
git clone https://github.com/AutoBotG/television.git
```

###Install gems
```bash
gem install bundler
bundle install
```

### Running test
Rake tasks that can be used to run the test
``` bash
rake clean                                  # Remove any temporary products
rake clobber                                # Remove any generated files
rake local:desktop:chrome_desktop_browser   # Runs test for desktop using ch...
rake local:desktop:firefox_desktop_browser  # Runs test for desktop using fi...
rake local:mobile:chrome_mobile_browser     # Runs test for mobile using chrome
rake local:mobile:firefox_mobile_browser    # Runs test for mobile using fir...
rake local:tablet:chrome_tablet_browser     # Runs test for tablet using chrome
rake local:tablet:firefox_tablet_browser    # Runs test for tablet using fir...
```

We can get this list by running the following command
```bash
rake -T
```
Rake tasks are divided into 3 break points Mobile, Tablet and Desktop
we can easily extend this to more break points but adding a configuration in /config/browsers.yml

Each of these break points can be further run on different browsers
Note: Implemented only chrome for now but can be easily extended

Rake tasks are automatically generated depending on the configuration in /config/browsers.yml
The only addition step that needs to be done is to update register_all_browsers method in /lib/helpers/browser_registration.rb



###To run desktop test
```bash
rake local:desktop:chrome_desktop_browser
```
we are using tags to indicate if a scenario is for desktop tablet or mobile


Similarly we can run test for mobile and tablet using the following commands

```bash
rake local:mobile:chrome_mobile_browser
rake local:tablet:chrome_tablet_browser
```

###If we choose to run selective test we can pass environment var OPTS with the tags or file name
```bash
rake local:desktop:chrome_desktop_browser OPTS='-t <tag name>'
rake local:desktop:chrome_desktop_browser OPTS='<scenario path>'
```

### Running using cucumber command

If you choose to run with cucumber command you will have to pass some environment variables
* DRIVER - chrome_desktop_browser,chrome_mobile_browser,chrome_tablet_browser default is chrome_mobile_browser
* ENVIRONMENT -  prod (default is prod)
* PLATFORM - mobile, desktop or tablet (default is mobile)
* BASE_URL - http://www.which.co.uk (this is configred in /config/app_config.yml)

### Frame work
* Designed so that responsive apps can be tested
* Page object SitePrism has been used
* We have divided the page objects into 4 modules base, mobile, desktop and tablet
* As the names suggest all the common behaviour is captured in the base module, all the view port specific behaviour is moved into the respective modules
* All the helper files are listed in lib/helpers
* All the page objects are listed in lib/page_objects

### Page objects
* Depending on which view port we want to run the tests, indicated by the PLATFORM env variable
* App class present in lib/page_objects initialises only the required page objects, which is wrapped into a method.
The name of the method is the name of the page object (lowercase)

* SitePrism::Page, SitePrismSubclass we are patching it to get all the classes that have inherited SitePrism:Page.
We are using this list of classes that have inherited SitePrism:Page to initialize in the App class


###Still to do
* At the moment we are registering all the drivers even though we need only one driver registration per run


### Test Scenarios not implemented
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
  Scenario: Compare list of tv's
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
  Scenario: remove all tv's from the compare list should hide the list
    Given I have added "1st,3rd,5th" tv to compare list
    When I remove all the tvs in the compare list
    Then I should not see compare list




