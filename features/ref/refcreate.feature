Feature: Käyttäjänä voin lisätä järjestelmään BibTeX-viitteitä ihmiselle hyvässä muodossa

  Scenario: Luodaan viite oikeilla tiedoilla
    Given Järjestelmässä on viitetyyppi "article", jonka id on "1"
    When Käyttäjä luo viitteen, jonka lyhytnimi on "TT01" ja tyyppi on "article"
    Then Järjestelmä palauttaa HTTP statuskoodin "201"

  Scenario: Käyttäjä yrittää luoda kaksi viitetta samalla lyhytnimellä
    Given Järjestelmässä on viitetyyppi "article", jonka id on "1"
    When Käyttäjä luo viitteen, jonka lyhytnimi on "TT01" ja tyyppi on "article"
    Then Järjestelmä palauttaa HTTP statuskoodin "201"
    When Käyttäjä luo viitteen, jonka lyhytnimi on "TT01" ja tyyppi on "article"
    Then Järjestelmä palauttaa HTTP statuskoodin "422"


  Scenario: Viitteeseen voi lisätä attribuutteja
    Given Järjestelmässä ei ole mitään
    Given Järjestelmässä on attribuutti "author", jonka id on "1"
    Given Järjestelmässä on attribuutti "title", jonka id on "2"
    Given Järjestelmässä on attribuutti "journal", jonka id on "3"
    Given Järjestelmässä on attribuutti "year", jonka id on "4"
    Given Järjestelmässä on attribuutti "volume", jonka id on "5"
    Given Järjestelmässä on viitetyyppi "article", jonka id on "6"
    Given Järjestelmässä on viite, jonka lyhytnimi on "TT01" ja tyyppi on "article"
    Given Viitteille ei ole tallennettu yhtään riviä
    When Käyttäjä lisää viitteeseen "TT01" attribuutin "author" arvolla "Testaaja"
    Then Järjestelmä palauttaa HTTP statuskoodin "201"
    When Käyttäjä lisää viitteeseen "TT01" attribuutin "title" arvolla "otsikko"
    Then Järjestelmä palauttaa HTTP statuskoodin "201"
    When Käyttäjä lisää viitteeseen "TT01" attribuutin "journal" arvolla "yolo"
    Then Järjestelmä palauttaa HTTP statuskoodin "201"
    When Käyttäjä lisää viitteeseen "TT01" attribuutin "year" arvolla "Testaaja"
    Then Järjestelmä palauttaa HTTP statuskoodin "201"
    When Käyttäjä lisää viitteeseen "TT01" attribuutin "volume" arvolla "tilavuus"
    Then Järjestelmä palauttaa HTTP statuskoodin "201"

  Scenario: Viitteelle yritetään lisätä kaksi samaa attribuuttia
    Given Järjestelmässä ei ole mitään
    Given Järjestelmässä on viitetyyppi "article", jonka id on "1"
    Given Järjestelmässä on attribuutti "author", jonka id on "1"
    When Käyttäjä luo viitteen, jonka lyhytnimi on "TT01" ja tyyppi on "article"
    When Käyttäjä lisää viitteeseen "TT01" attribuutin "author" arvolla "Testaaja"
    Then Järjestelmä palauttaa HTTP statuskoodin "201"
    When Käyttäjä lisää viitteeseen "TT01" attribuutin "author" arvolla "Testaaja"
    Then Järjestelmä palauttaa HTTP statuskoodin "422"


  Scenario: Luodaan viite ilman oikeita tietoja
    When Käyttäjä luon viitteen ilman lyhyt nimeä
    And Käyttäjä luon viitteen ilman tyyppiä
    Then Järjestelmä palauttaa HTTP statuskoodin "422"