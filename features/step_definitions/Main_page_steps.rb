When(/^I open aws main page in ([^"]*) browser with max retry (\d+)$/) do |browser_name, max_attemps|
    @browser = Helper.get_browser(browser_name)
    attempt = 0
    while attempt < max_attemps.to_i
        attempt +=1
        print "Attempt to load main page, number [ #{attempt} / #{max_attemps} ] ...\n"
        begin
            @browser.goto $aws_portal
            break
        rescue Exception => e
            puts "Attempt #{attempt} : #{e.message}"
        end
    end
end

And(/^I click Account Settings waiting for (\d+) sec$/) do |timeout|
    Timeout::timeout(timeout.to_i) do
        @browser.element(:xpath => $drop_down_my_account).hover
        @browser.element(:xpath => $account_settings).click
        @browser.element(:xpath => $signin_text).wait_until_present
    end   
end

And(/^I provide a fake user email$/) do
    user_value = $user_credentials[:user]

    @browser.text_field(:xpath => $email_textbox ).set("#{user_value}")
    @browser.button(:xpath => $signin_button).click
    @browser.element(:xpath => $error_textbox).wait_until_present
end

And(/^I provide a fake user email and password$/) do
    user_value = $user_credentials[:user]
    pass_value = $user_credentials[:password]

    @browser.text_field(:xpath => $email_textbox ).set("#{user_value}")
    @browser.text_field(:xpath => $password_textbox).set("#{pass_value}")
    @browser.button(:xpath => $signin_button).click
    @browser.element(:xpath => $error_textbox).wait_until_present
end

Then(/^an error text "([^"]*)" should be shown$/) do |expect_account_error|
    passed = false
    error = @browser.element(:xpath => $error_textbox).text
    
    if error.include? expect_account_error
        passed = true
    end

    expect(passed).to be(true)
end

And(/^I close the browser$/) do
    @browser.close
end
