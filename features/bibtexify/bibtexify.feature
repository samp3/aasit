Feature: Käyttäjänä haluan pystyä generoimaan bibtex-tiedoston järjestelmässä olevista viitteistä

  Scenario: Käyttäjä painaa Lataa BibTeX-tiedosto -linkkiä
    Given Järjestelmässä on viite, jonka lyhytnimi on "ÄÖ01!", tyyppi "article". Viitteen pakolliset tiedot "on" täytetty.
    When Käyttäjä menee viitteiden sivulle ja painaa linkkiä "Lataa BibTeX-tiedosto"
    Then Järjestelmä palauttaa käyttäjälle BibTeX-tiedoston


  Scenario: Merkkijonon muodostus
    Given Järjestelmässä on viite, jonka lyhytnimi on "ÄÖ01!", tyyppi "article". Viitteen pakolliset tiedot "on" täytetty.
    When RefMetum osaa antaa rivin merkkijonona
    Then Ref osaa antaa viitteen tiedot merkkijonona