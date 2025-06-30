<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xs xsd pn"
                version="2.0">

<xs:doc info="BSD-3-Lizenz - Copyright © https://RealtaOnline.com"
        filename="PubNote-xlate-de.xsl" vocabulary="DocBook">
  <xs:title> PubMed In- und Out-DTD-Elementnamen mit englischen Erweiterungen</xs:title>
  <para>
    Dies sucht einfach alle eindeutigen Elementnamen und erstellt eine
    Satz von Übersetzungsdeklarationen.
  </para>
</xs:doc>

<xs:variable>
<para>Eine Fehlermeldung</para>
</xs:variable>
<xsl:variable name="pn:warningTranslate" as="xsd:string"
>Keine Übersetzung verfügbar für Element mit folgendem Namen:</xsl:variable>

<xs:variable>
  <para>Definieren Sie die Nachschlagetabelle der Zeichenfolgen</para>
</xs:variable>
<xsl:variable name="pn:xlateLookup" as="document-node()" xml:lang="de">
  <xsl:document>
    <xlate lookup="Abstract">Zusammenfassung</xlate>
    <xlate lookup="AbstractText">Zusammenfassungstext</xlate>
    <xlate lookup="AccessionNumber">Zugangsnummer</xlate>
    <xlate lookup="AccessionNumberList">Zugangsnummernliste</xlate>
    <xlate lookup="Acronym">Akronym</xlate>
    <xlate lookup="Affiliation">Zugehörigkeit</xlate>
    <xlate lookup="AffiliationInfo">Zugehörigkeitsinformationen</xlate>
    <xlate lookup="Agency">Agentur</xlate>
    <xlate lookup="ArchiveCopySource">Archivkopiequelle</xlate>
    <xlate lookup="Article">Artikel</xlate>
    <xlate lookup="ArticleDate">Artikeldatum</xlate>
    <xlate lookup="ArticleId">Artikel-ID</xlate>
    <xlate lookup="ArticleIdList">Artikel-ID-Liste</xlate>
    <xlate lookup="ArticleSet">Artikelsatz</xlate>
    <xlate lookup="ArticleTitle">Artikeltitel</xlate>
    <xlate lookup="Author">Autor</xlate>
    <xlate lookup="AuthorList">Autorenliste</xlate>
    <xlate lookup="BeginningDate">Anfangsdatum</xlate>
    <xlate lookup="Book">Buch</xlate>
    <xlate lookup="BookDocument">Buchdokument</xlate>
    <xlate lookup="BookDocumentSet">Buchdokument-Set</xlate>
    <xlate lookup="BookTitle">Buchtitel</xlate>
    <xlate lookup="Chemical">Chemikalie</xlate>
    <xlate lookup="ChemicalList">Chemikalienliste</xlate>
    <xlate lookup="Citation">Zitation</xlate>
    <xlate lookup="CitationSubset">Zitationsuntergruppe</xlate>
    <xlate lookup="CoiStatement">Erklärung zu Interessenkonflikten</xlate>
    <xlate lookup="CollectionTitle">Titel der Sammlung</xlate>
    <xlate lookup="CollectiveName">Gruppenname</xlate>
    <xlate lookup="CommentsCorrections">Kommentarkorrekturen</xlate>
    <xlate lookup="CommentsCorrectionsList">Liste der Kommentarkorrekturen</xlate>
    <xlate lookup="ContractNumber">Vertragsnummer</xlate>
    <xlate lookup="ContributionDate">Einreichungsdatum</xlate>
    <xlate lookup="CopyrightInformation">Urheberrechtsinformationen</xlate>
    <xlate lookup="Country">Land</xlate>
    <xlate lookup="DataBank">Datenbank</xlate>
    <xlate lookup="DataBankList">Datenbankliste</xlate>
    <xlate lookup="DataBankName">Datenbankname</xlate>
    <xlate lookup="DateCompleted">Abschlussdatum</xlate>
    <xlate lookup="DateRevised">Überarbeitungsdatum</xlate>
    <xlate lookup="Day">Tag</xlate>
    <xlate lookup="DeleteCitation">Zitat löschen</xlate>
    <xlate lookup="DeleteDocument">Dokument löschen</xlate>
    <xlate lookup="DescriptorName">Deskriptorname</xlate>
    <xlate lookup="DispFormula">Anzeigeformel</xlate>
    <xlate lookup="ELocationID">Elektronische Standort-ID</xlate>
    <xlate lookup="Edition">Ausgabe</xlate>
    <xlate lookup="EndPage">Endseite</xlate>
    <xlate lookup="EndingDate">Enddatum</xlate>
    <xlate lookup="FirstName">Vorname</xlate>
    <xlate lookup="FirstPage">Erste Seite</xlate>
    <xlate lookup="ForeName">Vorname</xlate>
    <xlate lookup="GeneSymbol">Gensymbol</xlate>
    <xlate lookup="GeneSymbolList">Gensymbolliste</xlate>
    <xlate lookup="GeneralNote">Allgemeiner Hinweis</xlate>
    <xlate lookup="Grant">Grant</xlate>
    <xlate lookup="GrantID">Förderungs-ID</xlate>
    <xlate lookup="GrantList">Förderungsliste</xlate>
    <xlate lookup="Group">Gruppe</xlate>
    <xlate lookup="GroupList">Gruppenliste</xlate>
    <xlate lookup="GroupName">Gruppenname</xlate>
    <xlate lookup="History">Historie</xlate>
    <xlate lookup="Hour">Stunde</xlate>
    <xlate lookup="ISOAbbreviation">ISO-Abkürzung</xlate>
    <xlate lookup="ISSN">ISSN</xlate>
    <xlate lookup="ISSNLinking">ISSN-Verknüpfung</xlate>
    <xlate lookup="Identifier">Kennung</xlate>
    <xlate lookup="IndividualName">Name der Person</xlate>
    <xlate lookup="Initials">Initialen</xlate>
    <xlate lookup="Investigator">Ermittler</xlate>
    <xlate lookup="InvestigatorList">Ermittlerliste</xlate>
    <xlate lookup="Isbn">ISBN</xlate>
    <xlate lookup="Issn">ISSN</xlate>
    <xlate lookup="Issue">Ausgabe</xlate>
    <xlate lookup="Item">Artikel</xlate>
    <xlate lookup="ItemList">Artikelliste</xlate>
    <xlate lookup="Journal">Zeitschrift</xlate>
    <xlate lookup="JournalIssue">Zeitschriftenausgabe</xlate>
    <xlate lookup="JournalTitle">Zeitschriftentitel</xlate>
    <xlate lookup="Keyword">Schlüsselwort</xlate>
    <xlate lookup="KeywordList">Stichwortliste</xlate>
    <xlate lookup="Language">Sprache</xlate>
    <xlate lookup="LastName">Nachname</xlate>
    <xlate lookup="LastPage">Letzte Seite</xlate>
    <xlate lookup="LocationLabel">Standortbezeichnung</xlate>
    <xlate lookup="Medium">Medium</xlate>
    <xlate lookup="MedlineCitation">Medline-Zitat</xlate>
    <xlate lookup="MedlineDate">Medline-Datum</xlate>
    <xlate lookup="MedlineJournalInfo">Medline-Zeitschrifteninfo</xlate>
    <xlate lookup="MedlinePgn">Medline-Seitenzahl</xlate>
    <xlate lookup="MedlineTA">Medline-Titelabkürzung</xlate>
    <xlate lookup="MeshHeading">MeSH-Überschrift</xlate>
    <xlate lookup="MeshHeadingList">MeSH-Überschriftenliste</xlate>
    <xlate lookup="MiddleName">Zweiter Vorname</xlate>
    <xlate lookup="Minute">Minute</xlate>
    <xlate lookup="Month">Monat</xlate>
    <xlate lookup="NameOfSubstance">Name der Substanz</xlate>
    <xlate lookup="NlmUniqueID">Eindeutige NLM-ID</xlate>
    <xlate lookup="Note">Hinweis</xlate>
    <xlate lookup="NumberOfReferences">Anzahl der Referenzen</xlate>
    <xlate lookup="Object">Objekt</xlate>
    <xlate lookup="ObjectList">Objektliste</xlate>
    <xlate lookup="OtherAbstract">Andere Zusammenfassung</xlate>
    <xlate lookup="OtherID">Andere ID</xlate>
    <xlate lookup="PMID">PubMed-ID</xlate>
    <xlate lookup="Pagination">Seitennummerierung</xlate>
    <xlate lookup="Param">Parameter</xlate>
    <xlate lookup="PersonalNameSubject">Personenname</xlate>
    <xlate lookup="PersonalNameSubjectList">Personenname</xlate>
    <xlate lookup="PubDate">Veröffentlichungsdatum</xlate>
    <xlate lookup="PubMedPubDate">PubMed-Veröffentlichungsdatum</xlate>
    <xlate lookup="PublicationStatus">Veröffentlichungsstatus</xlate>
    <xlate lookup="PublicationType">Publikationstyp</xlate>
    <xlate lookup="PublicationTypeList">Publikationstypliste</xlate>
    <xlate lookup="Publisher">Verlag</xlate>
    <xlate lookup="PublisherLocation">Verlagsstandort</xlate>
    <xlate lookup="PublisherName">Verlagsname</xlate>
    <xlate lookup="PubmedArticle">PubMed-Artikel</xlate>
    <xlate lookup="PubmedArticleSet">PubMed-Artikelset</xlate>
    <xlate lookup="PubmedBookArticle">PubMed-Buchartikel</xlate>
    <xlate lookup="PubmedBookArticleSet">PubMed-Buchartikelset</xlate>
    <xlate lookup="PubmedBookData">PubMed-Buchdaten</xlate>
    <xlate lookup="PubmedData">PubMed-Daten</xlate>
    <xlate lookup="QualifierName">Qualifikatorname</xlate>
    <xlate lookup="RefSource">Referenzquelle</xlate>
    <xlate lookup="Reference">Referenz</xlate>
    <xlate lookup="ReferenceList">Referenzliste</xlate>
    <xlate lookup="RegistryNumber">Registrierungsnummer</xlate>
    <xlate lookup="Replaces">Ersetzt</xlate>
    <xlate lookup="ReportNumber">Berichtsnummer</xlate>
    <xlate lookup="Season">Staffel</xlate>
    <xlate lookup="Second">Zweite</xlate>
    <xlate lookup="Section">Abschnitt</xlate>
    <xlate lookup="SectionTitle">Abschnittstitel</xlate>
    <xlate lookup="Sections">Abschnitte</xlate>
    <xlate lookup="SpaceFlightMission">Weltraummission</xlate>
    <xlate lookup="StartPage">Startseite</xlate>
    <xlate lookup="Suffix">Suffix</xlate>
    <xlate lookup="SupplMeshList">Liste der ergänzenden MeSH</xlate>
    <xlate lookup="SupplMeshName">Ergänzende MeSH-Name</xlate>
    <xlate lookup="Title">Titel</xlate>
    <xlate lookup="URL">URL</xlate>
    <xlate lookup="VernacularTitle">Titel in Landessprache</xlate>
    <xlate lookup="Volume">Band</xlate>
    <xlate lookup="VolumeTitle">Bandtitel</xlate>
    <xlate lookup="Year">Jahr</xlate>
    <!--inline constructs-->
    <xlate lookup="b">fett</xlate>
    <xlate lookup="i">kursiv</xlate>
    <xlate lookup="inf">abgeleiteter Inhalt</xlate>
    <xlate lookup="sub">tiefgestellt</xlate>
    <xlate lookup="sup">hochgestellt</xlate>
    <xlate lookup="u">unterstrichen</xlate>
  </xsl:document>
</xsl:variable>

</xsl:stylesheet>
