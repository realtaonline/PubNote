<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xs xsd pn"
                version="2.0">

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="PubNote-xlate-fr.xsl" vocabulary="DocBook">
  <xs:title> Noms d'éléments DTD PubMed In et Out avec extensions anglaises</xs:title>
  <para>
    Cette option permet de trouver tous les noms d'éléments uniques et de
    créer un Ensemble de déclarations de traduction.
  </para>
</xs:doc>

<xs:variable>
  <para>Le français nécessite un espace avant les deux points</para>
</xs:variable>
<xsl:variable name="pn:spaceBeforeColon" as="xsd:boolean" select="true()"/>

<xs:variable>
<para>Message d'erreur</para>
</xs:variable>
<xsl:variable name="pn:warningTranslate" as="xsd:string"
>Aucune traduction disponible pour l'élément portant le nom :</xsl:variable>

<xs:variable>
  <para>Définir la table de recherche des chaînes</para>
</xs:variable>
<xsl:variable name="pn:xlateLookup" as="document-node()" xml:lang="fr">
  <xsl:document>
    <xlate lookup="Abstract">L'abrégé</xlate>
    <xlate lookup="AbstractText">Texte du l'abrégé</xlate>
    <xlate lookup="AccessionNumber">Numéro d'acquisition</xlate>
    <xlate lookup="AccessionNumberList">Liste des numéros d'acquisition</xlate>
    <xlate lookup="Acronym">Acronyme</xlate>
    <xlate lookup="Affiliation">Affiliation</xlate>
    <xlate lookup="AffiliationInfo">Détails sur l'affiliation</xlate>
    <xlate lookup="Agency">Agence</xlate>
    <xlate lookup="ArchiveCopySource">Origine de la copie d'archive</xlate>
    <xlate lookup="Article">Article</xlate>
    <xlate lookup="ArticleDate">Date de l'article</xlate>
    <xlate lookup="ArticleId">Identifiant de l'article</xlate>
    <xlate lookup="ArticleIdList">Liste des identifiants des articles</xlate>
    <xlate lookup="ArticleSet">Groupe d'articles</xlate>
    <xlate lookup="ArticleTitle">Intitulé de l'article</xlate>
    <xlate lookup="Author">Auteur</xlate>
    <xlate lookup="AuthorList">Liste des auteurs</xlate>
    <xlate lookup="BeginningDate">Date de début</xlate>
    <xlate lookup="Book">Livre</xlate>
    <xlate lookup="BookDocument">Document du livre</xlate>
    <xlate lookup="BookDocumentSet">Groupe de documents du livre</xlate>
    <xlate lookup="BookTitle">Intitulé du livre</xlate>
    <xlate lookup="Chemical">Produit chimique</xlate>
    <xlate lookup="ChemicalList">Liste des produits chimiques</xlate>
    <xlate lookup="Citation">Citation</xlate>
    <xlate lookup="CitationSubset">Sous-groupe de citations</xlate>
    <xlate lookup="CoiStatement">Déclaration de conflit d'intérêts</xlate>
    <xlate lookup="CollectionTitle">Intitulé de la collection</xlate>
    <xlate lookup="CollectiveName">Nom du collectif</xlate>
    <xlate lookup="CommentsCorrections">Corrections des commentaires</xlate>
    <xlate lookup="CommentsCorrectionsList">Liste des corrections des commentaires</xlate>
    <xlate lookup="ContractNumber">Numéro de contrat</xlate>
    <xlate lookup="ContributionDate">Date de contribution</xlate>
    <xlate lookup="CopyrightInformation">Détails sur les droits d'auteur</xlate>
    <xlate lookup="Country">Pays</xlate>
    <xlate lookup="DataBank">Banque de données</xlate>
    <xlate lookup="DataBankList">Liste des banques de données</xlate>
    <xlate lookup="DataBankName">Nom de la banque de données</xlate>
    <xlate lookup="DateCompleted">Date de fin</xlate>
    <xlate lookup="DateRevised">Date de révision</xlate>
    <xlate lookup="Day">Jour</xlate>
    <xlate lookup="DeleteCitation">Supprimer la citation</xlate>
    <xlate lookup="DeleteDocument">Supprimer le fichier</xlate>
    <xlate lookup="DescriptorName">Nom du descripteur</xlate>
    <xlate lookup="DispFormula">Formule d'affichage</xlate>
    <xlate lookup="ELocationID">ID d'emplacement électronique</xlate>
    <xlate lookup="Edition">Édition</xlate>
    <xlate lookup="EndPage">Fin de page</xlate>
    <xlate lookup="EndingDate">Fin Date</xlate>
    <xlate lookup="FirstName">Prénom</xlate>
    <xlate lookup="FirstPage">Première page</xlate>
    <xlate lookup="ForeName">Prénom</xlate>
    <xlate lookup="GeneSymbol">Symbole du gène</xlate>
    <xlate lookup="GeneSymbolList">Liste des symboles des gènes</xlate>
    <xlate lookup="GeneralNote">Remarque générale</xlate>
    <xlate lookup="Grant">Grant</xlate>
    <xlate lookup="GrantID">ID de l'octroi</xlate>
    <xlate lookup="GrantList">Liste des octrois</xlate>
    <xlate lookup="Group">Groupe</xlate>
    <xlate lookup="GroupList">Liste des groupes</xlate>
    <xlate lookup="GroupName">Nom du groupe</xlate>
    <xlate lookup="History">Historique</xlate>
    <xlate lookup="Hour">Heure</xlate>
    <xlate lookup="ISOAbbreviation">ISO Abréviation</xlate>
    <xlate lookup="ISSN">ISSN</xlate>
    <xlate lookup="ISSNLinking">Lien ISSN</xlate>
    <xlate lookup="Identifier">Identifiant</xlate>
    <xlate lookup="IndividualName">Nom de la personne</xlate>
    <xlate lookup="Initials">Initiales</xlate>
    <xlate lookup="Investigator">Investigator</xlate>
    <xlate lookup="InvestigatorList">Liste des investigateurs</xlate>
    <xlate lookup="Isbn">ISBN</xlate>
    <xlate lookup="Issn">ISSN</xlate>
    <xlate lookup="Issue">Numéro</xlate>
    <xlate lookup="Item">Article</xlate>
    <xlate lookup="ItemList">Liste des articles</xlate>
    <xlate lookup="Journal">Journal</xlate>
    <xlate lookup="JournalIssue">Numéro de la revue</xlate>
    <xlate lookup="JournalTitle">Intitulé de la revue</xlate>
    <xlate lookup="Keyword">Mot-clé</xlate>
    <xlate lookup="KeywordList">Liste de mots-clés</xlate>
    <xlate lookup="Language">Langue</xlate>
    <xlate lookup="LastName">Nom</xlate>
    <xlate lookup="LastPage">Dernière page</xlate>
    <xlate lookup="LocationLabel">Libellé de l'emplacement</xlate>
    <xlate lookup="Medium">Support</xlate>
    <xlate lookup="MedlineCitation">Citation Medline</xlate>
    <xlate lookup="MedlineDate">Date Medline</xlate>
    <xlate lookup="MedlineJournalInfo">Informations sur la revue Medline</xlate>
    <xlate lookup="MedlinePgn">Numéro de page Medline</xlate>
    <xlate lookup="MedlineTA">Abréviation du institulé Medline</xlate>
    <xlate lookup="MeshHeading">Intitulé MeSH</xlate>
    <xlate lookup="MeshHeadingList">Liste des intitulés MeSH</xlate>
    <xlate lookup="MiddleName">Deuxième prénom</xlate>
    <xlate lookup="Minute">Minute</xlate>
    <xlate lookup="Month">Mois</xlate>
    <xlate lookup="NameOfSubstance">Nom de la substance</xlate>
    <xlate lookup="NlmUniqueID">ID unique NLM</xlate>
    <xlate lookup="Note">Note</xlate>
    <xlate lookup="NumberOfReferences">Nombre de références</xlate>
    <xlate lookup="Object">Objet</xlate>
    <xlate lookup="ObjectList">Liste d'objets</xlate>
    <xlate lookup="OtherAbstract">Autre résumé</xlate>
    <xlate lookup="OtherID">Autre identifiant</xlate>
    <xlate lookup="PMID">ID PubMed</xlate>
    <xlate lookup="Pagination">Pagination</xlate>
    <xlate lookup="Param">Paramètre</xlate>
    <xlate lookup="PersonalNameSubject">Nom de la personne - Sujet</xlate>
    <xlate lookup="PersonalNameSubjectList">Liste des noms de personnes - Sujet</xlate>
    <xlate lookup="PubDate">Date de publication</xlate>
    <xlate lookup="PubMedPubDate">Date de publication PubMed</xlate>
    <xlate lookup="PublicationStatus">Statut de la publication</xlate>
    <xlate lookup="PublicationType">Type de publication</xlate>
    <xlate lookup="PublicationTypeList">Liste des types de publication</xlate>
    <xlate lookup="Publisher">Éditeur</xlate>
    <xlate lookup="PublisherLocation">Localisation de l'éditeur</xlate>
    <xlate lookup="PublisherName">Nom de l'éditeur</xlate>
    <xlate lookup="PubmedArticle">Article PubMed</xlate>
    <xlate lookup="PubmedArticleSet">Groupe d'articles PubMed</xlate>
    <xlate lookup="PubmedBookArticle">Article de livre PubMed</xlate>
    <xlate lookup="PubmedBookArticleSet">Groupe d'articles de livre PubMed</xlate>
    <xlate lookup="PubmedBookData">Données de livre PubMed</xlate>
    <xlate lookup="PubmedData">Données PubMed</xlate>
    <xlate lookup="QualifierName">Nom du qualificatif</xlate>
    <xlate lookup="RefSource">Source de référence</xlate>
    <xlate lookup="Reference">Référence</xlate>
    <xlate lookup="ReferenceList">Liste de références</xlate>
    <xlate lookup="RegistryNumber">Numéro de registre</xlate>
    <xlate lookup="Replaces">Remplace</xlate>
    <xlate lookup="ReportNumber">Numéro de rapport</xlate>
    <xlate lookup="Season">Saison</xlate>
    <xlate lookup="Second">Second</xlate>
    <xlate lookup="Section">Section</xlate>
    <xlate lookup="SectionTitle">Titre de la section</xlate>
    <xlate lookup="Sections">Sections</xlate>
    <xlate lookup="SpaceFlightMission">Mission spatiale</xlate>
    <xlate lookup="StartPage">Page de démarrage</xlate>
    <xlate lookup="Suffix">Suffixe</xlate>
    <xlate lookup="SupplMeshList">Liste des MeSH supplémentaires</xlate>
    <xlate lookup="SupplMeshName">Nom du MeSH supplémentaire</xlate>
    <xlate lookup="Title">Titre</xlate>
    <xlate lookup="URL">URL</xlate>
    <xlate lookup="VernacularTitle">Titre en langue vernaculaire</xlate>
    <xlate lookup="Volume">Volume</xlate>
    <xlate lookup="VolumeTitle">Titre du volume</xlate>
    <xlate lookup="Year">Année</xlate>
    <!--inline Constructions -->
    <xlate lookup="b">gras</xlate>
    <xlate lookup="i">italique</xlate>
    <xlate lookup="inf">contenu inféré</xlate>
    <xlate lookup="sub">indice</xlate>
    <xlate lookup="sup">exposant</xlate>
    <xlate lookup="u">trait de soulignement</xlate>
  </xsl:document>
</xsl:variable>

</xsl:stylesheet>
