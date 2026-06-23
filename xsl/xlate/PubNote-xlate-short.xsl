<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xs xsd pn"
                version="2.0">

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="PubNote-xlate-short.xsl" vocabulary="DocBook">
  <xs:title>
    PubMed In and Out DTD element names with very short hint labels
    for concise LLM egress/ingress token economy</xs:title>
  <para>
    This simply finds all of the unique element and attribute names and
    creates a set of very short, mutually unambiguous, translation
    declarations. Each short label is a human-recognizable hint only,
    not a full expansion, and is unique (case-sensitively) across the
    entire table.
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
  <xlate lookup="Abstract" mixed="true">Abst</xlate>
  <xlate lookup="AccessionNumber">AccN</xlate>
  <xlate lookup="AccessionNumberList">AccNL</xlate>
  <xlate lookup="Acronym">Acro</xlate>
  <xlate lookup="Affiliation">Aff</xlate>
  <xlate lookup="AffiliationInfo" force-close="">AffI</xlate>
  <xlate lookup="Agency">Agcy</xlate>
  <xlate lookup="ArchiveCopySource">ArcS</xlate>
  <xlate lookup="Article">Art</xlate>
  <xlate lookup="ArticleDate">ArtD</xlate>
  <xlate lookup="ArticleId">ArtId</xlate>
  <xlate lookup="ArticleIdList">ArtIdL</xlate>
  <xlate lookup="ArticleSet">ArtSet</xlate>
  <xlate lookup="Author">Au</xlate>
  <xlate lookup="AuthorList">AuL</xlate>
  <xlate lookup="BeginningDate">BegD</xlate>
  <xlate lookup="Book">Bk</xlate>
  <xlate lookup="BookDocument">BkDoc</xlate>
  <xlate lookup="BookDocumentSet">BkDocSet</xlate>
  <xlate lookup="BookTitle">BkT</xlate>
  <xlate lookup="Chemical">Chem</xlate>
  <xlate lookup="ChemicalList">ChemL</xlate>
  <xlate lookup="Citation" mixed="">Cit</xlate>
  <xlate lookup="CitationSubset">CitSub</xlate>
  <xlate lookup="CoiStatement" mixed="">Coi</xlate>
  <xlate lookup="CollectionTitle">ColT</xlate>
  <xlate lookup="CollectiveName">ColN</xlate>
  <xlate lookup="CommentsCorrections">CC</xlate>
  <xlate lookup="CommentsCorrectionsList">CCL</xlate>
  <xlate lookup="ContractNumber">ConN</xlate>
  <xlate lookup="ContributionDate">ConD</xlate>
  <xlate lookup="CopyrightInformation">Cpyr</xlate>
  <xlate lookup="Country">Ctry</xlate>
  <xlate lookup="DataBank">DB</xlate>
  <xlate lookup="DataBankList">DBL</xlate>
  <xlate lookup="DataBankName">DBN</xlate>
  <xlate lookup="DateCompleted">DtCm</xlate>
  <xlate lookup="DateRevised">DtRv</xlate>
  <xlate lookup="Day">Day</xlate>
  <xlate lookup="DeleteCitation">DelCit</xlate>
  <xlate lookup="DeleteDocument">DelDoc</xlate>
  <xlate lookup="DescriptorName">DscN</xlate>
  <xlate lookup="DispFormula" unsupported="">DispF</xlate>
  <xlate lookup="DocType">DocTy</xlate>
  <xlate lookup="Edition">Ed</xlate>
  <xlate lookup="EIdType">EIdTy</xlate>
  <xlate lookup="ELocationID">ELoc</xlate>
  <xlate lookup="EmptyYN">Empty</xlate>
  <xlate lookup="EndingDate">EndD</xlate>
  <xlate lookup="EndPage">EndPg</xlate>
  <xlate lookup="EqualContrib">EqCo</xlate>
  <xlate lookup="FirstName">FName</xlate>
  <xlate lookup="FirstPage">FPg</xlate>
  <xlate lookup="ForeName">Fore</xlate>
  <xlate lookup="GeneralNote">GenN</xlate>
  <xlate lookup="GeneSymbol">GenS</xlate>
  <xlate lookup="GeneSymbolList">GenSL</xlate>
  <xlate lookup="Grant">Gr</xlate>
  <xlate lookup="GrantID">GrId</xlate>
  <xlate lookup="GrantList">GrL</xlate>
  <xlate lookup="Group">Grp</xlate>
  <xlate lookup="GroupList">GrpL</xlate>
  <xlate lookup="GroupName">GrpN</xlate>
  <xlate lookup="History">Hist</xlate>
  <xlate lookup="Hour">Hr</xlate>
  <xlate lookup="Identifier">Id</xlate>
  <xlate lookup="IdType">IdTy</xlate>
  <xlate lookup="IndividualName">IndN</xlate>
  <xlate lookup="Initials">Init</xlate>
  <xlate lookup="Investigator">Inv</xlate>
  <xlate lookup="InvestigatorList">InvL</xlate>
  <xlate lookup="Isbn">Isbn</xlate>
  <xlate lookup="ISOAbbreviation">ISOAb</xlate>
  <xlate lookup="ISSN" pubmedin="ignore">ISSN</xlate>
  <xlate lookup="Issn" pubmedout="ignore">IsnO</xlate>
  <xlate lookup="ISSNLinking">ISSNLk</xlate>
  <xlate lookup="Issue">Iss</xlate>
  <xlate lookup="Item">Itm</xlate>
  <xlate lookup="ItemList">ItmL</xlate>
  <xlate lookup="Journal">Jrn</xlate>
  <xlate lookup="JournalIssue">JrnIss</xlate>
  <xlate lookup="JournalTitle">JrnT</xlate>
  <xlate lookup="Keyword">Kw</xlate>
  <xlate lookup="KeywordList">KwL</xlate>
  <xlate lookup="Label">Lbl</xlate>
  <xlate lookup="Language">Lang</xlate>
  <xlate lookup="LastName">LName</xlate>
  <xlate lookup="LastPage">LPg</xlate>
  <xlate lookup="LocationLabel">LocLbl</xlate>
  <xlate lookup="LZero">LZero</xlate>
  <xlate lookup="Medium">Med</xlate>
  <xlate lookup="MedlineCitation">MedCit</xlate>
  <xlate lookup="MedlineDate">MedD</xlate>
  <xlate lookup="MedlineJournalInfo">MedJI</xlate>
  <xlate lookup="MedlinePgn">MedPg</xlate>
  <xlate lookup="MedlineTA">MedTA</xlate>
  <xlate lookup="MeshHeading">Mesh</xlate>
  <xlate lookup="MeshHeadingList">MeshL</xlate>
  <xlate lookup="MiddleName">MName</xlate>
  <xlate lookup="Minute">Min</xlate>
  <xlate lookup="Month">Mo</xlate>
  <xlate lookup="Name">Nm</xlate>
  <xlate lookup="NameOfSubstance">NmSub</xlate>
  <xlate lookup="NlmUniqueID">NlmId</xlate>
  <xlate lookup="Note">Note</xlate>
  <xlate lookup="NumberOfReferences">NRefs</xlate>
  <xlate lookup="Object">Obj</xlate>
  <xlate lookup="ObjectList">ObjL</xlate>
  <xlate lookup="OtherAbstract" mixed="true">OthAbst</xlate>
  <xlate lookup="OtherID">OthId</xlate>
  <xlate lookup="Pagination">Pgn</xlate>
  <xlate lookup="Param" mixed="">Prm</xlate>
  <xlate lookup="PersonalNameSubject">PNSub</xlate>
  <xlate lookup="PersonalNameSubjectList">PNSubL</xlate>
  <xlate lookup="PMID">PMID</xlate>
  <xlate lookup="PubDate">PubD</xlate>
  <xlate lookup="PublicationStatus">PubStat</xlate>
  <xlate lookup="PublicationType">PubTy</xlate>
  <xlate lookup="PublicationTypeList">PubTyL</xlate>
  <xlate lookup="Publisher">Pubr</xlate>
  <xlate lookup="PublisherLocation">PubrLoc</xlate>
  <xlate lookup="PublisherName">PubrN</xlate>
  <xlate lookup="PubmedArticle">PMArt</xlate>
  <xlate lookup="PubmedArticleSet">PMArtSet</xlate>
  <xlate lookup="PubmedBookArticle">PMBkArt</xlate>
  <xlate lookup="PubmedBookArticleSet">PMBkArtSet</xlate>
  <xlate lookup="PubmedBookData">PMBkD</xlate>
  <xlate lookup="PubmedData">PMD</xlate>
  <xlate lookup="PubMedPubDate">PMPubD</xlate>
  <xlate lookup="PubStatus">PubSt</xlate>
  <xlate lookup="QualifierName">QualN</xlate>
  <xlate lookup="Reference">Ref</xlate>
  <xlate lookup="ReferenceList">RefL</xlate>
  <xlate lookup="RefSource">RefSrc</xlate>
  <xlate lookup="RegistryNumber">RegN</xlate>
  <xlate lookup="Replaces">Repl</xlate>
  <xlate lookup="ReportNumber">RptN</xlate>
  <xlate lookup="Season">Seas</xlate>
  <xlate lookup="Second">Sec</xlate>
  <xlate lookup="Section">Sxn</xlate>
  <xlate lookup="Sections">Sxns</xlate>
  <xlate lookup="SectionTitle">SxnT</xlate>
  <xlate lookup="Source">Src</xlate>
  <xlate lookup="SpaceFlightMission">SFM</xlate>
  <xlate lookup="StartPage">StPg</xlate>
  <xlate lookup="Suffix">Sfx</xlate>
  <xlate lookup="SupplMeshList">SupMeshL</xlate>
  <xlate lookup="SupplMeshName">SupMeshN</xlate>
  <xlate lookup="Title">Ti</xlate>
  <xlate lookup="Type">Ty</xlate>
  <xlate lookup="URL">URL</xlate>
  <xlate lookup="ValidYN">Valid</xlate>
  <xlate lookup="VernacularTitle" mixed="">VernT</xlate>
  <xlate lookup="VersionDate">VerD</xlate>
  <xlate lookup="VersionID">VerId</xlate>
  <xlate lookup="Volume">Vol</xlate>
  <xlate lookup="VolumeTitle">VolT</xlate>
  <xlate lookup="Year">Yr</xlate>
  <!--note that the DTD hardwires the name, so hardwired here with mml:-->
  <xlate lookup="mml:math" unsupported="">Math</xlate>
  <!--inline constructs-->
  <xlate lookup="AbstractText" markdown="+" mixed="">AbstTx</xlate>
  <xlate lookup="ArticleTitle" markdown="|" mixed="">ArtTi</xlate>
  <xlate lookup="b"   mixed="" markdown="*">b</xlate>
  <xlate lookup="i"   mixed="" markdown="/">i</xlate>
  <xlate lookup="inf" mixed="" markdown="~" replace="sub">inf</xlate>
  <xlate lookup="sub" mixed="" markdown="~">sub</xlate>
  <xlate lookup="sup" mixed="" markdown="^">sup</xlate>
  <xlate lookup="u"   mixed="" markdown="_">u</xlate>
 </xsl:document>
</xsl:variable>

</xsl:stylesheet>
