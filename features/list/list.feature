
Feature: Käyttäjänä pystyn listaamaan järjestelmään tallennetut viitteet, attribuutit, attribuuttien arvot ja viitteiden tyypit

  Scenario: Pystyn listaamaan viitteet
    Given Järjestelmässä on artikkeli lyhytnimellä "Moi01"
    When Käyttäjä siirtyy sivulle "/refs"
    Then Saan listan viitteistä

  Scenario: Pystyn listaamaan viitteiden tyypit
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/reftypes"
    Then Saan listan viitetyypeistä

  Scenario: Pystyn listaamaan attribuutit
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/ref_attributes"
    Then Saan listan attribuuteista

  Scenario:  Pystyn listaamaan viitetyypin takana olevat attribuutit
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/reftypes"
    And Käyttäjä painaa linkkiä "article"
    Then Saan listan tyypin "article" attribuuteista

  Scenario: Pystyn listaamaan viitteille tallennettujen attribuuttien arvot
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "W04"
    Then saan listan viitteen "W04" attribuuteista ja arvoista
  Scenario: Pystyn listaamaan järjestelmässä olevien viitteiden rivit
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/ref_meta"
    Then hän saa lista riveistä