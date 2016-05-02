Feature: Käyttäjänä pystyn käyttämään järjestelmää selaimella, jotta voin lisätä järjestelmään bibtex-viitteitä hyvässä muodossa

  Scenario: Järjestelmästä poistetaan viite
    Given Järjestelmässä on artikkeli lyhytnimellä "Artikkeli"
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "Poista"
    Then Kyseinen viite poistuu järjestelmästä

    Scenario: Käyttäjä pystyy lisäämään vapaavalintaisia kenttiä jälkikäteen
      Given Lue seeds.rb
      When Käyttäjä siirtyy sivulle "/refs"
      And Käyttäjä painaa linkkiä "W04"
      Then Käyttäjä ohjataan sivulle "/refs/W04"
      When Käyttäjä painaa linkkiä "Lisää tieto"
      Then Käyttäjä ohjataan sivulle "/ref_meta/article/W04"
      When Käyttäjä valitsee kentäksi "key"
      And Täyttää kentät seuraavasti
        |kentta|arvo|
        |ref_metum[value]|testi1|
      And Painaa nappia "Lähetä"
      Then Käyttäjä ohjataan sivulle "/refs/W04"
      And Käyttäjä saa ilmoituksen "Viitteeseen lisätty tieto onnistuneesti."

