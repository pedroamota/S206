Feature: Testando Api do Polemon

Background: Executa antes de cada teste
    * def url_base = "https://pokeapi.co/api/v2/"

Scenario: Testando retorno 
    Given url "https://pokeapi.co/api/v2/pokemon/pikachu"
    When method get
    Then status 200

Scenario: Testando retorno com informações invalidas
    Given url "https://pokeapi.co/api/v2/pokemon/agumon"
    When method get
    Then status 404

Scenario: Testando retorno pikachu e verificando JSON
    Given url url_base
    And path "pokemon/pikachu"
    When method get
    Then status 200
    And match response.name == "pikachu"
    And match response.id == 25