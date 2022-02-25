Feature: Config-Demo

	Background:
	* url baseURL
	* header Accept = 'application/json'
	
	Scenario: Config Demo 1
		Given print name
	
	#Simple Get Request
	Scenario: Config Demo 2
		Given print name
		Given path '/users?page=2'
		When method GET
		Then status 200
		And print response
		