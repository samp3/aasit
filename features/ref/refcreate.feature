Feature: Käyttäjänä voin lisätä järjestelmään BibTeX-viitteitä ihmiselle hyvässä muodossa

  Scenario: Luodaan viite oikeilla tiedoilla
    Given Järjestelmässä on viitetyyppi "article", jonka id on "1"
    When Käyttäjä luon viitteen, jonka lyhytnimi on "TT01" ja tyyppi on "article"
    Then Järjestelmässä on yksi viite enemmän

  Scenario: Luodaan viite ilman oikeita tietoja
    When Käyttäjä luon viitteen ilman lyhyt nimeä
    And Käyttäjä luon viitteen ilman tyyppiä
    Then Järjestelmään ei ole tallentunut uutta viitettä