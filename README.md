# Tester Matching

### Setup
```
git clone https://github.com/danfrenette/tester-matching.git
cd tester_matching
bundle
rake db:create db:migrate db:seed
rails server
```

### App Walkthrough
The root page of the app should display an interface for searching through the
bugs. Once some criteria has been selected from the dropdown, click the search
button to see the results populated in the table below.

### Examples:

 - "I want to see all the testers from the US who found bugs for the Galaxy S3"
    - Select "US" from the country dropdown, and "Galaxy S3" from the Device
      dropdown and click "Search". You should be presented with a list of all
      testers in the US and the number of bugs they found (or experience) for
      the Galaxy S3 device.

### Ongoing thought process
 - Need to import test data via seeds
 - Import testing suite from another project
 - Setup models
 - Setup a form with multiple inputs in simple form
 - Filter bug information in simple form and group by user
    - Not sure how to group by a user if there's no bugs for a certain user
 - Display in a table
 - Keep the raw data as well for tests
