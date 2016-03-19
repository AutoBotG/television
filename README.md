# television
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

### running using cucumber command

if you choose to run with cucumber command you will have to pass some environment variables
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



