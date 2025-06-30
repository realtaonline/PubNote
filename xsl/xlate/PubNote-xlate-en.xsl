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
  <xlate lookup="Abstract">Abstract</xlate>
  <xlate lookup="AbstractText">Abstract Text</xlate>
  <xlate lookup="AccessionNumber">Accession Number</xlate>
  <xlate lookup="AccessionNumberList">Accession Number List</xlate>
  <xlate lookup="Acronym">Acronym</xlate>
  <xlate lookup="Affiliation">Affiliation</xlate>
  <xlate lookup="AffiliationInfo">Affiliation Info</xlate>
  <xlate lookup="Agency">Agency</xlate>
  <xlate lookup="ArchiveCopySource">Archive Copy Source</xlate>
  <xlate lookup="Article">Article</xlate>
  <xlate lookup="ArticleDate">Article Date</xlate>
  <xlate lookup="ArticleId">Article Id</xlate>
  <xlate lookup="ArticleIdList">Article Id List</xlate>
  <xlate lookup="ArticleSet">Article Set</xlate>
  <xlate lookup="ArticleTitle">Article Title</xlate>
  <xlate lookup="Author">Author</xlate>
  <xlate lookup="AuthorList">Author List</xlate>
  <xlate lookup="BeginningDate">Beginning Date</xlate>
  <xlate lookup="Book">Book</xlate>
  <xlate lookup="BookDocument">Book Document</xlate>
  <xlate lookup="BookDocumentSet">Book Document Set</xlate>
  <xlate lookup="BookTitle">Book Title</xlate>
  <xlate lookup="Chemical">Chemical</xlate>
  <xlate lookup="ChemicalList">Chemical List</xlate>
  <xlate lookup="Citation">Citation</xlate>
  <xlate lookup="CitationSubset">Citation Subset</xlate>
  <xlate lookup="CoiStatement">Conflict of Interest Statement</xlate>
  <xlate lookup="CollectionTitle">Collection Title</xlate>
  <xlate lookup="CollectiveName">Collective Name</xlate>
  <xlate lookup="CommentsCorrections">Comments Corrections</xlate>
  <xlate lookup="CommentsCorrectionsList">Comments Corrections List</xlate>
  <xlate lookup="ContractNumber">Contract Number</xlate>
  <xlate lookup="ContributionDate">Contribution Date</xlate>
  <xlate lookup="CopyrightInformation">Copyright Information</xlate>
  <xlate lookup="Country">Country</xlate>
  <xlate lookup="DataBank">Data Bank</xlate>
  <xlate lookup="DataBankList">Data Bank List</xlate>
  <xlate lookup="DataBankName">Data Bank Name</xlate>
  <xlate lookup="DateCompleted">Date Completed</xlate>
  <xlate lookup="DateRevised">Date Revised</xlate>
  <xlate lookup="Day">Day</xlate>
  <xlate lookup="DeleteCitation">Delete Citation</xlate>
  <xlate lookup="DeleteDocument">Delete Document</xlate>
  <xlate lookup="DescriptorName">Descriptor Name</xlate>
  <xlate lookup="DispFormula">Display Formula</xlate>
  <xlate lookup="ELocationID">Electronic Location ID</xlate>
  <xlate lookup="Edition">Edition</xlate>
  <xlate lookup="EndPage">End Page</xlate>
  <xlate lookup="EndingDate">Ending Date</xlate>
  <xlate lookup="FirstName">First Name</xlate>
  <xlate lookup="FirstPage">First Page</xlate>
  <xlate lookup="ForeName">Fore Name</xlate>
  <xlate lookup="GeneSymbol">Gene Symbol</xlate>
  <xlate lookup="GeneSymbolList">Gene Symbol List</xlate>
  <xlate lookup="GeneralNote">General Note</xlate>
  <xlate lookup="Grant">Grant</xlate>
  <xlate lookup="GrantID">Grant ID</xlate>
  <xlate lookup="GrantList">Grant List</xlate>
  <xlate lookup="Group">Group</xlate>
  <xlate lookup="GroupList">Group List</xlate>
  <xlate lookup="GroupName">Group Name</xlate>
  <xlate lookup="History">History</xlate>
  <xlate lookup="Hour">Hour</xlate>
  <xlate lookup="ISOAbbreviation">ISO Abbreviation</xlate>
  <xlate lookup="ISSN">ISSN</xlate>
  <xlate lookup="ISSNLinking">ISSN Linking</xlate>
  <xlate lookup="Identifier">Identifier</xlate>
  <xlate lookup="IndividualName">Individual Name</xlate>
  <xlate lookup="Initials">Initials</xlate>
  <xlate lookup="Investigator">Investigator</xlate>
  <xlate lookup="InvestigatorList">Investigator List</xlate>
  <xlate lookup="Isbn">ISBN</xlate>
  <xlate lookup="Issn">ISSN</xlate>
  <xlate lookup="Issue">Issue</xlate>
  <xlate lookup="Item">Item</xlate>
  <xlate lookup="ItemList">Item List</xlate>
  <xlate lookup="Journal">Journal</xlate>
  <xlate lookup="JournalIssue">Journal Issue</xlate>
  <xlate lookup="JournalTitle">Journal Title</xlate>
  <xlate lookup="Keyword">Keyword</xlate>
  <xlate lookup="KeywordList">Keyword List</xlate>
  <xlate lookup="Language">Language</xlate>
  <xlate lookup="LastName">Last Name</xlate>
  <xlate lookup="LastPage">Last Page</xlate>
  <xlate lookup="LocationLabel">Location Label</xlate>
  <xlate lookup="Medium">Medium</xlate>
  <xlate lookup="MedlineCitation">Medline Citation</xlate>
  <xlate lookup="MedlineDate">Medline Date</xlate>
  <xlate lookup="MedlineJournalInfo">Medline Journal Info</xlate>
  <xlate lookup="MedlinePgn">Medline Page Number</xlate>
  <xlate lookup="MedlineTA">Medline Title Abbreviation</xlate>
  <xlate lookup="MeshHeading">MeSH Heading</xlate>
  <xlate lookup="MeshHeadingList">MeSH Heading List</xlate>
  <xlate lookup="MiddleName">Middle Name</xlate>
  <xlate lookup="Minute">Minute</xlate>
  <xlate lookup="Month">Month</xlate>
  <xlate lookup="NameOfSubstance">Name Of Substance</xlate>
  <xlate lookup="NlmUniqueID">NLM Unique ID</xlate>
  <xlate lookup="Note">Note</xlate>
  <xlate lookup="NumberOfReferences">Number Of References</xlate>
  <xlate lookup="Object">Object</xlate>
  <xlate lookup="ObjectList">Object List</xlate>
  <xlate lookup="OtherAbstract">Other Abstract</xlate>
  <xlate lookup="OtherID">Other ID</xlate>
  <xlate lookup="PMID">PubMed ID</xlate>
  <xlate lookup="Pagination">Pagination</xlate>
  <xlate lookup="Param">Parameter</xlate>
  <xlate lookup="PersonalNameSubject">Personal Name Subject</xlate>
  <xlate lookup="PersonalNameSubjectList">Personal Name Subject List</xlate>
  <xlate lookup="PubDate">Publication Date</xlate>
  <xlate lookup="PubMedPubDate">PubMed Publication Date</xlate>
  <xlate lookup="PublicationStatus">Publication Status</xlate>
  <xlate lookup="PublicationType">Publication Type</xlate>
  <xlate lookup="PublicationTypeList">Publication Type List</xlate>
  <xlate lookup="Publisher">Publisher</xlate>
  <xlate lookup="PublisherLocation">Publisher Location</xlate>
  <xlate lookup="PublisherName">Publisher Name</xlate>
  <xlate lookup="PubmedArticle">PubMed Article</xlate>
  <xlate lookup="PubmedArticleSet">PubMed Article Set</xlate>
  <xlate lookup="PubmedBookArticle">PubMed Book Article</xlate>
  <xlate lookup="PubmedBookArticleSet">PubMed Book Article Set</xlate>
  <xlate lookup="PubmedBookData">PubMed Book Data</xlate>
  <xlate lookup="PubmedData">PubMed Data</xlate>
  <xlate lookup="QualifierName">Qualifier Name</xlate>
  <xlate lookup="RefSource">Reference Source</xlate>
  <xlate lookup="Reference">Reference</xlate>
  <xlate lookup="ReferenceList">Reference List</xlate>
  <xlate lookup="RegistryNumber">Registry Number</xlate>
  <xlate lookup="Replaces">Replaces</xlate>
  <xlate lookup="ReportNumber">Report Number</xlate>
  <xlate lookup="Season">Season</xlate>
  <xlate lookup="Second">Second</xlate>
  <xlate lookup="Section">Section</xlate>
  <xlate lookup="SectionTitle">Section Title</xlate>
  <xlate lookup="Sections">Sections</xlate>
  <xlate lookup="SpaceFlightMission">Space Flight Mission</xlate>
  <xlate lookup="StartPage">Start Page</xlate>
  <xlate lookup="Suffix">Suffix</xlate>
  <xlate lookup="SupplMeshList">Suppl MeSH List</xlate>
  <xlate lookup="SupplMeshName">Suppl MeSH Name</xlate>
  <xlate lookup="Title">Title</xlate>
  <xlate lookup="URL">URL</xlate>
  <xlate lookup="VernacularTitle">Vernacular Title</xlate>
  <xlate lookup="Volume">Volume</xlate>
  <xlate lookup="VolumeTitle">Volume Title</xlate>
  <xlate lookup="Year">Year</xlate>
   <!--inline constructs-->
  <xlate lookup="b">bold</xlate>
  <xlate lookup="i">italic</xlate>
  <xlate lookup="inf">inferred content</xlate>
  <xlate lookup="sub">subscript</xlate>
  <xlate lookup="sup">superscript</xlate>
  <xlate lookup="u">underscore</xlate>
 </xsl:document>
</xsl:variable>

</xsl:stylesheet>