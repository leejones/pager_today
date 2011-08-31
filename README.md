# Pager Today?

## Setup

Edit the following files and get everything setup:

* config/initializers/secret_token.rb
* config/moonshine.yml
* config/pager_duty.yml

Bundle up, and ship it with:

    cap deploy:setup
    cap deploy

## Do I have the pager today?

http://pagertoday.railsmachine.managedmachine.com/[:user_first_name]

## The Entire Calendar

http://pagertoday.railsmachine.managedmachine.com/schedules/daily/entries.ics

## Individual User's Calendar

http://pagertoday.railsmachine.managedmachine.com/[:user_first_name].ics

## HTTP Auth:

Configure your HTTP auth username and password in config/moonshine.yml

## Contributors

Lee Jones, Will Farrington
