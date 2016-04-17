Feature: Käyttäjänä voin lisätä järjestelmään BibTeX-viitteitä ihmiselle hyvässä muodossa

  Scenario: Luodaan viite oikeilla tiedoilla
    Given Järjestelmässä on viitetyyppi "article", jonka id on "1"
    When Käyttäjä luo viitteen, jonka lyhytnimi on "TT01" ja tyyppi on "article"
    Then Järjestelmä palauttaa HTTP statuskoodin "201"

  Scenario: Viitteeseen voi lisätä attribuutteja
    Given Järjestelmässä on attribuutti "author", jonka id on "1"
    Given Järjestelmässä on viitetyyppi "article", jonka id on "1"
    Given Järjestelmässä on viite, jonka lyhytnimi on "TT01" ja tyyppi on "article"
    Given Viitteille ei ole tallennettu yhtään riviä
    When Käyttäjä lisää viitteeseen "TT01" attribuutin "author" arvolla "Testaaja"
    Then Järjestelmä palauttaa HTTP statuskoodin "201"


  Scenario: Luodaan viite ilman oikeita tietoja
    When Käyttäjä luon viitteen ilman lyhyt nimeä
    And Käyttäjä luon viitteen ilman tyyppiä
    Then Järjestelmä palauttaa HTTP statuskoodin "422"