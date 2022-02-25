Feature: PUT API Request demo
		
		#PUT
		Scenario: PUT DEMO 1
			Given url 'https://reqres.in/api/users/2'
			And request {"name":"Satish","job":"Software Developer"}
			When method PUT
			Then status 200
			And print response
			And print responseStatus