# encoding: UTF-8
# language: ru
#
When(/^открыли - ([^"]*)$/) do |url|
  puts "navigate:#{url}"
  @browser.navigate.to url
end

When(/^(.*) содержит текст (.*)$/) do |locator, expected|
  puts 'xpath: ' + locator
  puts expected
  actual = @browser.find_element(:xpath, locator).text
  puts actual
  expect(actual).to eq expected
end

When(/^кликнули на - (.*)$/) do |locator|
  puts 'click ' + locator
  @browser.find_element(:xpath, locator).click
end

When(/^дождались загрузки - ([^"]*)$/) do |locator|
  puts 'wait ' + locator
  @wait.until do
    begin
      element = @browser.find_element(:xpath, locator)
      element if element.displayed? && element.enabled?
      puts 'element has appeared'
    rescue Selenium::WebDriver::Error::TimeoutError => e
      puts "caught exception #{e}! ohnoes!"
    end
  end
end

When(/^ввели в ([^"]*) значение ([^"]*)$/) do |locator, value|
  puts 'insert: ' + locator
  puts 'value:' + value
  @browser.find_element(:xpath, locator).send_keys(value)
end


When(/^подождали - ([^"]*) сек$/) do |time|
  puts 'sleep ' + time
  sleep time.to_i
end

When(/^подождали (\d+) секунд$/) do |time|
  puts 'sleep ' + time.to_s
  sleep time.to_i
end

When(/^дождались исчезновения - ([^"]*)$/) do |locator|
  puts 'wait fade ' + locator
  @wait.until do
    begin
      element = @browser.find_element(:xpath, locator)
      element if !element.displayed? && !element.enabled?
    rescue Selenium::WebDriver::Error::NoSuchElementError,
        Selenium::WebDriver::Error::StaleElementReferenceError,
        Selenium::WebDriver::Error::TimeoutError => e
      puts "caught exception #{e}! ohnoes!"
    end
  end
end

When(/^существует - ([^"]*)$/) do |locator|
  form = @wait.until do
    element = @browser.find_element(:xpath, locator)
    element if element.displayed?
  end
  puts "Test Passed: element #{locator} found" if form.displayed?
end

When(/^(.*) содержит html аттрибут (.*) со значением (.*)$/) do |locator, html_attribute, expected|
  puts 'xpath: ' + locator
  puts expected
  actual = @browser.find_element(:xpath, locator).attribute(html_attribute)
  puts actual
  expect(actual).to eq expected
end


When(/^переключились на фрейм - (.*)$/) do |frame_id|
  @browser.switch_to.frame frame_id
end

When(/^переключились на окно - (\d)$/) do |window_id|
  @browser.switch_to.window(@browser.window_handles[window_id])
end

