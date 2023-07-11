require 'test/unit'
require 'appium_lib'
require_relative '../test_utils'

class DemoIosWebTest < Test::Unit::TestCase
  def setup
    desired_caps = {
      caps: {
        testName: 'iOS Web Demo',
        accessKey: TestUtils.get_access_key,
        deviceQuery:"@os='ios'",
        browserName: 'safari',
        platformName: 'ios',
        appiumVersion: "1.22.3"
      },
      appium_lib: {
        server_url: TestUtils.get_url,
      }
    }

    @driver = Appium::Driver.new(desired_caps, false)
    @driver.start_driver
  end

  def test_iOSWebDemo
    @driver.get("https://demo-bank.ct.digital.ai/")

    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until{@driver.find_element(:id => 'login')}

    @driver.find_element(:xpath, "//*[@data-auto='username']//input").send_keys('company')
    @driver.find_element(:xpath, "//*[@data-auto='password']//input").send_keys('company')
    @driver.find_element(:xpath, "//*[@data-auto='login']").click

    @driver.find_element(:xpath, "//*[@data-auto='transfer-funds']").click

    @driver.find_element(:xpath, "//input[@name='NAME']").send_keys('John')
    @driver.find_element(:xpath, "//input[@name='PHONE']").send_keys('1-234-5678')
    @driver.find_element(:xpath, "//input[@name='AMOUNT']").send_keys('1000')
    @driver.find_element(:xpath, "//*[@data-auto='country']").click
    @driver.find_element(:xpath, "//*[text()='India']").click
    @driver.find_element(:xpath, "//*[@data-auto='transfer-button']").click


  end

  def teardown
    @driver.driver_quit
  end
end