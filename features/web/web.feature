Feature: Käyttäjänä pystyn käyttämään järjestelmää selaimella

  Scenario: Pystyn aukaisemaan viitelistan selaimella
    Given Järjestelmässä on viite, jonka lyhytnimi on "ÄÖ01!" ja tyyppi "article"
    When Käyttäjä siirtyy sivulle refs
    Then hän näkee listan järjestelmässä olevista viitteistä

  Scenario: Käyttäjä luo viitteen järjestelmään ja päivittää lyhytnimeä
    Given Järjestelmässä on viitetyyppi "article"
    When Käyttäjä siirtyy viitteen luontisivulle
    And Luo artikkelin lyhytnimellä "ÄÖ!2"

  Scenario: Käyttäjä luo nimettömän viitteen järjestelmään
    Given Järjestelmässä on viitetyyppi "article"
    When Käyttäjä siirtyy viitteen luontisivulle
    And Luo artikkelin lyhytnimellä ""

  Scenario: Käyttäjä luo nimettömän viitteen järjestelmään
    Given Järjestelmässä on artikkeli lyhytnimellä "POISTA00"
    When Käyttäjä siirtyy sivulle refs
    And Painaa nappia "destroy"
    Then Kyseinen viite poistuu järjestelmästä

    Scenario: Käyttäjä pystyy lisämään attribuutin viitteelle
      Given Järjestelmässä on viite, jonka lyhytnimi on "ÄÖ01!" ja tyyppi "article" ja atrribuutti "author"
      Given Käyttäjä on sivulla ref_meta
      When Käyttäjä painaa linkkiä "New Ref metum"
      And Käyttäjä syöttää kenttään Value "testaaja" ja painaa nappia "Create Ref metum"
      Then Käyttäjälle ilmoitetaan onnistumisesta ja ohjataan viitteen sivulle