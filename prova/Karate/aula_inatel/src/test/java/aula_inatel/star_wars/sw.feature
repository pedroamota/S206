Feature: Teste API StarWars

Scenario: Testando retorno people/1/
        Given url "https://swapi.py4e.com/api/people/1/"
        When method get
        Then status 200

Scenario: Testando retorno people/1/ com informações invalidas
        Given url "https://swapi.py4e.com/api/people/1/asdaa"
        When method get
        Then status 202