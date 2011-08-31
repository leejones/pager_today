# Load the rails application
require File.expand_path('../application', __FILE__)

require 'lib/pager_duty'

# Initialize the rails application
PagerToday::Application.initialize!
