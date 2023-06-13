Feature: Testando Api de paises

Background: Executa antes de cada teste
    * def url_base = "https://jsonplaceholder.typicode.com"

Scenario: Testando retorno
    Given url url_base
    And path "/todos"
    When method get
    Then status 200

Scenario: Testando retorno com informações invalidas
    Given url url_base
    And path "/all"
    When method get
    Then status 404

Scenario: Acima de 10 usuario deve retornar erro
    Given url url_base 
    And path "/users/100"
    When method get
    Then status 404

Scenario: Teste, ira retorna 5 mil fotos
    Given url url_base
    And path "/photos"
    When method get
    Then status 200
    And print response.length
    And match response.length 5000

Scenario: Usuario 1 deve ter ID = 1
    Given url url_base
    And path "/users/1"
    When method get
    Then status 200
    And match response.id == 1


Scenario: Testando se a foto da api está disponivel
    Given url url_base
    And path "/photos/1"
    When method get
    Then status 200
    And def url_photo = response.url
    And print url_photo
    And url url_photo
    When method get
    Then status 200
