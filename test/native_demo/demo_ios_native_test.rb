require 'test/unit'
require 'appium_lib'
require_relative '../test_utils'

class DemoIOSNativeTest < Test::Unit::TestCase
  def setup
    desired_caps = {
      caps: {
        testName: 'iOS Native Demo',
        accessKey: TestUtils.get_access_key,
        deviceQuery:"@os='ios' and @category='PHONE'",
        app: 'cloud:com.experitest.ExperiBank',
        bundleId: 'com.experitest.ExperiBank',
        appiumVersion: "1.22.3",
        platformName: 'ios'
      },
      appium_lib: {
        server_url: TestUtils.get_url,
      }
    }

    @driver = Appium::Driver.new(desired_caps, false)
    @driver.start_driver
  end

  def test_iOSNativeDemo
    @driver.find_element(:xpath, "//*[@name='usernameTextField']").send_keys('company')
    @driver.find_element(:xpath, "//*[@name='passwordTextField']").send_keys('company')
    @driver.find_element(:xpath, "//*[@name='loginButton']").click
    @driver.find_element(:xpath, "//*[@name='makePaymentButton']").click
    @driver.find_element(:xpath, "//*[@name='phoneTextField']").send_keys('0541234567')
    @driver.find_element(:xpath, "//*[@name='nameTextField']").send_keys('Jon Snow')
    @driver.find_element(:xpath, "//*[@name='amountTextField']").send_keys('50')
    @driver.find_element(:xpath, "//*[@name='countryButton']").click
    @driver.find_element(:xpath, "//*[@name='Switzerland']").click
    @driver.find_element(:xpath, "//*[@name='sendPaymentButton']").click
    @driver.find_element(:xpath, "//*[@name='Yes']").click
  end

  def teardown
    @driver.driver_quit
  end
end