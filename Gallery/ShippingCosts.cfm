<CFPARAM NAME="url.Gallery" DEFAULT="0">
<CFSET xGallery = url.Gallery>

<cfif xGallery is 1>
	<CFSET xTitle="Gallery - Santa Fe">
	<CFSET xThisSubtitle = "Shipping Costs">
	<CFSET xMenuToShow = "Santa Fe">
	<CFSET xItemSelected = "3">
	
<cfelseif xGallery is 2>
	<CFSET xTitle="Photographer's Showcase">
	<CFSET xThisSubtitle = "Shipping Costs">
	<CFSET xMenuToShow = "Showcase">
	<CFSET xItemSelected = "2">

<cfelseif xGallery is 3>
	<CFSET xTitle="Magnum Photos">
	<CFSET xThisSubtitle = "Shipping Costs">
	<CFSET xMenuToShow = "Magnum">
	<CFSET xItemSelected = "3">
	
<cfelse>
	<CFSET xTitle="Galleries">
	<CFSET xThisSubtitle = "Shipping Costs">
	<CFSET xMenuToShow = "Main">
	<CFSET xItemSelected = "">
	
</cfif>

<!--- <CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="../templates/Header.cfm">
	
<!--- <CFINCLUDE TEMPLATE="Menu.cfm"> --->

<CFSET xSubtitle = "Purchasing Prints">
<cfinclude template="../templates/title.cfm">
<DIV ALIGN="CENTER"><CFOUTPUT>#xHTMLTitle#</CFOUTPUT></DIV> --->

<CFSET xSubtitle = "Shipping Costs">
<CFOUTPUT>
<HTML>
<HEAD><TITLE>#xSubTitle#</TITLE></HEAD>
<BODY BGCOLOR="##d4c9ae" onLoad="window.focus()">
<cfinclude template="/templates/title.cfm">
<DIV ALIGN="CENTER">#xHTMLTitle#</DIV>
</CFOUTPUT>

 

<a name="Top"> </a>
<table cellspacing="0" cellpadding="0" align="center" width="400">

  <tr> 
    <td align="center"> 
	
	<HR><BR>
	
	<font face="Verdana, Arial, Helvetica, sans-serif" size="2">
      <strong>Purchasing Prints within the U.S.</strong><br> <hr noshade size="1" width="300">
      There is a $50 minimum charge for domestic shipments. A quote will be provided for shipping charges that are above the minimum charge. We typically ship prints using a 3-day service, insured.  For additional information, please <a href="mailto:gallery@photoeye.com?Subject=Domestic Shipping Rates">inquire</a>. <br><br><BR>
      </font>
	  
	  </td>
  </tr>

  <tr> 
     <td align="center">  <a name="outside"> </a> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
      <strong>Purchasing Prints outside the U.S.</strong><br><hr noshade size="1" width="300">
      A quote will be provided for foreign shipments.<br>For additional information, please <a href="mailto:gallery@photoeye.com?Subject=Foreign Shipping Rates">inquire</a>.
      </font>
	  
	  
	  <BR><BR>

<table align="center" width="100%"><tr><td align="center">
	<font size="2" color="Red" face="Verdana, Arial, Helvetica, Sans-Serif">
	<FORM><INPUT TYPE="BUTTON" class="input_button" style="font-size: 10px" onClick="javascript:window.close();"  VALUE="Close Window">
</td></tr></table>

</td>
  </tr>


</table>

