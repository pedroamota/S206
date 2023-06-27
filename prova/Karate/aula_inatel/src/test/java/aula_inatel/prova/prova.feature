Feature: Testando Api do Pokemon

Background: Executa antes de cada teste
    * def url_base = "https://pokeapi.co/api/v2"
Scenario: Testando retorno
    Given url url_base
    And path "/pokemon"
    When method get
    Then status 200

Scenario: Testando retorno com informações invalidas
    Given url url_base
    And path "/all"
    When method get
    Then status 404

Scenario: Testando se á outros Digimons
    Given url url_base 
    And path "/Digimon"
    When method get
    Then status 404

Scenario: Numero certo de pokemons
    Given url url_base
    And path "/pokemon"
    When method get
    Then status 200
    And print response.length
    And print response.count
    And match response.count == 1281



Scenario: Testando se o nome corresponde com o ID
    Given url url_base
    And path "/pokemon/1"
    When method get
    Then status 200
    And match response.name == "bulbasaur"


Scenario: Testando links dentro das info dos pokemons
    Given url url_base
    And path "/pokemon/charmander"
    When method get
    Then status 200
    And def url_poke = response.species.url
    And url url_poke
    When method get
    Then status 200
