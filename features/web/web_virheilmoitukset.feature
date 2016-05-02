Feature: Käyttäjänä haluaisin saada virheilmoituksen tilanteessa, jossa teen jotain väärin, jotta käyttäjä tietää koko ajan mitä tapahtuu

  Scenario: Käyttäjä yrittää aukaista sivun väärällä viitetunnuksella
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs/olut"
    Then Käyttäjä saa ilmoituksen "Tuntamaton lyhytnimi"

  Scenario: Käyttäjä yrittää päästä uuden viitteen luontisivulle virheellisellä viitetyypillä
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/uusi/olut"
    Then Käyttäjä ohjataan sivulle "/refs"
    And Käyttäjä saa ilmoituksen "Tuntamaton tyyppi"

  Scenario: Käyttäjä luo viitteen, jolla on kaksi vaihtoehtoista pakollisia kenttäryhmää, järjestelmään. Pakolliset kentät on täytetty ja vaihtoehtoisista toista ryhmää ei ole täytetty
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
    And Painaa nappia "Tallenna"
    Then Käyttäjä saa ilmoituksen "Pakollisia kenttiä ei ole täytetty"

  Scenario: Käyttäjä luo viitteen, jolla on vaihtoehtoisia pakollisia kenttiä, järjestelmään. Pakolliset täytetty ja vaihtoehtoisista ei kumpaakaan
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "book"
    And Antaa lyhytnimeksi "ÄÖ!2"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |title|testi1|
      |publisher |testi2|
      |year|testi3|
    And Painaa nappia "Tallenna"
    Then Käyttäjä saa ilmoituksen "Pakollisia kenttiä ei ole täytetty"
  Scenario: Käyttäjä luo viitteen järjestelmään pakolliset tiedot täytettynä, mutta ilman lyhytnimeä
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "article"
    And Antaa lyhytnimeksi ""
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |author|testi1|
      |title |testi2|
      |journal|testi3|
      |year  |testi4|
      |volume|testi5|
    And Painaa nappia "Tallenna"
    Then Käyttäjä saa ilmoituksen "Slug can't be blank"

  Scenario: Käyttäjä luo viitteen järjestelmääm, mutta kaikkia pakollisia kenttiä ei ole täytetty
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "article"
    And Antaa lyhytnimeksi "etana"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |author|testi1|
      |journal|testi3|
      |year  |testi4|
      |volume|testi5|
    And Painaa nappia "Tallenna"
    Then Käyttäjä saa ilmoituksen "Pakollisia kenttiä ei ole täytetty"

  Scenario: Käyttäjä luo viitetyypin järjestelmään ilman nimeä
    When Käyttäjä siirtyy sivulle "/reftypes"
    And Käyttäjä painaa linkkiä "Luo uusi tyyppi"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |reftype[name]||
    And Painaa nappia "Tallenna"
    Then Käyttäjä saa ilmoituksen "Name can't be blank"

  Scenario: Käyttäjä luo attribuutin järjestelmään pakolliset tiedot täytettynä
    When Käyttäjä siirtyy sivulle "/ref_attributes"
    And Käyttäjä painaa linkkiä "Luo uusi attribuutti"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |ref_attribute[name]||
    And Painaa nappia "Tallenna"
    Then Käyttäjä saa ilmoituksen "Name can't be blank"

