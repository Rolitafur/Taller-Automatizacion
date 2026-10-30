Feature: Actualizar un Animal

  Scenario: CP1 - Actualizacion de un animal - PUT
    Given url "https://petstore.swagger.io/v2/pet"
    And request
    """
    {
  "id": 701,
  "category": {
    "id": 0,
    "name": "perros"
  },
  "name": "rambo",
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
    When method put
    Then status 200
    And print response

  Scenario: CP2 - Actualizacion de un animal - PUT
    Given url "https://petstore.swagger.io/v2/pet"
    And request {"id": 705,"category": {"id": 0,"name": "gatos"},"name": "Bello","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
    When method put
    Then status 200
    And print response