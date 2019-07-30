class Helper
	def self.get_browser(browser)
	    case browser.downcase
	    when 'chrome'
	        browser = Watir::Browser.new (:chrome) 
	    when 'firefox'
	        browser = Watir::Browser.new (:firefox)
	    else
	        $world.puts "Using CHROME driver"
	        browser = Watir::Browser.new (:chrome)
	    end
	    return browser
	end
end