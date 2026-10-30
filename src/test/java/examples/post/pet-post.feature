Feature: Registro de animales

  Background:
    Given url "https://petstore.swagger.io/v2/pet"

  Scenario: CP1 - Registro de un animal - POST
    And request
    """
    {
  "id": 701,
  "category": {
    "id": 0,
    "name": "gatos"
  },
  "name": "romeo",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}

    """
    When method post
    Then status 200
    And print response

  Scenario: CP2 - Registro de un animal - POST
    And request {"id": 705,"category": {"id": 0,"name": "gatos"},"name": "felino","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
    When method post
    Then status 200
    And print response


  Scenario: CP3 - Math de informacion de la respuesta - POST
    And request
    """
    {
  "id": 501,
  "category": {
    "id": 0,
    "name": "peces"
  },
  "name": "toa",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}

    """
    When method post
    Then status 200
    And print response
    And  match response.name == 'toaa'

  Scenario: CP4 - Math de informacion de la respuesta - POST
    And request
    """
    {
  "id": 501,
  "category": {
    "id": 0,
    "name": "peces"
  },
  "name": "toa",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}

    """
    When method post
    Then status 200
    And print response
    And  match response.category.name == 'peces'
    And  match response.name == 'toa'
    And  match $.name == "#string"
    And match $.name == "#notnull"
    And match $.name != "toaa"

    Scenario Outline: Registro de animales - POST escenario nuevo
      And request {"id": <codigo>,"category": {"id": 0,"name": <categoria>},"name": <nombre>,"photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
      When method post
      Then status 200
      And print response

      Examples:
      | codigo | categoria | nombre |
      | 571    | peces1    | dory1  |
      | 572    | peces2    | dory2  |
      | 573    | peces3    | dory3  |
      | 574    | peces4    | dory4  |
      | 575    | peces5    | dory5  |



  Scenario Outline: Registro de animales - POST escenario nuevo Con datos
    And request {"id": <codigo>,"category": {"id": 0,"name": <categoria>},"name": <nombre>,"photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
    When method post
    Then status 200
    And print response

    Examples: Animales
    |read('../data/datos.csv')|




  Scenario Outline: Registro de animales - POST categoria peces
    And request {"id": <codigo>,"category": {"id": 0,"name": <categoria>},"name": <nombre>,"photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
    When method post
    Then status 200
    And print response

    Examples: Animales
      |read('../data/datos.csv').slice(0,3)|

  Scenario Outline: Registro de animales - POST categoria aves
    And request {"id": <codigo>,"category": {"id": 0,"name": <categoria>},"name": <nombre>,"photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
    When method post
    Then status 200
    And print response

    Examples: Animales
      |read('../data/datos.csv').slice(3,6)|

  Scenario Outline: Registro de animales - POST categoria reptiles
    And request {"id": <codigo>,"category": {"id": 0,"name": <categoria>},"name": <nombre>,"photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
    When method post
    Then status 200
    And print response

    Examples: Animales
      |read('../data/datos.csv').slice(6)|