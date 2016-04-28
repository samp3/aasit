@wip
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
  Scenario: Kirjalla on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "book" on pakolliset kentät:
          """
          author, title, publisher, year
          """
    And vapaavalintaset kentät:
          """
          volume,number, series, address, edition, month, note, key
          """
  Scenario: Kirjasella on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "booklet" on pakolliset kentät:
          """
          title
          """
    And vapaavalintaset kentät:
          """
          author, howpublished, address, month, year, note, key
          """
  Scenario: Konferenssilla on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "conference" on pakolliset kentät:
          """
          author, title, booktitle, year
          """
    And vapaavalintaset kentät:
          """
          editor, volume, number, series, pages, address, month, organization, publisher, note, key
          """
  Scenario: inproceedingsilla on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "inproceedings" on pakolliset kentät:
          """
          author, title, booktitle, year
          """
    And vapaavalintaset kentät:
          """
          editor, volume, number, series, pages, address, month, organization, publisher, note, key
          """
  Scenario: Inbookilla on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "inbook" on pakolliset kentät:
          """
          author, editor, title, chapter, pages, publisher, year
          """
    And vapaavalintaset kentät:
          """
          volume, number, series, type, address, edition, month, note, key
          """
  Scenario: Inbookilla on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "incollection" on pakolliset kentät:
          """
          author, title, booktitle, publisher, year
          """
    And vapaavalintaset kentät:
          """
          editor, volume, number, series, type, chapter, pages, address, edition, month, note, key
          """
  Scenario: manualilla on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "manual" on pakolliset kentät:
          """
          title
          """
    And vapaavalintaset kentät:
          """
          author, organization, address, edition, month, year, note, key
          """
  Scenario: masterthesisilla on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "mastersthesis" on pakolliset kentät:
          """
          author, title, school, year
          """
    And vapaavalintaset kentät:
          """
          type, address, month, note, key
          """
  Scenario: misc:illa on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "misc" on pakolliset kentät:
          """

          """
    And vapaavalintaset kentät:
          """
          author, title, howpublished, month, year, note, key
          """
  Scenario: phdthesis on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "phdthesis" on pakolliset kentät:
          """
          author, title, school, year
          """
    And vapaavalintaset kentät:
          """
          type, address, month, note, key
          """

  Scenario: proceedings:illa on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "proceedings" on pakolliset kentät:
          """
          title, year
          """
    And vapaavalintaset kentät:
          """
          editor, volume,number, series, address, month, publisher, organization, note, key
          """
  Scenario: techreport:illa on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "techreport" on pakolliset kentät:
          """
          author, title, institution, year
          """
    And vapaavalintaset kentät:
          """
          type, number, address, month, note, key
          """
  Scenario: techreport:illa on pakolliset ja valinnaiset kentät
    When Lue seeds.rb
    Then viitetyypillä "unpublished" on pakolliset kentät:
          """
          author, title, note
          """
    And vapaavalintaset kentät:
          """
          month, year, key
          """
