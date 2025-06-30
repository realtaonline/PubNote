<?xml version="1.0" encoding="UTF-8"?>
<?xsl-stylesheet type="text/xsl" href="xslstyle-docbook.xsl"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary"
                exclude-result-prefixes="xs xv"
                version="1.0">
   <xs:doc filename="xslstyle-ditadef.xsl" internal-ns="xs" vocabulary="DocBook"
           info="$Id: xslstyle-ditadef.xsl,v 1.2 2007/09/16 20:15:10 G. Ken Holman Exp $">
      <xs:title>Synthesized DITA stylesheet supplying default attributes</xs:title>
      <para>
    This is a synthesized stylesheet culled from the DITA W3C Schemas providing
    defaulted class attributes for all DITA 1.1 elements.
  </para>
      <para>
    Elements alphabetized:
  </para>
      <itemizedlist>
         <listitem>
            <literal>abbrevlist</literal>: <literal>- map/topicref bookmap/abbrevlist </literal>
         </listitem>
         <listitem>
            <literal>abstract</literal>: <literal>- topic/abstract </literal>
         </listitem>
         <listitem>
            <literal>addressdetails</literal>: <literal>+ topic/ph xnal-d/addressdetails </literal>
         </listitem>
         <listitem>
            <literal>administrativearea</literal>: <literal>+ topic/ph xnal-d/administrativearea </literal>
         </listitem>
         <listitem>
            <literal>alt</literal>: <literal>- topic/alt </literal>
         </listitem>
         <listitem>
            <literal>amendments</literal>: <literal>- map/topicref bookmap/amendments </literal>
         </listitem>
         <listitem>
            <literal>anchor</literal>: <literal>- map/anchor </literal>
         </listitem>
         <listitem>
            <literal>apiname</literal>: <literal>+ topic/keyword pr-d/apiname </literal>
         </listitem>
         <listitem>
            <literal>appendix</literal>: <literal>- map/topicref bookmap/appendix </literal>
         </listitem>
         <listitem>
            <literal>approved</literal>: <literal>- topic/data bookmap/approved </literal>
         </listitem>
         <listitem>
            <literal>area</literal>: <literal>+ topic/figgroup ut-d/area </literal>
         </listitem>
         <listitem>
            <literal>audience</literal>: <literal>- topic/audience </literal>
         </listitem>
         <listitem>
            <literal>author</literal>: <literal>- topic/author </literal>
         </listitem>
         <listitem>
            <literal>authorinformation</literal>: <literal>+ topic/author xnal-d/authorinformation </literal>
         </listitem>
         <listitem>
            <literal>b</literal>: <literal>+ topic/ph hi-d/b </literal>
         </listitem>
         <listitem>
            <literal>backmatter</literal>: <literal>- map/topicref  bookmap/backmatter </literal>
         </listitem>
         <listitem>
            <literal>bibliolist</literal>: <literal>- map/topicref bookmap/bibliolist </literal>
         </listitem>
         <listitem>
            <literal>body</literal>: <literal>- topic/body </literal>
         </listitem>
         <listitem>
            <literal>bookabstract</literal>: <literal>- map/topicref bookmap/bookabstract </literal>
         </listitem>
         <listitem>
            <literal>bookchangehistory</literal>: <literal>- topic/data bookmap/bookchangehistory </literal>
         </listitem>
         <listitem>
            <literal>bookevent</literal>: <literal>- topic/data bookmap/bookevent </literal>
         </listitem>
         <listitem>
            <literal>bookeventtype</literal>: <literal>- topic/data bookmap/bookeventtype </literal>
         </listitem>
         <listitem>
            <literal>bookid</literal>: <literal>- topic/data bookmap/bookid </literal>
         </listitem>
         <listitem>
            <literal>booklibrary</literal>: <literal>- topic/ph bookmap/booklibrary </literal>
         </listitem>
         <listitem>
            <literal>booklist</literal>: <literal>- map/topicref bookmap/booklist </literal>
         </listitem>
         <listitem>
            <literal>booklists</literal>: <literal>- map/topicref  bookmap/booklists </literal>
         </listitem>
         <listitem>
            <literal>bookmap</literal>: <literal>- map/map bookmap/bookmap </literal>
         </listitem>
         <listitem>
            <literal>bookmeta</literal>: <literal>- map/topicmeta bookmap/bookmeta </literal>
         </listitem>
         <listitem>
            <literal>booknumber</literal>: <literal>- topic/data bookmap/booknumber </literal>
         </listitem>
         <listitem>
            <literal>bookowner</literal>: <literal>- topic/data bookmap/bookowner </literal>
         </listitem>
         <listitem>
            <literal>bookpartno</literal>: <literal>- topic/data bookmap/bookpartno </literal>
         </listitem>
         <listitem>
            <literal>bookrestriction</literal>: <literal>- topic/data bookmap/bookrestriction </literal>
         </listitem>
         <listitem>
            <literal>bookrights</literal>: <literal>- topic/data bookmap/bookrights </literal>
         </listitem>
         <listitem>
            <literal>booktitle</literal>: <literal>- topic/title bookmap/booktitle </literal>
         </listitem>
         <listitem>
            <literal>booktitlealt</literal>: <literal>- topic/ph bookmap/booktitlealt </literal>
         </listitem>
         <listitem>
            <literal>boolean</literal>: <literal>- topic/boolean </literal>
         </listitem>
         <listitem>
            <literal>brand</literal>: <literal>- topic/brand </literal>
         </listitem>
         <listitem>
            <literal>category</literal>: <literal>- topic/category </literal>
         </listitem>
         <listitem>
            <literal>chapter</literal>: <literal>- map/topicref bookmap/chapter </literal>
         </listitem>
         <listitem>
            <literal>chdesc</literal>: <literal>- topic/stentry task/chdesc </literal>
         </listitem>
         <listitem>
            <literal>chdeschd</literal>: <literal>- topic/stentry task/chdeschd </literal>
         </listitem>
         <listitem>
            <literal>chhead</literal>: <literal>- topic/sthead task/chhead </literal>
         </listitem>
         <listitem>
            <literal>choice</literal>: <literal>- topic/li     task/choice </literal>
         </listitem>
         <listitem>
            <literal>choices</literal>: <literal>- topic/ul     task/choices </literal>
         </listitem>
         <listitem>
            <literal>choicetable</literal>: <literal>- topic/simpletable task/choicetable </literal>
         </listitem>
         <listitem>
            <literal>choption</literal>: <literal>- topic/stentry task/choption </literal>
         </listitem>
         <listitem>
            <literal>choptionhd</literal>: <literal>- topic/stentry task/choptionhd </literal>
         </listitem>
         <listitem>
            <literal>chrow</literal>: <literal>- topic/chrow </literal>
         </listitem>
         <listitem>
            <literal>cite</literal>: <literal>- topic/cite </literal>
         </listitem>
         <listitem>
            <literal>cmd</literal>: <literal>- topic/ph     task/cmd </literal>
         </listitem>
         <listitem>
            <literal>cmdname</literal>: <literal>+ topic/keyword sw-d/cmdname </literal>
         </listitem>
         <listitem>
            <literal>codeblock</literal>: <literal>+ topic/pre pr-d/codeblock </literal>
         </listitem>
         <listitem>
            <literal>codeph</literal>: <literal>+ topic/ph pr-d/codeph </literal>
         </listitem>
         <listitem>
            <literal>colophon</literal>: <literal>- map/topicref bookmap/colophon </literal>
         </listitem>
         <listitem>
            <literal>colspec</literal>: <literal>- topic/colspec </literal>
         </listitem>
         <listitem>
            <literal>completed</literal>: <literal>- topic/ph bookmap/completed </literal>
         </listitem>
         <listitem>
            <literal>component</literal>: <literal>- topic/component </literal>
         </listitem>
         <listitem>
            <literal>conbody</literal>: <literal>- topic/body concept/conbody </literal>
         </listitem>
         <listitem>
            <literal>concept</literal>: <literal>- topic/topic concept/concept </literal>
         </listitem>
         <listitem>
            <literal>contactnumber</literal>: <literal>+ topic/data xnal-d/contactnumber </literal>
         </listitem>
         <listitem>
            <literal>contactnumbers</literal>: <literal>+ topic/data xnal-d/contactnumbers </literal>
         </listitem>
         <listitem>
            <literal>context</literal>: <literal>- topic/section  task/context </literal>
         </listitem>
         <listitem>
            <literal>coords</literal>: <literal>+ topic/ph ut-d/coords </literal>
         </listitem>
         <listitem>
            <literal>copyrfirst</literal>: <literal>- topic/data bookmap/copyrfirst </literal>
         </listitem>
         <listitem>
            <literal>copyrholder</literal>: <literal>- topic/copyrholder </literal>
         </listitem>
         <listitem>
            <literal>copyright</literal>: <literal>- topic/copyright </literal>
         </listitem>
         <listitem>
            <literal>copyrlast</literal>: <literal>- topic/data bookmap/copyrlast </literal>
         </listitem>
         <listitem>
            <literal>copyryear</literal>: <literal>- topic/copyryear </literal>
         </listitem>
         <listitem>
            <literal>country</literal>: <literal>+ topic/ph xnal-d/country </literal>
         </listitem>
         <listitem>
            <literal>created</literal>: <literal>- topic/created </literal>
         </listitem>
         <listitem>
            <literal>critdates</literal>: <literal>- topic/critdates </literal>
         </listitem>
         <listitem>
            <literal>data</literal>: <literal>- topic/data </literal>
         </listitem>
         <listitem>
            <literal>data-about</literal>: <literal>- topic/data-about </literal>
         </listitem>
         <listitem>
            <literal>day</literal>: <literal>- topic/ph bookmap/day </literal>
         </listitem>
         <listitem>
            <literal>dd</literal>: <literal>- topic/dd </literal>
         </listitem>
         <listitem>
            <literal>ddhd</literal>: <literal>- topic/ddhd </literal>
         </listitem>
         <listitem>
            <literal>dedication</literal>: <literal>- map/topicref bookmap/dedication </literal>
         </listitem>
         <listitem>
            <literal>delim</literal>: <literal>+ topic/ph pr-d/delim </literal>
         </listitem>
         <listitem>
            <literal>desc</literal>: <literal>- topic/desc </literal>
         </listitem>
         <listitem>
            <literal>dita</literal>: no class attribute</listitem>
         <listitem>
            <literal>dl</literal>: <literal>- topic/dl </literal>
         </listitem>
         <listitem>
            <literal>dlentry</literal>: <literal>- topic/dlentry </literal>
         </listitem>
         <listitem>
            <literal>dlhead</literal>: <literal>- topic/dlhead </literal>
         </listitem>
         <listitem>
            <literal>draft-comment</literal>: <literal>- topic/draft-comment </literal>
         </listitem>
         <listitem>
            <literal>draftintro</literal>: <literal>- map/topicref bookmap/draftintro </literal>
         </listitem>
         <listitem>
            <literal>dt</literal>: <literal>- topic/dt </literal>
         </listitem>
         <listitem>
            <literal>dthd</literal>: <literal>- topic/dthd </literal>
         </listitem>
         <listitem>
            <literal>edited</literal>: <literal>- topic/data bookmap/edited </literal>
         </listitem>
         <listitem>
            <literal>edition</literal>: <literal>- topic/data bookmap/edition </literal>
         </listitem>
         <listitem>
            <literal>emailaddress</literal>: <literal>+ topic/data xnal-d/emailaddress </literal>
         </listitem>
         <listitem>
            <literal>emailaddresses</literal>: <literal>+ topic/data xnal-d/emailaddresses </literal>
         </listitem>
         <listitem>
            <literal>entry</literal>: <literal>- topic/entry </literal>
         </listitem>
         <listitem>
            <literal>example</literal>: <literal>- topic/example </literal>
         </listitem>
         <listitem>
            <literal>featnum</literal>: <literal>- topic/featnum </literal>
         </listitem>
         <listitem>
            <literal>fig</literal>: <literal>- topic/fig </literal>
         </listitem>
         <listitem>
            <literal>figgroup</literal>: <literal>- topic/figgroup </literal>
         </listitem>
         <listitem>
            <literal>figurelist</literal>: <literal>- map/topicref bookmap/figurelist </literal>
         </listitem>
         <listitem>
            <literal>filepath</literal>: <literal>+ topic/ph sw-d/filepath </literal>
         </listitem>
         <listitem>
            <literal>firstname</literal>: <literal>+ topic/data xnal-d/firstname </literal>
         </listitem>
         <listitem>
            <literal>fn</literal>: <literal>- topic/fn </literal>
         </listitem>
         <listitem>
            <literal>foreign</literal>: <literal>- topic/foreign </literal>
         </listitem>
         <listitem>
            <literal>fragment</literal>: <literal>+ topic/figgroup pr-d/fragment </literal>
         </listitem>
         <listitem>
            <literal>fragref</literal>: <literal>+ topic/xref pr-d/fragref </literal>
         </listitem>
         <listitem>
            <literal>frontmatter</literal>: <literal>- map/topicref  bookmap/frontmatter </literal>
         </listitem>
         <listitem>
            <literal>generationidentifier</literal>: <literal>+ topic/data xnal-d/generationidentifier </literal>
         </listitem>
         <listitem>
            <literal>glossarylist</literal>: <literal>- map/topicref bookmap/glossarylist </literal>
         </listitem>
         <listitem>
            <literal>glossdef</literal>: <literal>- topic/abstract concept/abstract glossentry/glossdef </literal>
         </listitem>
         <listitem>
            <literal>glossentry</literal>: <literal>- topic/topic concept/concept glossentry/glossentry </literal>
         </listitem>
         <listitem>
            <literal>glossterm</literal>: <literal>- topic/title concept/title glossentry/glossterm </literal>
         </listitem>
         <listitem>
            <literal>groupchoice</literal>: <literal>+ topic/figgroup pr-d/groupchoice </literal>
         </listitem>
         <listitem>
            <literal>groupcomp</literal>: <literal>+ topic/figgroup pr-d/groupcomp </literal>
         </listitem>
         <listitem>
            <literal>groupseq</literal>: <literal>+ topic/figgroup pr-d/groupseq </literal>
         </listitem>
         <listitem>
            <literal>honorific</literal>: <literal>+ topic/data xnal-d/honorific </literal>
         </listitem>
         <listitem>
            <literal>i</literal>: <literal>+ topic/ph hi-d/i </literal>
         </listitem>
         <listitem>
            <literal>image</literal>: <literal>- topic/image </literal>
         </listitem>
         <listitem>
            <literal>imagemap</literal>: <literal>+ topic/fig ut-d/imagemap </literal>
         </listitem>
         <listitem>
            <literal>index-base</literal>: <literal>- topic/index-base </literal>
         </listitem>
         <listitem>
            <literal>index-see</literal>: <literal>+ topic/index-base indexing-d/index-see </literal>
         </listitem>
         <listitem>
            <literal>index-see-also</literal>: <literal>+ topic/index-base indexing-d/index-see-also </literal>
         </listitem>
         <listitem>
            <literal>index-sort-as</literal>: <literal>+ topic/index-base indexing-d/index-sort-as </literal>
         </listitem>
         <listitem>
            <literal>indexlist</literal>: <literal>- map/topicref bookmap/indexlist </literal>
         </listitem>
         <listitem>
            <literal>indexterm</literal>: <literal>- topic/indexterm </literal>
         </listitem>
         <listitem>
            <literal>indextermref</literal>: <literal>- topic/indextermref </literal>
         </listitem>
         <listitem>
            <literal>info</literal>: <literal>- topic/itemgroup     task/info </literal>
         </listitem>
         <listitem>
            <literal>isbn</literal>: <literal>- topic/data bookmap/isbn </literal>
         </listitem>
         <listitem>
            <literal>itemgroup</literal>: <literal>- topic/itemgroup </literal>
         </listitem>
         <listitem>
            <literal>keyword</literal>: <literal>- topic/keyword </literal>
         </listitem>
         <listitem>
            <literal>keywords</literal>: <literal>- topic/keywords </literal>
         </listitem>
         <listitem>
            <literal>kwd</literal>: <literal>+ topic/keyword pr-d/kwd </literal>
         </listitem>
         <listitem>
            <literal>lastname</literal>: <literal>+ topic/data xnal-d/lastname </literal>
         </listitem>
         <listitem>
            <literal>li</literal>: <literal>- topic/li </literal>
         </listitem>
         <listitem>
            <literal>lines</literal>: <literal>- topic/lines </literal>
         </listitem>
         <listitem>
            <literal>link</literal>: <literal>- topic/link </literal>
         </listitem>
         <listitem>
            <literal>linkinfo</literal>: <literal>- topic/linkinfo </literal>
         </listitem>
         <listitem>
            <literal>linklist</literal>: <literal>- topic/linklist </literal>
         </listitem>
         <listitem>
            <literal>linkpool</literal>: <literal>- topic/linkpool </literal>
         </listitem>
         <listitem>
            <literal>linktext</literal>: <literal>- map/linktext </literal>
         </listitem>
         <listitem>
            <literal>linktext</literal>: <literal>- topic/linktext </literal>
         </listitem>
         <listitem>
            <literal>locality</literal>: <literal>+ topic/ph xnal-d/locality </literal>
         </listitem>
         <listitem>
            <literal>localityname</literal>: <literal>+ topic/ph xnal-d/localityname </literal>
         </listitem>
         <listitem>
            <literal>lq</literal>: <literal>- topic/lq </literal>
         </listitem>
         <listitem>
            <literal>mainbooktitle</literal>: <literal>- topic/ph bookmap/mainbooktitle </literal>
         </listitem>
         <listitem>
            <literal>maintainer</literal>: <literal>- topic/data bookmap/maintainer </literal>
         </listitem>
         <listitem>
            <literal>map</literal>: <literal>- map/map </literal>
         </listitem>
         <listitem>
            <literal>menucascade</literal>: <literal>+ topic/ph ui-d/menucascade </literal>
         </listitem>
         <listitem>
            <literal>metadata</literal>: <literal>- topic/metadata </literal>
         </listitem>
         <listitem>
            <literal>middlename</literal>: <literal>+ topic/data xnal-d/middlename </literal>
         </listitem>
         <listitem>
            <literal>month</literal>: <literal>- topic/ph bookmap/month </literal>
         </listitem>
         <listitem>
            <literal>msgblock</literal>: <literal>+ topic/pre sw-d/msgblock </literal>
         </listitem>
         <listitem>
            <literal>msgnum</literal>: <literal>+ topic/keyword sw-d/msgnum </literal>
         </listitem>
         <listitem>
            <literal>msgph</literal>: <literal>+ topic/ph sw-d/msgph </literal>
         </listitem>
         <listitem>
            <literal>namedetails</literal>: <literal>+ topic/data xnal-d/namedetails </literal>
         </listitem>
         <listitem>
            <literal>navref</literal>: <literal>- map/navref </literal>
         </listitem>
         <listitem>
            <literal>navtitle</literal>: <literal>- topic/navtitle </literal>
         </listitem>
         <listitem>
            <literal>no-topic-nesting</literal>: <literal>- topic/no-topic-nesting </literal>
         </listitem>
         <listitem>
            <literal>note</literal>: <literal>- topic/note </literal>
         </listitem>
         <listitem>
            <literal>notices</literal>: <literal>- map/topicref bookmap/notices </literal>
         </listitem>
         <listitem>
            <literal>object</literal>: <literal>- topic/object </literal>
         </listitem>
         <listitem>
            <literal>ol</literal>: <literal>- topic/ol </literal>
         </listitem>
         <listitem>
            <literal>oper</literal>: <literal>+ topic/ph pr-d/oper </literal>
         </listitem>
         <listitem>
            <literal>option</literal>: <literal>+ topic/keyword pr-d/option </literal>
         </listitem>
         <listitem>
            <literal>organization</literal>: <literal>- topic/data bookmap/organization </literal>
         </listitem>
         <listitem>
            <literal>organizationinfo</literal>: <literal>+ topic/data xnal-d/organizationinfo </literal>
         </listitem>
         <listitem>
            <literal>organizationname</literal>: <literal>+ topic/ph xnal-d/organizationname </literal>
         </listitem>
         <listitem>
            <literal>organizationnamedetails</literal>: <literal>+ topic/ph xnal-d/organizationnamedetails </literal>
         </listitem>
         <listitem>
            <literal>otherinfo</literal>: <literal>+ topic/data xnal-d/otherinfo </literal>
         </listitem>
         <listitem>
            <literal>othermeta</literal>: <literal>- topic/othermeta </literal>
         </listitem>
         <listitem>
            <literal>p</literal>: <literal>- topic/p </literal>
         </listitem>
         <listitem>
            <literal>param</literal>: <literal>- topic/param </literal>
         </listitem>
         <listitem>
            <literal>parml</literal>: <literal>+ topic/dl pr-d/parml </literal>
         </listitem>
         <listitem>
            <literal>parmname</literal>: <literal>+ topic/keyword  pr-d/parmname </literal>
         </listitem>
         <listitem>
            <literal>part</literal>: <literal>- map/topicref bookmap/part </literal>
         </listitem>
         <listitem>
            <literal>pd</literal>: <literal>+ topic/dd pr-d/pd </literal>
         </listitem>
         <listitem>
            <literal>permissions</literal>: <literal>- topic/permissions </literal>
         </listitem>
         <listitem>
            <literal>person</literal>: <literal>- topic/data bookmap/person </literal>
         </listitem>
         <listitem>
            <literal>personinfo</literal>: <literal>+ topic/data xnal-d/personinfo </literal>
         </listitem>
         <listitem>
            <literal>personname</literal>: <literal>+ topic/data xnal-d/personname </literal>
         </listitem>
         <listitem>
            <literal>ph</literal>: <literal>- topic/ph </literal>
         </listitem>
         <listitem>
            <literal>platform</literal>: <literal>- topic/platform </literal>
         </listitem>
         <listitem>
            <literal>plentry</literal>: <literal>+ topic/dlentry pr-d/plentry </literal>
         </listitem>
         <listitem>
            <literal>postalcode</literal>: <literal>+ topic/ph xnal-d/postalcode </literal>
         </listitem>
         <listitem>
            <literal>postreq</literal>: <literal>- topic/section task/postreq </literal>
         </listitem>
         <listitem>
            <literal>pre</literal>: <literal>- topic/pre </literal>
         </listitem>
         <listitem>
            <literal>preface</literal>: <literal>- map/topicref bookmap/preface </literal>
         </listitem>
         <listitem>
            <literal>prereq</literal>: <literal>- topic/section  task/prereq </literal>
         </listitem>
         <listitem>
            <literal>printlocation</literal>: <literal>- topic/data bookmap/printlocation </literal>
         </listitem>
         <listitem>
            <literal>prodinfo</literal>: <literal>- topic/prodinfo </literal>
         </listitem>
         <listitem>
            <literal>prodname</literal>: <literal>- topic/prodname </literal>
         </listitem>
         <listitem>
            <literal>prognum</literal>: <literal>- topic/prognum </literal>
         </listitem>
         <listitem>
            <literal>prolog</literal>: <literal>- topic/prolog </literal>
         </listitem>
         <listitem>
            <literal>propdesc</literal>: <literal>- topic/stentry  reference/propdesc </literal>
         </listitem>
         <listitem>
            <literal>propdeschd</literal>: <literal>- topic/stentry  reference/propdeschd </literal>
         </listitem>
         <listitem>
            <literal>properties</literal>: <literal>- topic/simpletable reference/properties </literal>
         </listitem>
         <listitem>
            <literal>property</literal>: <literal>- topic/strow  reference/property </literal>
         </listitem>
         <listitem>
            <literal>prophead</literal>: <literal>- topic/sthead  reference/prophead </literal>
         </listitem>
         <listitem>
            <literal>proptype</literal>: <literal>- topic/stentry reference/proptype </literal>
         </listitem>
         <listitem>
            <literal>proptypehd</literal>: <literal>- topic/stentry reference/proptypehd </literal>
         </listitem>
         <listitem>
            <literal>propvalue</literal>: <literal>- topic/stentry  reference/propvalue </literal>
         </listitem>
         <listitem>
            <literal>propvaluehd</literal>: <literal>- topic/stentry  reference/propvaluehd </literal>
         </listitem>
         <listitem>
            <literal>pt</literal>: <literal>+ topic/dt pr-d/pt </literal>
         </listitem>
         <listitem>
            <literal>published</literal>: <literal>- topic/data bookmap/published </literal>
         </listitem>
         <listitem>
            <literal>publisher</literal>: <literal>- topic/publisher </literal>
         </listitem>
         <listitem>
            <literal>publisherinformation</literal>: <literal>- topic/publisher bookmap/publisherinformation </literal>
         </listitem>
         <listitem>
            <literal>publishtype</literal>: <literal>- topic/data bookmap/publishtype </literal>
         </listitem>
         <listitem>
            <literal>q</literal>: <literal>- topic/q </literal>
         </listitem>
         <listitem>
            <literal>refbody</literal>: <literal>- topic/body reference/refbody </literal>
         </listitem>
         <listitem>
            <literal>reference</literal>: <literal>- topic/topic reference/reference </literal>
         </listitem>
         <listitem>
            <literal>refsyn</literal>: <literal>- topic/section reference/refsyn </literal>
         </listitem>
         <listitem>
            <literal>related-links</literal>: <literal>- topic/related-links </literal>
         </listitem>
         <listitem>
            <literal>relcell</literal>: <literal>- map/relcell </literal>
         </listitem>
         <listitem>
            <literal>relcolspec</literal>: <literal>- map/relcolspec </literal>
         </listitem>
         <listitem>
            <literal>relheader</literal>: <literal>- map/relheader </literal>
         </listitem>
         <listitem>
            <literal>relrow</literal>: <literal>- map/relrow </literal>
         </listitem>
         <listitem>
            <literal>reltable</literal>: <literal>- map/reltable </literal>
         </listitem>
         <listitem>
            <literal>repsep</literal>: <literal>+ topic/ph pr-d/repsep </literal>
         </listitem>
         <listitem>
            <literal>required-cleanup</literal>: <literal>- topic/required-cleanup </literal>
         </listitem>
         <listitem>
            <literal>resourceid</literal>: <literal>- topic/resourceid </literal>
         </listitem>
         <listitem>
            <literal>result</literal>: <literal>- topic/section     task/result </literal>
         </listitem>
         <listitem>
            <literal>reviewed</literal>: <literal>- topic/data bookmap/reviewed </literal>
         </listitem>
         <listitem>
            <literal>revised</literal>: <literal>- topic/revised </literal>
         </listitem>
         <listitem>
            <literal>revisionid</literal>: <literal>- topic/ph bookmap/revisionid </literal>
         </listitem>
         <listitem>
            <literal>row</literal>: <literal>- topic/row </literal>
         </listitem>
         <listitem>
            <literal>screen</literal>: <literal>+ topic/pre ui-d/screen </literal>
         </listitem>
         <listitem>
            <literal>searchtitle</literal>: <literal>- map/searchtitle </literal>
         </listitem>
         <listitem>
            <literal>searchtitle</literal>: <literal>- topic/searchtitle </literal>
         </listitem>
         <listitem>
            <literal>section</literal>: <literal>- topic/section </literal>
         </listitem>
         <listitem>
            <literal>sep</literal>: <literal>+ topic/ph pr-d/sep </literal>
         </listitem>
         <listitem>
            <literal>series</literal>: <literal>- topic/series </literal>
         </listitem>
         <listitem>
            <literal>shape</literal>: <literal>+ topic/keyword ut-d/shape </literal>
         </listitem>
         <listitem>
            <literal>shortcut</literal>: <literal>+ topic/keyword ui-d/shortcut </literal>
         </listitem>
         <listitem>
            <literal>shortdesc</literal>: <literal>- map/shortdesc </literal>
         </listitem>
         <listitem>
            <literal>shortdesc</literal>: <literal>- topic/shortdesc </literal>
         </listitem>
         <listitem>
            <literal>simpletable</literal>: <literal>- topic/simpletable </literal>
         </listitem>
         <listitem>
            <literal>sl</literal>: <literal>- topic/sl </literal>
         </listitem>
         <listitem>
            <literal>sli</literal>: <literal>- topic/sli </literal>
         </listitem>
         <listitem>
            <literal>source</literal>: <literal>- topic/source </literal>
         </listitem>
         <listitem>
            <literal>started</literal>: <literal>- topic/ph bookmap/started </literal>
         </listitem>
         <listitem>
            <literal>state</literal>: <literal>- topic/state </literal>
         </listitem>
         <listitem>
            <literal>stentry</literal>: <literal>- topic/stentry </literal>
         </listitem>
         <listitem>
            <literal>step</literal>: <literal>- topic/li     task/step </literal>
         </listitem>
         <listitem>
            <literal>stepresult</literal>: <literal>- topic/itemgroup task/stepresult </literal>
         </listitem>
         <listitem>
            <literal>steps</literal>: <literal>- topic/ol  task/steps </literal>
         </listitem>
         <listitem>
            <literal>steps-unordered</literal>: <literal>- topic/ul     task/steps-unordered </literal>
         </listitem>
         <listitem>
            <literal>stepxmp</literal>: <literal>- topic/itemgroup     task/stepxmp </literal>
         </listitem>
         <listitem>
            <literal>sthead</literal>: <literal>- topic/sthead </literal>
         </listitem>
         <listitem>
            <literal>strow</literal>: <literal>- topic/strow </literal>
         </listitem>
         <listitem>
            <literal>sub</literal>: <literal>+ topic/ph hi-d/sub </literal>
         </listitem>
         <listitem>
            <literal>substep</literal>: <literal>- topic/li     task/substep </literal>
         </listitem>
         <listitem>
            <literal>substeps</literal>: <literal>- topic/ol     task/substeps </literal>
         </listitem>
         <listitem>
            <literal>summary</literal>: <literal>- topic/ph bookmap/summary </literal>
         </listitem>
         <listitem>
            <literal>sup</literal>: <literal>+ topic/ph hi-d/sup </literal>
         </listitem>
         <listitem>
            <literal>synblk</literal>: <literal>+ topic/figgroup pr-d/synblk </literal>
         </listitem>
         <listitem>
            <literal>synnote</literal>: <literal>+ topic/fn pr-d/synnote </literal>
         </listitem>
         <listitem>
            <literal>synnoteref</literal>: <literal>+ topic/xref pr-d/synnoteref </literal>
         </listitem>
         <listitem>
            <literal>synph</literal>: <literal>+ topic/ph pr-d/synph </literal>
         </listitem>
         <listitem>
            <literal>syntaxdiagram</literal>: <literal>+ topic/fig pr-d/syntaxdiagram </literal>
         </listitem>
         <listitem>
            <literal>systemoutput</literal>: <literal>+ topic/ph sw-d/systemoutput </literal>
         </listitem>
         <listitem>
            <literal>table</literal>: <literal>- topic/table </literal>
         </listitem>
         <listitem>
            <literal>tablelist</literal>: <literal>- map/topicref bookmap/tablelist </literal>
         </listitem>
         <listitem>
            <literal>task</literal>: <literal>- topic/topic task/task </literal>
         </listitem>
         <listitem>
            <literal>taskbody</literal>: <literal>- topic/body  task/taskbody </literal>
         </listitem>
         <listitem>
            <literal>tbody</literal>: <literal>- topic/tbody </literal>
         </listitem>
         <listitem>
            <literal>term</literal>: <literal>- topic/term </literal>
         </listitem>
         <listitem>
            <literal>tested</literal>: <literal>- topic/data bookmap/tested </literal>
         </listitem>
         <listitem>
            <literal>tgroup</literal>: <literal>- topic/tgroup </literal>
         </listitem>
         <listitem>
            <literal>thead</literal>: <literal>- topic/thead </literal>
         </listitem>
         <listitem>
            <literal>thoroughfare</literal>: <literal>+ topic/ph xnal-d/thoroughfare </literal>
         </listitem>
         <listitem>
            <literal>title</literal>: <literal>- topic/title </literal>
         </listitem>
         <listitem>
            <literal>titlealts</literal>: <literal>- topic/titlealts </literal>
         </listitem>
         <listitem>
            <literal>tm</literal>: <literal>- topic/tm </literal>
         </listitem>
         <listitem>
            <literal>toc</literal>: <literal>- map/topicref bookmap/toc </literal>
         </listitem>
         <listitem>
            <literal>topic</literal>: <literal>- topic/topic </literal>
         </listitem>
         <listitem>
            <literal>topicgroup</literal>: <literal>+ map/topicref mapgroup-d/topicgroup </literal>
         </listitem>
         <listitem>
            <literal>topichead</literal>: <literal>+ map/topicref mapgroup-d/topichead </literal>
         </listitem>
         <listitem>
            <literal>topicmeta</literal>: <literal>- map/topicmeta </literal>
         </listitem>
         <listitem>
            <literal>topicref</literal>: <literal>- map/topicref </literal>
         </listitem>
         <listitem>
            <literal>trademarklist</literal>: <literal>- map/topicref bookmap/trademarklist </literal>
         </listitem>
         <listitem>
            <literal>tt</literal>: <literal>+ topic/ph hi-d/tt </literal>
         </listitem>
         <listitem>
            <literal>tutorialinfo</literal>: <literal>- topic/itemgroup task/tutorialinfo </literal>
         </listitem>
         <listitem>
            <literal>u</literal>: <literal>+ topic/ph hi-d/u </literal>
         </listitem>
         <listitem>
            <literal>uicontrol</literal>: <literal>+ topic/ph ui-d/uicontrol </literal>
         </listitem>
         <listitem>
            <literal>ul</literal>: <literal>- topic/ul </literal>
         </listitem>
         <listitem>
            <literal>unknown</literal>: <literal>- topic/unknown </literal>
         </listitem>
         <listitem>
            <literal>url</literal>: <literal>+ topic/data xnal-d/url </literal>
         </listitem>
         <listitem>
            <literal>urls</literal>: <literal>+ topic/data xnal-d/urls </literal>
         </listitem>
         <listitem>
            <literal>userinput</literal>: <literal>+ topic/ph sw-d/userinput </literal>
         </listitem>
         <listitem>
            <literal>var</literal>: <literal>+ topic/ph pr-d/var </literal>
         </listitem>
         <listitem>
            <literal>varname</literal>: <literal>+ topic/keyword sw-d/varname </literal>
         </listitem>
         <listitem>
            <literal>volume</literal>: <literal>- topic/data bookmap/volume </literal>
         </listitem>
         <listitem>
            <literal>vrm</literal>: <literal>- topic/vrm </literal>
         </listitem>
         <listitem>
            <literal>vrmlist</literal>: <literal>- topic/vrmlist </literal>
         </listitem>
         <listitem>
            <literal>wintitle</literal>: <literal>+ topic/keyword ui-d/wintitle </literal>
         </listitem>
         <listitem>
            <literal>xref</literal>: <literal>- topic/xref </literal>
         </listitem>
         <listitem>
            <literal>year</literal>: <literal>- topic/ph bookmap/year </literal>
         </listitem>
      </itemizedlist>
      <programlisting>
Copyright (C) - Crane Softwrights Ltd. 

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice, 
  this list of conditions and the following disclaimer. 
- Redistributions in binary form must reproduce the above copyright notice, 
  this list of conditions and the following disclaimer in the documentation 
  and/or other materials provided with the distribution. 
- The name of the author may not be used to endorse or promote products 
  derived from this software without specific prior written permission. 

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR 
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN 
NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Note: for your reference, the above is the "Modified BSD license", this text
      was obtained 2002-12-16 at http://www.xfree86.org/3.3.6/COPYRIGHT2.html#5
  </programlisting>
   </xs:doc>
   <xs:template>
      <para>Elements without a class attribute</para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="dita">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ map/topicref mapgroup-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="topichead | topicgroup">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ map/topicref mapgroup-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/author xnal-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="authorinformation">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/author xnal-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/data xnal-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate"
                 match="contactnumber | contactnumbers | emailaddress | emailaddresses | firstname | generationidentifier | honorific | lastname | middlename | namedetails | organizationinfo | otherinfo | personinfo | personname | url | urls">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/data xnal-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/dd pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="pd">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/dd pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/dl pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="parml">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/dl pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/dlentry pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="plentry">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/dlentry pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/dt pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="pt">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/dt pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/fig pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="syntaxdiagram">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/fig pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/fig ut-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="imagemap">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/fig ut-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/figgroup pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate"
                 match="synblk | groupseq | groupchoice | groupcomp | fragment">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/figgroup pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/figgroup ut-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="area">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/figgroup ut-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/fn pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="synnote">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/fn pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/index-base indexing-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="index-see | index-see-also | index-sort-as">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/index-base indexing-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/keyword  pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="parmname">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/keyword  pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/keyword pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="option | apiname | kwd">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/keyword pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/keyword sw-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="msgnum | varname | cmdname">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/keyword sw-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/keyword ui-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="shortcut | wintitle">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/keyword ui-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/keyword ut-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="shape">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/keyword ut-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/ph hi-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="sup | sub | tt | b | u | i">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/ph hi-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/ph pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate"
                 match="codeph | var | synph | oper | delim | sep | repsep">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/ph pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/ph sw-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="msgph | filepath | userinput | systemoutput">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/ph sw-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/ph ui-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="uicontrol | menucascade">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/ph ui-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/ph ut-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="coords">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/ph ut-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/ph xnal-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate"
                 match="addressdetails | administrativearea | country | locality | localityname | organizationname | organizationnamedetails | postalcode | thoroughfare">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/ph xnal-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/pre pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="codeblock">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/pre pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/pre sw-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="msgblock">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/pre sw-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/pre ui-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="screen">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/pre ui-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>+ topic/xref pr-d/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="fragref | synnoteref">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>+ topic/xref pr-d/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- map/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate"
                 match="map | navref | topicref | reltable | relheader | relcolspec | relrow | relcell | anchor | topicmeta | linktext | searchtitle | shortdesc">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- map/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- map/map bookmap/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="bookmap">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- map/map bookmap/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- map/topicmeta bookmap/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="bookmeta">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- map/topicmeta bookmap/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- map/topicref  bookmap/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="frontmatter | backmatter | booklists">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- map/topicref  bookmap/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- map/topicref bookmap/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate"
                 match="draftintro | bookabstract | dedication | preface | chapter | part | appendix | notices | amendments | colophon | toc | figurelist | tablelist | abbrevlist | trademarklist | bibliolist | glossarylist | indexlist | booklist">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- map/topicref bookmap/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/abstract concept/abstract glossentry/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="glossdef">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/abstract concept/abstract glossentry/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/body  task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="taskbody">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/body  task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/body concept/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="conbody">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/body concept/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/body reference/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="refbody">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/body reference/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/data bookmap/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate"
                 match="person | organization | bookchangehistory | bookid | printlocation | published | publishtype | reviewed | edited | tested | approved | bookevent | bookeventtype | bookpartno | edition | isbn | booknumber | volume | maintainer | bookrights | copyrfirst | copyrlast | bookowner | bookrestriction">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/data bookmap/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/itemgroup     task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="info | stepxmp">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/itemgroup     task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/itemgroup task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="tutorialinfo | stepresult">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/itemgroup task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/li     task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="choice | step | substep">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/li     task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/ol     task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="substeps">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/ol     task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/ol  task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="steps">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/ol  task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/ph     task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="cmd">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/ph     task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/ph bookmap/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate"
                 match="summary | revisionid | started | completed | year | month | day | booklibrary | mainbooktitle | booktitlealt">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/ph bookmap/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/publisher bookmap/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="publisherinformation">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/publisher bookmap/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/section     task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="result">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/section     task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/section  task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="prereq | context">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/section  task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/section reference/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="refsyn">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/section reference/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/section task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="postreq">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/section task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/simpletable reference/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="properties">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/simpletable reference/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/simpletable task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="choicetable">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/simpletable task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/stentry  reference/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="propvalue | propdesc | propvaluehd | propdeschd">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/stentry  reference/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/stentry reference/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="proptype | proptypehd">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/stentry reference/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/stentry task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="choptionhd | chdeschd | choption | chdesc">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/stentry task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/sthead  reference/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="prophead">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/sthead  reference/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/sthead task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="chhead">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/sthead task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/strow  reference/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="property">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/strow  reference/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate"
                 match="title | keyword | desc | ph | term | tm | boolean | state | p | lq | note | q | ul | ol | sl | sli | li | itemgroup | dl | dlhead | ddhd | dthd | dlentry | dt | dd | fig | figgroup | pre | lines | image | alt | object | param | simpletable | sthead | strow | stentry | draft-comment | required-cleanup | fn | indextermref | cite | xref | data | data-about | foreign | indexterm | index-base | unknown | author | source | publisher | copyright | copyryear | copyrholder | critdates | revised | created | resourceid | audience | category | keywords | othermeta | permissions | prodinfo | brand | series | platform | prognum | featnum | component | prodname | vrmlist | vrm | chrow | table | tgroup | colspec | thead | tbody | row | entry | topic | no-topic-nesting | titlealts | navtitle | searchtitle | shortdesc | body | section | example | prolog | metadata | related-links | linklist | linkinfo | linkpool | linktext | link | abstract">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/title bookmap/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="booktitle">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/title bookmap/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/title concept/title glossentry/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="glossterm">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/title concept/title glossentry/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/topic concept/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="concept">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/topic concept/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/topic concept/concept glossentry/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="glossentry">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/topic concept/concept glossentry/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/topic reference/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="reference">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/topic reference/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/topic task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="task">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/topic task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
   <xs:template>
      <para>Matches the class group: 
      <literal>- topic/ul     task/</literal>
      </para>
   </xs:template>
   <xsl:template mode="xs:intermediate" match="steps-unordered | choices">
      <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
         <xsl:attribute name="class">
            <xsl:text>- topic/ul     task/</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text> </xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="xs:intermediate"/>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>