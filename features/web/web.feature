
Feature: Käyttäjänä pystyn käyttämään järjestelmää selaimella, jotta voin lisätä järjestelmään bibtex-viitteitä hyvässä muodossa

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

  Scenario: Käyttäjä luo viitteen, jolla on vaihtoehtoisia pakollisia kenttiä, järjestelmään. Pakolliset täytetty ja vaihtoehtoisista toinen
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
  Scenario: Käyttäjä luo viitteen, jolla on vaihtoehtoisia pakollisia kenttiä, järjestelmään. Pakolliset täytetty ja vaihtoehtoisista molemmat
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


  Scenario: Käyttäjä yrittää aukaista sivun väärällä viitetunnuksella
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/refs/olut"
    Then Käyttäjä saa ilmoituksen "Tuntamaton lyhytnimi"


  Scenario: Käyttäjä yrittää päästä uuden viitteen luontisivulle virheellisellä viitetyypillä
    Given Lue seeds.rb
    When Käyttäjä siirtyy sivulle "/uusi/olut"
    Then Käyttäjä ohjataan sivulle "/refs"
    And Käyttäjä saa ilmoituksen "Tuntamaton tyyppi"

  Scenario: Järjestelmästä poistetaan viite
    Given Järjestelmässä on artikkeli lyhytnimellä "Artikkeli"
    When Käyttäjä siirtyy sivulle "/refs"
    And Käyttäjä painaa linkkiä "Poista"
    Then Kyseinen viite poistuu järjestelmästä
    
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