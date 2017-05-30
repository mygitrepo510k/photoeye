
<CFPARAM NAME="url.Spine" DEFAULT="0">
<CFPARAM NAME="url.MoreImages" DEFAULT="0">
<cfparam name="URL.ID" default="0">

<cfif not isNumeric(URL.ID)>
	<cfset URL.ID = 0 >
</cfif>

<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
	Select * from AuctionAdmin where auctionid = <cfqueryparam value="#URL.ID#" cfsqltype="cf_sql_integer">
</cfquery>

<cfif not qGetAuctionAdmin.recordCount>
	<cflocation addtoken="false" url="/auctions" />
</cfif>

<cfquery name="qGetAuctionBids" datasource="photoeyecom">
	Select Max(bid) as Bid, Count(autoid) as Count from AuctionBids where auctionid = <cfqueryparam value="#URL.ID#" cfsqltype="cf_sql_integer">
</cfquery>

<cfset xdays=datepart("y", "#qGetAuctionAdmin.TimeEnd#")-datepart("y","#Now()#")>
<cfset xhours=12+datepart("h", "#qGetAuctionAdmin.TimeEnd#")-datepart("h","#Now()#")>
<cfset xminutes=60+datepart("n", "#qGetAuctionAdmin.TimeEnd#")-datepart("n","#Now()#")>


<!--- Page Title --->
<table width="800" align="center" cellpadding="0" cellspacing="0">
  <tr height="40"><td></td></tr>
  <tr>

        <td align="center" class="Header">
		
		<CFSET xTitleParse = trim(qGetAuctionAdmin.Title)>
		<CFSET xTitle = "">
		<CFSET xTitleLength = Len(xtitleParse)>
		
		<cfloop index="Count" from="1" to="#xTitleLength#" step="1">
			<CFSET Letter = Mid(xTitleParse, Count, 1)>
			<CFIF Count gt 1>
				<CFSET PreviousLetter = Mid(xTitleParse, Count-1, 1)>
			</CFIF>
			<!--- if It's a number --->
			<CFIF asc(Letter) gte 48 and asc(Letter) lte 57>
				<CFSET xTitle = xTitle & '<font color="Black" face="Times, Times-Roman, serif" size="5">'&Letter&'</FONT>'>
			<CFELSEIF Count is 1>
				<CFSET xTitle = '<font color="Black" face="Times, Times-Roman, serif" size="5">'&Letter&'</FONT>'>
			<CFELSEIF (asc(PreviousLetter) is 32 or asc(PreviousLetter) is 45) and (asc(Letter) gte 65 and asc(Letter) lte 90)>
				<CFSET xTitle = xTitle & '<font color="Black" face="Times, Times-Roman, serif" size="5">'&Ucase(Letter)&'</FONT>'>
			<CFELSE> 
				<CFSET xTitle = xTitle & '<font color="Black" face="Times, Times-Roman, serif" size="4">'&UCASE(Letter)&'</FONT>'>
			</CFIF>
		</CFLOOP>
		
		<CFOUTPUT>#xTitle#</CFOUTPUT>
		
		</td>
  </tr></table>
  
  <!--- Intro --->
<table width="800" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" class="Example"></td>
  </tr></table>
  
  <!--- Table Spacer --->
<table width="800" align="center" cellpadding="0" cellspacing="0">
<tr height="40"><td>&nbsp;</td></tr></table>


 <table width="400" border="0" cellspacing="0" cellpadding="0" align="center">
<tr><td align="center">

<FORM>
<INPUT TYPE="BUTTON" class="input_button"  ONCLICK="javascript:history.back()" VALUE="Return to the Auction" Class="input_button">
</FORM>

<CFOUTPUT>

<CFIF url.Spine is 1>
	<a href="javascript:history.back()">
	<!--- !!!! change back when we go live !!!! --->
	<!---<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#url.id#">--->

	<cfset currentDirectory="C:\inetpub\wwwroot\Clients\photoeyecom\html\auctions\img\#url.id#">
	
	<!--- Return the image attributes, in particular, the datetime stamp --->
	<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="spine.jpg" recurse="no">
	 
	<!--- Ok, PROBLEM, this is the original image that was uploaded. Nah, it's just check to see if it has changed and if it has, then all image sizes will be remade --->
	
	<!--- Always make sure that the xheifht and xwidth sizes ARE DIFFERENT , otherwise the same image size will show for both images!--->
	
		<!--- Rick added 9/22/06 --->
		<CFIF dirQuery.recordcount gt 0>
			<cfset xcatillus = 1>
			<CFIF  qGetAuctionAdmin.ImageQuality gt 0>
				<CFSET xQuality = qGetAuctionAdmin.ImageQuality>	
			</CFIF>
			<cfset xImageAddress=ExpandPath("/auctions/img/#url.id#/")>
			<cfset xImage="spine">
			<cfset xImageFormat = "jpg">
			<CFSET xHeight = "1000">	
			<CFSET xWidth = "500">
			<cfset xId="AuctionId">
			<cfset xDbToUpdate="AuctionAdmin">
			<cfset xQueryName="qGetAuctionAdmin">
			<CFSET xAlt = "#qGetAuctionAdmin.Title#">
			<CFSET xQueryImageSizeList = "#qGetAuctionAdmin.ImageSizeList#">
			<CFSET xQueryActualImageSizeList = "#qGetAuctionAdmin.ImageActualSizeList#">
	
			<cfinclude template="/templates/GetImageInfo.cfm">
	
			<cfset xcatillus = 1>
			<img src="/auctions/img/#qGetAuctionAdmin.AuctionID#/#xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#qGetAuctionAdmin.Title#" <CFIF qGetAuctionAdmin.CoverBorder is 1>border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"<CFELSE>border="0"</CFIF>>
	</CFIF>	
	
	</a>

<CFELSEIF url.MoreImages is 1>
	<CFINCLUDE TEMPLATE="../Img/#url.id#/MoreImages.cfm">

<CFELSE>
	<a href="javascript:history.back()">
	
	<!--- !!!! change back when we go live !!!! --->
	<!---<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#url.id#">--->

	<cfset currentDirectory="C:\inetpub\wwwroot\Clients\photoeyecom\html\auctions\img\#url.id#">
	
	<!--- Return the image attributes, in particular, the datetime stamp --->
	<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">
	 
	<!--- Ok, PROBLEM, this is the original image that was uploaded. Nah, it's just check to see if it has changed and if it has, then all image sizes will be remade --->
	
		<!--- Rick added 9/22/06 --->
		<CFIF dirQuery.recordcount gt 0>
		
			<cfset xcatillus = 1>
			<CFIF  qGetAuctionAdmin.ImageQuality gt 0>
				<CFSET xQuality = qGetAuctionAdmin.ImageQuality>	
			</CFIF>
			<cfset xImageAddress=ExpandPath("/auctions/img/#url.id#/")>
			<cfset xImage="Large">
			<cfset xImageFormat = "jpg">
			<CFSET xHeight = "1000">	
			<CFSET xWidth = "950">
			<cfset xId="AuctionId">
			<cfset xDbToUpdate="AuctionAdmin">
			<cfset xQueryName="qGetAuctionAdmin">
			<CFSET xAlt = "#qGetAuctionAdmin.Title#">
			<CFSET xQueryImageSizeList = "#qGetAuctionAdmin.ImageSizeList#">
			<CFSET xQueryActualImageSizeList = "#qGetAuctionAdmin.ImageActualSizeList#">
	
			<cfinclude template="/templates/GetImageInfo.cfm">
	
			<cfset xcatillus = 1>
			<img src="/auctions/img/#qGetAuctionAdmin.AuctionID#/#xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#qGetAuctionAdmin.Title#" <CFIF qGetAuctionAdmin.CoverBorder is 1>border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"<CFELSE>border="0"</CFIF>>
	</CFIF>
	</a>
</CFIF>

</CFOUTPUT>
</td></tr></table>
