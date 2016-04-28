Feature: Järjestelmä tukee BibTeXin mukaisia viitetyyppejä ja kenttiä

  Scenario: Järjestelmä tukee kaikkia viitetyyppejä
    When Lue seeds.rb
    Then järjestelmään on tallentunut viitetyypit:
          """
          article, book, booklet, conference, inbook, incollection, inproceedings, manual, mastersthesis, misc, phdthesis, proceedings, techreport, unpublished
          """


  Scenario: Järjestelmä tukee kaikkia attribuutteja
    When Lue seeds.rb
    Then järjestelmään on tallentunut attribuuttit:
          """
          address, annote, author, booktitle, chapter, crossref, edition, editor, howpublished, institution, journal, key, month, note, number, organization, pages, publisher, school, series, title, type, volume, year
          """
  Scenario: Artikkelilla on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "article" on pakolliset kentät:
          """
          author, title, journal, year, volume
          """
    And vapaavalintaset kentät:
          """
          number, pages, month, note, key
          """

