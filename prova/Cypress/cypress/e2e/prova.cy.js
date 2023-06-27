/// <reference types="cypress"/>

describe('Cenarios de testes', () => {
  it('Casode teste: Login no site', () => {
    login('standard_user')
    cy.url().should('be.equal', 'https://www.saucedemo.com/inventory.html')

  })
  it('Casode teste: Login negado', () => {
    login('user_errado')
    cy.get('.error-message-container').should('contain.text', 'Username and password do not match')
  })
  it('Casode teste: Verificar carrinho de compra', () => {

    login('standard_user')
    cy.get('[data-test="add-to-cart-sauce-labs-backpack"]').click({ force: true })
    cy.get('.shopping_cart_link').click({ force: true })
    cy.get('.inventory_item_name').should('contain.text', 'Sauce Labs Backpack')
  })

})

function login(user) {
  cy.visit('https://www.saucedemo.com/')
  cy.get('[data-test="username"]').type(user)
  cy.get('[data-test="password"]').type('secret_sauce')
  cy.get('[data-test="login-button"]').click()
}

//./node_modules/.bin/cypress run --spec 'cypress/e2e/'