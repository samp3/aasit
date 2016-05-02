Feature: Käyttäjä pystyy luomaan viitteitä, viitetyyppejä ja attribuutteja selainta käyttämällä

  Scenario: Käyttäjä luo viitteen järjestelmään pakolliset tiedot täytettynä
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "article"
    And Antaa lyhytnimeksi "ÄÖ!2"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |author|testi1|
      |title |testi2|
      |journal|testi3|
      |year  |testi4|
      |volume|testi5|
    And Painaa nappia "Tallenna"
    Then Käyttäjä ohjataan sivulle "/refs"
    And Käyttäjä saa ilmoituksen "Viite lisätty onnistuneesti."

  Scenario: Käyttäjä luo viitetyypin järjestelmään pakolliset tiedot täytettynä
    When Käyttäjä siirtyy sivulle "/reftypes"
    And Käyttäjä painaa linkkiä "Luo uusi tyyppi"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |reftype[name]|testi1|
    And Painaa nappia "Tallenna"
    Then Käyttäjä saa ilmoituksen "Uusi viitetyyppi luotu onnistuneesti."

  Scenario: Käyttäjä luo attribuutin järjestelmään pakolliset tiedot täytettynä
    When Käyttäjä siirtyy sivulle "/ref_attributes"
    And Käyttäjä painaa linkkiä "Luo uusi attribuutti"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |ref_attribute[name]|testi1|
    And Painaa nappia "Tallenna"
    Then Käyttäjä saa ilmoituksen "Uusi viitetyyppi luotu onnistuneesti."




