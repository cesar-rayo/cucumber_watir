Feature: Login
    This feature allows the user to get access to 
    the web portal and perform his/her taks

    @project_1
    @fake_user
    Scenario Outline: 	As user I would like to be able to get
    	access to AWS web portal
		
		When I open aws main page in <browser_name> browser with max retry 3
		And I click Account Settings waiting for 40 sec
		And I provide a fake user email
		Then an error text "Ha surgido un problema" should be shown
		And I close the browser

		Examples:
			| browser_name |
			| 		chrome |
			| 	   firefox |

	@project_1
	@fake_user_pass
    Scenario Outline: 	As user I would like to be able to get
    	access to AWS web portal
		
		When I open aws main page in <browser_name> browser with max retry 4
		And I click Account Settings waiting for 40 sec
		And I provide a fake user email and password
		Then an error text "Ha surgido un problema" should be shown
		And I close the browser

		Examples:
			| browser_name |
			| 		chrome |
			#| 	   firefox |