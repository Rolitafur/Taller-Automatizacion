Feature: Consulta de animales

  Background:
    Given url "https://reqres.in"

  Scenario: CP1 - Consulta de una ave - GET
    And path "/api/users/"
    And param page = 2
    When method get
    Then status 200
    And print response

  Scenario: CP2 - Consulta de una ave - GET
    And path "/api/users/"
    And param page = 2
    When method get
    Then status 200
    And print response

    Scenario: CP3 - Consulta de libre - GET
      And path "/api/users/" + 2
      When method get
      Then status 200
      And print response

  Scenario: CP4 - Consulta de libre - GET
    And path '/api/users/' + 2
    When method get
    Then status 200
    And print response

  Scenario: CP5 - Consulta de libre - GET & MATCH A TODO EL RESPONSE
    And def mach = read('../json/mach.json')
    And path "/api/users/"
    And param page = 2
    When method get
    Then status 200
    And match response == mach

  Scenario: CP6 - Consulta de libre - GET & MATCH A TODO EL RESPONSE D
    And def mach = read('../json/mach.json')
    And path "/api/users/"
    And param page = 1
    When method get
    Then status 200
    And match response == mach

  Scenario: CP7 - Consulta de usuarios - GET & MATCH AVANZADO
    And def mach = read('../json/mach.json')
    And path "/api/users/"
    And param page = 2
    When method get
    Then status 200
    And match response == mach
    And match each response.data[*].emeal contains '@regres.in'
    And match each response.data[*].id == "#number"
    And match each response.data[*].first_name == "#string"
    And match each response.data[*].last_name == "#string"
    And match each response.data[*].avatar contains '.jpg'


