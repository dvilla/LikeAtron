require 'selenium-webdriver'
require 'minitest'
require 'minitest/autorun'
require 'pry'
require './credentials'

class LikeAtron < Minitest::Test
  include Credentials

  def setup
    @driver = Selenium::WebDriver.for :chrome
    @base_url = 'https://www.facebook.com'
    @driver.navigate.to @base_url
  end

  def test_login
    @driver.manage.timeouts.implicit_wait = 20
    email_input = @driver.find_element(:id, 'email')
    password_input = @driver.find_element(:id, 'pass')
    email_input.send_keys(username)
    password_input.send_keys(password)
    submit_button =  @driver.find_element(:id, 'u_0_x')
    submit_button.click()
    @driver.navigate.to (@base_url + '/Daniche')
    profile_pic = @driver.find_element(:class, 'profilePic')
    profile_pic.click
    5.times do
      like_button =  @driver.find_element(:class, 'like')
      next_photo = @driver.find_element(:class, 'next')
      like_button.click
      next_photo.click
    end
    puts "ALL COOL! likes made... everything went fine!"
  end

  def teardown
    @driver.quit
  end

end
