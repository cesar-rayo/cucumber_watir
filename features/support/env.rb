#Requiring ruby gems
require 'watir'
require 'selenium-webdriver'

$user_credentials = ENV['USER_CREDENTIALS'] || {:user => "fake@fake.com", :password => "password"}
$aws_portal = "https://aws.amazon.com"

$drop_down_my_account 	= '//*[@id="m-nav"]/div[1]/div[2]/a[4]'
$account_settings 		= '/html/body/div[5]/ul/li[2]/a'
$signin_text 			= '//*[@id="signin_head"]'
$email_textbox 			= '//*[@id="ap_email"]'
$password_textbox 		= '//*[@id="ap_password"]'
$signin_button 			= '//*[@id="signInSubmit-input"]'
$error_textbox 			= '//*[@id="message_error"]/h6'
