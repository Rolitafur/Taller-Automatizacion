Feature: Registro de animales

  Background:
    Given url "https://petstore.swagger.io/v2/pet"
    * def body = read('../json/body.json')


  Scenario Outline: Registro de animales - POST ESCENARIO V3
    And request body
    When method post
    Then status 200
    And print response
    And match response.name == "#notnull"

    Examples: Animales
      | read('../data/datos.csv') |



