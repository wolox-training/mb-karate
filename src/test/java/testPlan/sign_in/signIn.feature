Feature: [CAA-01] Sign In QAT-3593

  Scenario: Fail sign in - Empty fields

    Given url baseUrl
    And path 'users/login'
    And request {"user":{"email":"#(emptyEmail)", "password":"#(emptyPassword)"}}
    When method post
    Then status 422
    And match $..email contains "is invalid"

  Scenario: Fail sign in - Empty email

    Given url baseUrl
    And path 'users/login'
    And request {"user":{"email":"#(emptyEmail)", "password":"#(okPassword)"}}
    When method post
    Then status 422
    And match $..email contains "is invalid"

  Scenario: Fail sign in - Empty password

    Given url baseUrl
    And path 'users/login'
    And request {"user":{"email":"#(okEmail)", "password":"#(emptyPassword)"}}
    When method post
    Then status 422
    And match $..password contains "is invalid"

  Scenario: Fail sign in - Wrong email and password

    Given url baseUrl
    And path 'users/login'
    And request {"user":{"email":"#(wrongEmail)", "password":"#(wrongPassword)"}}
    When method post
    Then status 422
    And match $ == {"errors":{"email or password":"is invalid"}}

  Scenario: Fail sign in - Wrong email

    Given url baseUrl
    And path 'users/login'
    And request {"user":{"email":"#(wrongEmail)", "password":"#(okPassword)"}}
    When method post
    Then status 422
    And match $ == {"errors":{"email or password":"is invalid"}}

  Scenario: Fail sign in - Wrong password

    Given url baseUrl
    And path 'users/login'
    And request {"user":{"email":"#(okEmail)", "password":"#(wrongPassword)"}}
    When method post
    Then status 422
    And match $ == {"errors":{"email or password":"is invalid"}}

  Scenario: Successful sign in

    Given url baseUrl
    And path 'users/login'
    And request {"user":{"email":"#(okEmail)", "password":"#(okPassword)"}}
    When method post
    Then status 200
    And match $..token contains '#notnull'