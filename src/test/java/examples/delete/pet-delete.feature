Feature: Eliminacion un registro

  Scenario: CP1 - Eliminacion de animales - DELETE
    Given url "https://petstore.swagger.io/v2/pet/421"
    When method delete
    Then status 200
    And print response
