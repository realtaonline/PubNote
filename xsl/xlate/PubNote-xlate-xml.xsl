<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xs xsd pn"
                version="2.0">

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="PubNote-xlate-en.xsl" vocabulary="DocBook">
  <xs:title>
    PubMed In and Out DTD element names with English expansions</xs:title>
  <para>
    This simply finds all of the unique element names and creates a
    set of translation declarations.
  </para>
</xs:doc>

<xs:variable>
  <para>An error message</para>
</xs:variable>
<xsl:variable name="pn:warningTranslate" as="xsd:string"
  >No translation available for element with name:</xsl:variable>

<xs:variable>
  <para>Define the lookup table of strings</para>
</xs:variable>
<xsl:variable name="pn:xlateLookup" as="document-node()" xml:lang="en">
 <xsl:document>
  <xlate lookup="Abstract" mixed="true"/>
  <xlate lookup="AccessionNumber"/>
  <xlate lookup="AccessionNumberList"/>
  <xlate lookup="Acronym"/>
  <xlate lookup="Affiliation"/>
  <xlate lookup="AffiliationInfo" force-close=""/>
  <xlate lookup="Agency"/>
  <xlate lookup="ArchiveCopySource"/>
  <xlate lookup="Article"/>
  <xlate lookup="ArticleDate"/>
  <xlate lookup="ArticleId"/>
  <xlate lookup="ArticleIdList"/>
  <xlate lookup="ArticleSet"/>
  <xlate lookup="Author"/>
  <xlate lookup="AuthorList"/>
  <xlate lookup="BeginningDate"/>
  <xlate lookup="Book"/>
  <xlate lookup="BookDocument"/>
  <xlate lookup="BookDocumentSet"/>
  <xlate lookup="BookTitle"/>
  <xlate lookup="Chemical"/>
  <xlate lookup="ChemicalList"/>
  <xlate lookup="Citation" mixed=""/>
  <xlate lookup="CitationSubset"/>
  <xlate lookup="CoiStatement" mixed=""/>
  <xlate lookup="CollectionTitle"/>
  <xlate lookup="CollectiveName"/>
  <xlate lookup="CommentsCorrections"/>
  <xlate lookup="CommentsCorrectionsList"/>
  <xlate lookup="ContractNumber"/>
  <xlate lookup="ContributionDate"/>
  <xlate lookup="CopyrightInformation"/>
  <xlate lookup="Country"/>
  <xlate lookup="DataBank"/>
  <xlate lookup="DataBankList"/>
  <xlate lookup="DataBankName"/>
  <xlate lookup="DateCompleted"/>
  <xlate lookup="DateRevised"/>
  <xlate lookup="Day"/>
  <xlate lookup="DeleteCitation"/>
  <xlate lookup="DeleteDocument"/>
  <xlate lookup="DescriptorName"/>
  <xlate lookup="DispFormula" unsupported=""/>
  <xlate lookup="DocType"/>
  <xlate lookup="Edition"/>
  <xlate lookup="EIdType"/>
  <xlate lookup="ELocationID"/>
  <xlate lookup="EmptyYN"/>
  <xlate lookup="EndingDate"/>
  <xlate lookup="EndPage"/>
  <xlate lookup="EqualContrib"/>
  <xlate lookup="FirstName"/>
  <xlate lookup="FirstPage"/>
  <xlate lookup="ForeName"/>
  <xlate lookup="GeneralNote"/>
  <xlate lookup="GeneSymbol"/>
  <xlate lookup="GeneSymbolList"/>
  <xlate lookup="Grant"/>
  <xlate lookup="GrantID"/>
  <xlate lookup="GrantList"/>
  <xlate lookup="Group"/>
  <xlate lookup="GroupList"/>
  <xlate lookup="GroupName"/>
  <xlate lookup="History"/>
  <xlate lookup="Hour"/>
  <xlate lookup="Identifier"/>
  <xlate lookup="IdType"/>
  <xlate lookup="IndividualName"/>
  <xlate lookup="Initials"/>
  <xlate lookup="Investigator"/>
  <xlate lookup="InvestigatorList"/>
  <xlate lookup="Isbn"/>
  <xlate lookup="ISOAbbreviation"/>
  <xlate lookup="ISSN" pubmedin="ignore"/>
  <xlate lookup="Issn" pubmedout="ignore"/>
  <xlate lookup="ISSNLinking"/>
  <xlate lookup="Issue"/>
  <xlate lookup="Item"/>
  <xlate lookup="ItemList"/>
  <xlate lookup="Journal"/>
  <xlate lookup="JournalIssue"/>
  <xlate lookup="JournalTitle"/>
  <xlate lookup="Keyword"/>
  <xlate lookup="KeywordList"/>
  <xlate lookup="Label"/>
  <xlate lookup="Language"/>
  <xlate lookup="LastName"/>
  <xlate lookup="LastPage"/>
  <xlate lookup="LocationLabel"/>
  <xlate lookup="LZero"/>
  <xlate lookup="Medium"/>
  <xlate lookup="MedlineCitation"/>
  <xlate lookup="MedlineDate"/>
  <xlate lookup="MedlineJournalInfo"/>
  <xlate lookup="MedlinePgn"/>
  <xlate lookup="MedlineTA"/>
  <xlate lookup="MeshHeading"/>
  <xlate lookup="MeshHeadingList"/>
  <xlate lookup="MiddleName"/>
  <xlate lookup="Minute"/>
  <xlate lookup="Month"/>
  <xlate lookup="Name"/>
  <xlate lookup="NameOfSubstance"/>
  <xlate lookup="NlmUniqueID"/>
  <xlate lookup="Note"/>
  <xlate lookup="NumberOfReferences"/>
  <xlate lookup="Object"/>
  <xlate lookup="ObjectList"/>
  <xlate lookup="OtherAbstract" mixed="true"/>
  <xlate lookup="OtherID"/>
  <xlate lookup="Pagination"/>
  <xlate lookup="Param" mixed=""/>
  <xlate lookup="PersonalNameSubject"/>
  <xlate lookup="PersonalNameSubjectList"/>
  <xlate lookup="PMID"/>
  <xlate lookup="PubDate"/>
  <xlate lookup="PublicationStatus"/>
  <xlate lookup="PublicationType"/>
  <xlate lookup="PublicationTypeList"/>
  <xlate lookup="Publisher"/>
  <xlate lookup="PublisherLocation"/>
  <xlate lookup="PublisherName"/>
  <xlate lookup="PubmedArticle"/>
  <xlate lookup="PubmedArticleSet"/>
  <xlate lookup="PubmedBookArticle"/>
  <xlate lookup="PubmedBookArticleSet"/>
  <xlate lookup="PubmedBookData"/>
  <xlate lookup="PubmedData"/>
  <xlate lookup="PubMedPubDate"/>
  <xlate lookup="PubStatus"/>
  <xlate lookup="QualifierName"/>
  <xlate lookup="Reference"/>
  <xlate lookup="ReferenceList"/>
  <xlate lookup="RefSource"/>
  <xlate lookup="RegistryNumber"/>
  <xlate lookup="Replaces"/>
  <xlate lookup="ReportNumber"/>
  <xlate lookup="Season"/>
  <xlate lookup="Second"/>
  <xlate lookup="Section"/>
  <xlate lookup="Sections"/>
  <xlate lookup="SectionTitle"/>
  <xlate lookup="Source"/>
  <xlate lookup="SpaceFlightMission"/>
  <xlate lookup="StartPage"/>
  <xlate lookup="Suffix"/>
  <xlate lookup="SupplMeshList"/>
  <xlate lookup="SupplMeshName"/>
  <xlate lookup="Title"/>
  <xlate lookup="Type"/>
  <xlate lookup="URL"/>
  <xlate lookup="ValidYN"/>
  <xlate lookup="VernacularTitle" mixed=""/>
  <xlate lookup="VersionDate"/>
  <xlate lookup="VersionID"/>
  <xlate lookup="Volume"/>
  <xlate lookup="VolumeTitle"/>
  <xlate lookup="Year"/>
  <!--note that the DTD hardwires the name, so hardwired here with mml:-->
  <xlate lookup="mml:math" unsupported=""/>
  <!--inline constructs-->
  <xlate lookup="AbstractText" markdown="+" mixed=""/>
  <xlate lookup="ArticleTitle" markdown="|" mixed=""/>
  <xlate lookup="b"   mixed="" markdown="*"/>
  <xlate lookup="i"   mixed="" markdown="/"/>
  <xlate lookup="inf" mixed="" markdown="~" replace="sub"/>
  <xlate lookup="sub" mixed="" markdown="~"/>
  <xlate lookup="sup" mixed="" markdown="^"/>
  <xlate lookup="u"   mixed="" markdown="_"/>
 </xsl:document>
</xsl:variable>

</xsl:stylesheet>