#UI-test
require 'selenium-webdriver'
require 'cucumber'

require 'rest-client'

#base-ufr
require 'config'

require 'rspec/core'
require 'rspec/expectations'


Selenium::WebDriver.logger.level = :error

puts 'SYSTEM TIME = ' + Time.now.to_s


at_exit do
  puts 'SUPER END'
end
