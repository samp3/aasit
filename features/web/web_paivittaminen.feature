Feature: Käyttäjänä pystyn päivittämään järjestelmään tallennettuaj tietoja

  Scenario: Järjestelmässä olevaa viitettä voi editoidaan
    Given Järjestelmässä on artikkeli lyhytnimellä "editoi12"
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "editoi12"
    Then Käyttäjä ohjataan sivulle "/refs/editoi12"
    When Käyttäjä painaa linkkiä "Muokkaa viitteen tietoja"
    Then Käyttäjä ohjataan muokkaussivulle
    When Käyttäjä syöttää lyhytnimeksi "editoitu12"
    And Painaa nappia "Päivitä tiedot"
    Then Käyttäjä ohjataan sivulle "/refs"
    And Käyttäjä saa ilmoituksen "Viite päivitetty onnistuneesti."

  Scenario: Käyttäjä pystyy muokkaamaan olemassaolevia kenttiä
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "W04"
    Then Käyttäjä ohjataan sivulle "/refs/W04"
    When Käyttäjä painaa linkkiä "Muokkaa author"
    Then Käyttäjä ohjataan sivulle "ref_meta/1/edit"
    When Täyttää kentät seuraavasti
      |kentta|arvo|
      |ref_metum[value]|testi1|
    And Painaa nappia "Lähetä"
    Then Käyttäjä ohjataan sivulle "/refs/W04"
    And Käyttäjä saa ilmoituksen "Tiedot päivitettiin onnistuneesti"

  Scenario: Käyttäjä pystyy muokkaamaan olemassaolevia tyyppiä
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/reftypes"
    And Käyttäjä painaa linkkiä "Muokkaa"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |reftype[name]|testi1|
    And Painaa nappia "Tallenna"
    And Käyttäjä saa ilmoituksen "Reftype was successfully update"

  Scenario: Käyttäjä pystyy muokkaamaan olemassaolevia tyyppiä
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/ref_attributes"
    And Käyttäjä painaa linkkiä "address"
    And Täyttää kentät seuraavasti
      |kentta|arvo|
      |ref_attribute[name]|testi1|
    And Painaa nappia "Tallenna"
    And Käyttäjä saa ilmoituksen "Ref attribute was successfully updated."

