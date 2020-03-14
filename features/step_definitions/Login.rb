path = "D:/Ruby_test/drivers/chromedriver.exe"

Given(/^I open a browser$/) do
  @browser = Selenium::WebDriver.for :chrome, driver_path:path
  @browser.navigate.to 'http://www.old.practicalsqa.net'
  @browser.manage.window.maximize
end

When(/^I login with user name "([^"]*)" and password "([^"]*)"$/) do |username, password|
  @browser.find_element(xpath: "//input[@id='user_login']").send_keys username
  @browser.find_element(xpath: "//input[@id='user_pass']").send_keys password
  @browser.find_element(xpath: "//input[@id='wp-submit']").click
end

Then(/^I verify Practical SQA page loaded$/) do
  @browser.find_element(xpath: "//h1[@class='site-title']")
  @browser.quit
end