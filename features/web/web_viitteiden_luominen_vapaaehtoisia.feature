Feature: Käyttäjänä haluan että ohjelma käsittelee oikein ne kentät, jotka on vaihtoehtoisesti pakollisia, jotta tiedot tulee syötettyä oikein

  Scenario: Käyttäjä luo viitteen, jolla on vaihtoehtoisia pakollisia kenttiä, järjestelmään. Pakolliset täytetty ja vaihtoehtoisista toinen kenttä
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "book"
    And Antaa lyhytnimeksi "ÄÖ!2"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |title|testi1|
      |publisher |testi2|
      |year|testi3|
      |author  |testi4|
    And Painaa nappia "Tallenna"
    Then Käyttäjä ohjataan sivulle "/refs"
    And Käyttäjä saa ilmoituksen "Viite lisätty onnistuneesti."

  Scenario: Käyttäjä luo viitteen, jolla on vaihtoehtoisia pakollisia kenttiä, järjestelmään. Pakolliset täytetty ja vaihtoehtoisista molemmat kentät
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "book"
    And Antaa lyhytnimeksi "ÄÖ!2"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |title|testi1|
      |publisher |testi2|
      |year|testi3|
      |author  |testi4|
      |editor  |testi4|
    And Painaa nappia "Tallenna"
    Then Käyttäjä ohjataan sivulle "/refs"
    And Käyttäjä saa ilmoituksen "Viite lisätty onnistuneesti."

  Scenario: Käyttäjä luo viitteen, jolla on kaksi vaihtoehtoisia pakollista kenttäryhmää, järjestelmään. Pakolliset kentät on  täytetty ja vaihtoehtoisista ryhmistä molemmat
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "inbook"
    And Antaa lyhytnimeksi "ÄÖ!2"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |title|testi1|
      |publisher |testi2|
      |year|testi3|
      |author  |testi4|
      |editor  |testi4|
      |chapter  |testi4|
      |pages  |1--4|
    And Painaa nappia "Tallenna"
    Then Käyttäjä ohjataan sivulle "/refs"
    And Käyttäjä saa ilmoituksen "Viite lisätty onnistuneesti."
