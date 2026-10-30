Feature: Registro de animales

  Background:
    Given url "https://petstore.swagger.io/v2/pet"
    * def body = read('../json/body.json')

  Scenario: CP1 - Registro de un animal - POST & JSON
    And request body
    When method post
    Then status 200
    And print response

  Scenario: CP2 - Registro de un animal - POST & JSON - AVES
    And request body
    When method post
    Then status 200
    And print response

  Scenario: CP3 - Registro de un animal - POST & JSON - PECES
    And request body
    And set body.id = '999'
    And set body.category.name = 'Peces'
    And set body.name = 'Memo'
    When method post
    Then status 200
    And print response

  Scenario: CP4 - Registro de un animal - POST & JSON - AVES - REMOVE
    And request body
    And remove body.name
    When method post
    Then status 200
    And print response