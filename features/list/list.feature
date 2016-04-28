Feature: Käyttäjänä pystyn listaamaan järjestelmään tallennetut viitteet, attribuutit, attribuuttien arvot ja viitteiden tyypit

  Scenario: Pystyn listaamaan "refs"
    Given Järjestelmässä on viite, jonka lyhytnimi on "ÄÖ01!" ja tyyppi "article"
    When Pyydän järjestelmältä listan viitteistä
    Then Saan listan viitteistä

  Scenario: Pystyn listaamaan viitteiden tyypit
    Given Järjestelmässä on viite, jonka lyhytnimi on "ÄÖ01!" ja tyyppi "article"
    When Pyydän järjestelmältä listan viitteistä
    Then Saan listan viitteistä

  Scenario: Pystyn listaamaan attribuutit
    Given Järjestelmässä on viite, jonka lyhytnimi on "ÄÖ01!" ja tyyppi "article"
    Given Järjestelmässä on attribuutti "author"
    Given Artikkelilla "ÄÖ01!" on attribuutti "author" jonka arvo "testi1"
    When Pyydän järjestelmältä listan viitteistä
    Then Saan listan viitteistä


  Scenario: Pystyn listaamaan viitteille tallennettujen attribuuttien arvot
    Given Järjestelmässä on viite, jonka lyhytnimi on "ÄÖ01!" ja tyyppi "article"
    Given Järjestelmässä on attribuutti "author"
    Given Artikkelilla "ÄÖ01!" on attribuutti "author" jonka arvo "testi1"

