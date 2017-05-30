<CFSET xSubtitle = "Definitions of Print Processes">
<CFOUTPUT>
<HTML>
<HEAD><TITLE>#xSubTitle#</TITLE></HEAD>
<BODY BGCOLOR="##FFFFFF" onLoad="window.focus()">
<cfinclude template="../templates/title.cfm">
<DIV ALIGN="CENTER">#xHTMLTitle#</DIV>
</CFOUTPUT>

<BR>
<table width="500" border="0" align="center">


<tr>

    <td align="left" bgcolor="#999999"><center>
<font size="1" face="Verdana, Arial, Helvetica, sans-serif"> <strong><font color="black"><img src="SharedImages/dot_clear.gif" width="1" height="15" alt="" border="0"><font color="#333333">Table of Contents</font><hr noshade size="1" width="90%" color="black">
<a href="#AlbumenPrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Albumen Print</font></a>&nbsp;&nbsp;| 

&nbsp;<a href="#Carbon"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Carbon Print</font></a>&nbsp;&nbsp;| 

&nbsp;<a href="#ChromogenicPrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Chromogenic Print</font></a>&nbsp;&nbsp;| 

&nbsp;<a href="#CibachromePrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Cibachrome Print</font></a>

<br><img src="SharedImages/dot_clear.gif" width="1" height="15" alt="" border="0"><a href="#ContactPrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Contact Print</font></a>&nbsp;&nbsp;| 

&nbsp;<a href="#Daguerreotype"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Daguerreotype</font></a>&nbsp;&nbsp;| 

&nbsp;<a href="#DyeTransferPrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Dye Transfer Print</font></a>&nbsp;&nbsp;| 

<!---&nbsp;<a href="#FressonPrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Fresson Print</font></a>--->

<br><img src="SharedImages/dot_clear.gif" width="1" height="15" alt="" border="0"><a href="#Gelatin-SilverPrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Gelatin-Silver Print</font></a>&nbsp;&nbsp;| 

<!---&nbsp;<a href="#TonedGelatin-SilverPrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Toned Gelatin-Silver Print</font></a>&nbsp;&nbsp;| --->

&nbsp;<a href="#Gicl&eacute;ePrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Gicl&eacute;e Print</font></a>&nbsp;&nbsp;| 

<!--- &nbsp;<a href="#IrisPrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Iris Print</font></a>--->

<br><img src="SharedImages/dot_clear.gif" width="1" height="15" alt="" border="0"><a href="#MixedMedia"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Mixed Media</font></a>&nbsp;&nbsp;|  

&nbsp;<a href="#Montage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Montage</font></a>&nbsp;&nbsp;| 

&nbsp;<a href="#Photogram"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Photogram</font></a>&nbsp;&nbsp;| 

&nbsp;<a href="#Photogravure"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Photogravure</font></a>

<br><img src="SharedImages/dot_clear.gif" width="1" height="15" alt="" border="0"><a href="#Platinum/PalladiumPrint"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Platinum/Palladium Print</font></a>&nbsp;&nbsp;| 

&nbsp;<a href="#Polaroid"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Polaroid</font></a>&nbsp;&nbsp;| 

&nbsp;<a href="#Tintype"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none">Tintype</font></a></font></strong><img src="SharedImages/dot_clear.gif" width="1" height="15" alt="" border="0"><hr noshade size="1" width="90%" color="black"><a href="javascript:window.print();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="#333333" onMouseOver="this.color='Red';" onMouseOut="this.color='#333333';"  style="TEXT-DECORATION: none"><strong>Print Window</strong></font></a></font></center><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="SharedImages/dot_clear.gif" width="1" height="2" alt="" border="0">
</font></TD></TR></table>
<br>
<br>
<br>
<table width="500" border="0" align="center">
  <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="AlbumenPrint"> 
      </a>Albumen Print</strong><br>
     Prints made on paper coated with a solution of albumen (egg whites) and ammonia salt, which is then sensitized with silver nitrate and printed. Usually toned with chloride of gold. Popular 1850-1890. </font> 
 </td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<table width="500" border="0" align="center">
  <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="Carbon"> 
      </a>Carbon Print</strong><br>
     The carbon process is a permanent, non-silver process. The most popular version was J.W Swan's, introduced in 1864. A tissue, coated with pigmented gelatin, is exposed under a negative. The exposed gelatin hardens and becomes insoluble in water. The tissue is then backed with a transfer sheet on the gelatin side and washed, which removes the original tissue and the unhardened gelatin. A positive relief image is produced, which is then transferred to a paper support. Carbon images were also transferred onto a variety of supports, including ceramic, glass, and metal. Popular 1870-1910. <br>

They are often indistinguishable from the photomechanical Woodburytype, which employs the carbon process in its manufacture. 
</font> 
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<table width="500" border="0" align="center">
  <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="ChromogenicPrint"> 
      </a>Chromogenic Print</strong><br>
      Also called &quot;dye coupler prints.&quot; This term represents the majority of the 
      color prints made today. Part of the material that forms colored dyes upon 
      development is included in the emulsion during manufacture. During development, 
      the silver image is bleached out, leaving only the dye image.<br>
      These prints are commonly referred to as a &quot;Type C Print&quot; if made from a 
      negative and a &quot;Type R Print&quot; if made from a transparency. Introduced in 
      1936.</font> 
 </td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<table width="500" border="0" align="center">
  <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="CibachromePrint"> 
      </a>Cibachrome Print</strong><br>
      Also called &quot;silver-dye bleach prints.&quot; The dye destruction process depends upon the bleaching of dyes that are formed wholly in the sensitized material, rather than formed during processing.
<br>
Color photographic prints made under various trade names including Utocolor in the early 1900s and Gasparcolor in the 1930s. Cibachrome (now Ilfachrome) was introduced in 1963. 
 </font> 
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<table width="500" border="0" align="center">
  <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="ContactPrint"> 
      </a>Contact Print</strong><br>
       Making photographic prints by placing a negative in contact with sensitized paper and printing, giving an image the same size as the negative. 
 </font> 
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<table width="500" border="0" align="center">
  <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="Daguerreotype"> 
      </a>Daguerreotype</strong><br>
      Image formed on a silver-coated copper plate, sensitized by fumes of iodine. The image is developed in mercury vapor, which produces a unique direct positive image. Announced in 1839 by Louis-Jacques-Mand&eacute; Daguerre, who had developed this process after his partnership with Joseph Nic&eacute;phore Ni&eacute;pce. Popular until 1860. </font> 
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<table width="500" border="0" align="center">
  <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="DyeTransferPrint"> 
      </a>Dye Transfer Print</strong><br>
    Color photographic prints made from color positives or negatives by a subtractive imbibition process. The subject is photographed through filters onto three color separation negatives and printed onto a single sheet of paper.
<br>
Among the many trade names are Pinatype (introduced in 1903) and Eastman Wash-off Relief (1935-1946). The Kodak Dye Transfer process, introduced in 1946, is no longer commercially available. 
</font> 
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
 <!---<table width="500" border="0" align="center">
 <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="FressonPrint"> 
      </a>Fresson Print:</strong><br>
      </font> </td>
  </tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>--->
<table width="500" border="0" align="center">
  <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="Gelatin-SilverPrint"> 
      </a>Gelatin-Silver Print</strong><br>
       The gelatin silver process uses gelatin, an animal protein, as the binder and developed silver as the image material. The most common black and white print process, introduced in 1885 and still in use today. 
 </font> 
 </td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
  <!---<table width="500" border="0" align="center">
 <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="TonedGelatin-SilverPrint"> 
      </a>Toned Gelatin-Silver Print</strong><br>
    </font> 
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>--->
<table width="500" border="0" align="center">
  <tr> 
    <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="Gicl&eacute;ePrint"> 
      </a>Gicl&eacute;e Print</strong><br>
      Nonimpact computer-controlled prints in which tiny droplets of ink are projected from nozzles onto paper.</font> 
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<!---<table width="500" border="0" align="center">
<tr>

    <td align="left">

<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="IrisPrint"> </a>Iris Print:</strong><br><br>

</font>
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>--->
<!---<table width="500" border="0" align="center">
<tr>

    <td align="left">

<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="MixedMedia"> </a>Mixed Media</strong><br></font>
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>--->
<table width="500" border="0" align="center">
<tr>

    <td align="left">

<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="Montage"> </a>Montage</strong><br> 
Photographic prints made by re-photographing a collage or montage of two or more photographic prints or pieces of photographic prints to which drawing, painting, printing, or other two-dimensional objects may be added. 
 </font>
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<table width="500" border="0" align="center">
<tr>

    <td align="left">

<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="Photogram"> </a>Photogram</strong><br> 
Photographs produced without a camera, usually by placing an object directly on sensitized paper and exposing it to light. 
 </font>
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<table width="500" border="0" align="center">
<tr>

    <td align="left">

<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="Photogravure"> </a>Photogravure</strong><br> 
Includes most photoetchings, and also known as &quot;gravures.&quot; Invented in 1878 by Karl Klic of Bohemia. A carbon tissue (coated with bichromated gelatin) is exposed under a positive transparency. This tissue is pressed into a metal printing plate which has been dusted with resin. The plate is washed to remove the tissue and the unexposed gelatin (under the shadows of the transparency). The plate is then etched, and the acid bites into the plate where the gelatin was washed away. After etching, the plate is inked and printed. The shadows of the transparency correspond to the shadows on the print. The prints contain a fine, irregular grain pattern from the resin. 
 </font>
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<table width="500" border="0" align="center">
<tr>

    <td align="left">

<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="Platinum/PalladiumPrint"> </a>Platinum/Palladium Print</strong><br><br><strong>Platinum:</strong> An iron (non-silver) process for making photographic prints in which platinum is reduced from a salt to form the image. Introduced commercially in 1879 as Platinotype, it is a permanent process.  <br>
<br><br>
 <strong>Palladium:</strong> An iron (non-silver) process for making photographic prints in which palladium is reduced from a salt to form the image. Introduced around 1916 when platinum became very expensive because of WWI. It is a permanent process still practiced widely today. 
 </font>
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>

<table width="500" border="0" align="center">
<tr>

    <td align="left">

<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="Polaroid"> </a>Polaroid</strong><br> Also called &quot;diffusion transfer photographs.&quot; These photographs are made from film packets that contain their own developing chemicals. They may be color or black-and-white, and while they are usually prints, they may also be negatives or transparencies. Polaroid introduced the process in 1947. 
 </font>
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>


<table width="500" border="0" align="center">
<tr>

    <td align="left">

<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><strong><a name="Tintype"> </a>Tintype</strong><br>Also called &quot;ferrotypes&quot; or &quot;melainotypes.&quot; A variant of the wet collodion process producing a direct positive image on a thin sheet of lacquered, or &quot;japanned,&quot; metal, which was usually iron. Later, in the 1880's, the collodion was replaced by dry gelatin. Popular 1855-1930. </font>
</td></tr></table>
<table width="500" border="0" align="center"><tr><td align="right"><br><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Close Window</strong></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#TopofPage"><font face="verdana, arial, helvetica, sans-serif" size="1" color="black" onMouseOver="this.color='Red';" onMouseOut="this.color='black';"  style="TEXT-DECORATION: none"><strong>Top of Page</strong></font></a><hr noshade size="1" color="black"><br></td></tr></table>
<table width="500" border="0" align="center">
<tr><td><font face="verdana, arial, helvetica, sans-serif" size="1" color="black"><strong>Adapted from the list of terms and definitions on the website of the Department of Photography and Film, Harry Ransom Humanities Research Center, The University of Texas at Austin, which was compiled from various sources by David Coleman. Published here with permission.<br><br>Copyright &copy;1999, Harry Ransom Humanities Research Center.</strong></font></td></tr></table>

 



</body>
</html>
