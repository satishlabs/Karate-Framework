Feature: Post API Demo

Background:
	* url 'https://reqres.in/api'
	* header Accept = 'application/json'
	* def expectedOutput = read("response1.json")


#Simple Post Request
Scenario: Post Demo 1
		Given url 'https://reqres.in/api/users'
		And request {"name":"Satish","job":"Sr. Software Engineer"}
		When method post
		Then status 201
		And print response
 

#Post with Background
Scenario: Post Demo 2
	Given path '/users'
	And request {"name":"Kumar","job":"Software Engineer"}
		When method post
		Then status 201
		And print response
		

#Post with response
Scenario: Post Demo 3
	Given path '/users'
	And request {"name":"Kumar","job":"Software Engineer"}
		When method post
		Then status 201
		And match response =={"createdAt": "#ignore","name": "Kumar","id": "#string","job": "Software Engineer"}
		And print response		
		
		
#Post with response
Scenario: Post Demo 4
	Given path '/users'
	And request {"name":"Test Demo4","job":"API Testing"}
		When method post
		Then status 201
		And match $ == expectedOutput	
		And print response
		
	
#Post with Read request body data from file
Scenario: Post Demo 5
		Given path '/users'
		And def projectPath = karate.properties['user.dir']
		And print projectPath
		And def filePath = projectPath+'/src/test/java/data/request1.json'
		And print filePath
		And def requestBody = filePath
		And request requestBody
		When method post
		Then status 201
		And match $ == expectedOutput	
		And print response
		
		
#Post with response
Scenario: Post Demo 6
		Given path '/users'
		And def requestBody = read("request1.json")
		And set requestBody.job = 'Test Check'
		And request requestBody

		When method post
		Then status 201
		And match $ == expectedOutput	
		And print response
				