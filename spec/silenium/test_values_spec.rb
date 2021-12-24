require "json"
require "selenium-webdriver"
require "rails_helper"

include RSpec::Expectations

describe "Incorrect" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.google.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it "test_incorrect" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:id, "number").click
    @driver.find_element(:id, "number").clear
    @driver.find_element(:id, "number").send_keys "ayru"
    @driver.find_element(:name, "commit").click
    element = @driver.find_element(:name, "commit")
    @driver.action.move_to(element).perform
    @driver.action.move_to(element, 0, 0).perform
    expect(@driver.find_element(:id, 'result').text).to eq('Введите корректные данные!')
  end

  it "test_correct" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:id, "number").click
    @driver.find_element(:id, "number").clear
    @driver.find_element(:id, "number").send_keys "1754"
    @driver.find_element(:name, "commit").click
    element = @driver.find_element(:name, 'commit')
    @driver.action.move_to(element).perform
    @driver.action.move_to(element, 0, 0).perform
    expect(@driver.find_element(:id, 'result').text).to eq('Результат: 0 - 1754,1 - 6325,2 - 11561,3 - 28072,4 - 55154,5 - 100309,6 - 1003310,7 - 1136311')
  end

end
