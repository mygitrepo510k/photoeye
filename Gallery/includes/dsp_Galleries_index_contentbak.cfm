
   
<CFSET xBGCOLOR="##EEEEEE">
<CFSET xRollover_off="">
<CFSET xRollover_on="##EEEEEE">
<CFSET xColorA = "Silver">

<cfset ImageNumber = 1>
<cfset ImagePosition = 1>
<cfset FirstTime = 1>
<cfset rowcount =1>

<cfif isdefined("url.GL2")>
	<cfset GL2=#url.GL2#>
<cfelse>
	<cfset GL2=''>
</cfif>


<cfset imgbeginType1=RAND()>
<cfset imgbeginType2=RAND()>
<cfset imgbeginType3=RAND()>
<cfif GL2 is 1 AND isdefined("url.RN")>
	<cfset imgbeginType1=#RN#>
<cfelseif GL2 is 2 AND isdefined("url.RN")>
	<cfset imgbeginType2=#RN#>
<cfelseif GL2 is 3 AND isdefined("url.RN")> 
	<cfset imgbeginType3=#RN#>
</cfif>


<!--- Carrying over the site index page image to the gallery index --->
<CFIF IsDefined("url.P")  and IsDefined("url.G") and IsDefined("url.A")>
	<CFSET xUseSpecificPortfolio = url.G>
<CFELSE>
	<CFSET xUseSpecificPortfolio = 0>
</CFIF>

<cfset xImgPosition=RANDRANGE(1,5)>
<cfquery name="qGetSantaFe"  datasource="photoeyecom">
SELECT  DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!---AND D.GeneralRandomNo>#imgbeginType1#---> AND G.Gallery='RepresentedArtists' and P.ShowcaseOK=1  AND (I.ImagePosition = #xImgPosition#) and I.NotAvailable <> 4
<CFIF xUseSpecificPortfolio is 1> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo  
</cfquery>
<!--- ORDER BY D.GeneralRandomNo  --->
<cfif qGetSantaFe.recordcount is 0>
	<cfset xImgPosition=RANDRANGE(1,5)>
	<cfquery name="qGetSantaFe"  datasource="photoeyecom">
	SELECT  DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
	    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
	FROM GallerySetup G 
		INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
		INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
		INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber 
	WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!---AND D.GeneralRandomNo<#imgbeginType1#---> AND G.Gallery='RepresentedArtists' and P.ShowcaseOK=1  AND (I.ImagePosition = #xImgPosition#) and I.NotAvailable <> 4
	<CFIF xUseSpecificPortfolio is 1> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
	ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo  
	</cfquery>
	</cfif>
	<!--- ORDER BY D.GeneralRandomNo DESC --->
    <cfset xImgPosition=RANDRANGE(1,5)>
	<cfquery name="qGetShowcase"  datasource="photoeyecom">
	SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
	    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
	FROM GallerySetup G 
		INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
		INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
		INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber and I.NotAvailable <> 4
	WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!--- AND D.GeneralRandomNo>#imgbeginType2#  --->AND G.Gallery='PhotoShowcase' and P.ShowcaseOK=1  AND (I.ImagePosition =  #xImgPosition#) and I.NotAvailable <> 4
	<CFIF xUseSpecificPortfolio is 2> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
	ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
	</cfquery>
	<!--- ORDER BY D.GeneralRandomNo --->
	<!--- ORDER BY D.GeneralRandomNo --->
	<!--- Takes into account random number being too high--->
	<cfif qGetShowcase.recordcount is 0>
    <cfset xImgPosition=RANDRANGE(1,5)>
		<cfquery name="qGetShowcase"  datasource="photoeyecom">
	SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
	    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
	FROM GallerySetup G 
		INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
		INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
		INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber 
	WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!--- AND D.GeneralRandomNo<#imgbeginType2#  --->AND G.Gallery='PhotoShowcase' and P.ShowcaseOK=1  AND (I.ImagePosition =  #xImgPosition#) and I.NotAvailable <> 4
	<CFIF xUseSpecificPortfolio is 2> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
	ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
		</cfquery>
</cfif>
<!--- ORDER BY D.GeneralRandomNo DESC --->


<cfquery name="qGetMagnum"  datasource="photoeyecom">
<cfset xImgPosition=RANDRANGE(1,5)>
SELECT  DISTINCT top 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!---AND D.GeneralRandomNo>#imgbeginType3#---> AND G.Gallery='MagnumArtists' and P.ShowcaseOK=1  AND (I.ImagePosition =  #xImgPosition#) and I.NotAvailable <> 4
<CFIF xUseSpecificPortfolio is 3> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
</cfquery>  
<!--- ORDER BY D.GeneralRandomNo --->

<cfif qGetMagnum.recordcount is 0>
<cfset xImgPosition=RANDRANGE(1,5)>
	<cfquery name="qGetMagnum"  datasource="photoeyecom">
	SELECT  DISTINCT top 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
	    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
	FROM GallerySetup G 
		INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
		INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
		INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
	WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!---AND D.GeneralRandomNo<#imgbeginType3#---> AND G.Gallery='MagnumArtists' and P.ShowcaseOK=1  AND (I.ImagePosition =  #xImgPosition#)  and I.NotAvailable <> 4
	<CFIF xUseSpecificPortfolio is 3> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
	ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
	</cfquery> 
<!--- ORDER BY D.GeneralRandomNo DESC --->
</cfif> 

<CFOUTPUT>


<TABLE ALIGN="CENTER" WIDTH="840"><TR>

<CFIF qGetMagnum.RecordCount gt 0>
	<TD VALIGN="TOP" CELLPADDING="5" ALIGN="center" colspan="1">
		<TABLE   CELLPADDING="5" ID="FotoFest">
		<TR>
			<td	align="center" valign="top" BGCOLOR="#xRollover_Off#"  onMouseOver="FotoFest.style.backgroundColor='#xRollOver_On#'; FotoFest.style.cursor='hand';" onMouseOut="FotoFest.style.backgroundColor='#xRollover_Off#'; FotoFest.style.cursor='pointer';">
			<a href="http://fotofestbeijing.visualserver.com" target="_blank"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="2"  style="FONT-SIZE:12px; TEXT-DECORATION:none;" id="FotoFest_Title">
				Meeting Place <br />
				FotoFest Beijing 2006
		</font></a></td>
		</TR>
		<TR>
			<TD onMouseOver="FotoFest.style.backgroundColor='#xRollOver_On#'; FotoFest.style.cursor='hand';" onMouseOut="FotoFest.style.backgroundColor='#xRollover_Off#'; FotoFest.style.cursor='pointer';"  ALIGN="CENTER">
				<TABLE>
				<TR>
					<TD ALIGN="CENTER" BGCOLOR="#xRollover_Off#"  >
					<!--- <cfinclude template="dsp_HomePageImage.cfm"> --->
					<!--- <CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
					SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
					FROM GalleryPortfolio
					WHERE (Custnumber = #qGetMagnum.Custnumber#)
					</cfquery>
					
							 <!--- <a href="forms/index.cfm?image=#ImageNumber#&id=#qGetMagnum.Custnumber#&imagePosition=#qGetMagnum.ImagePosition#&Door=0&Portfolio=#qGetMagnum.Portfolio#&Gallery=3" target="_top"> --->
					
					<a href="MagnumArtists/homepageMA.cfm">
					
					<!--- ImageSizer --->									
					<cfset xheight=140>
					<cfset xwidth=250>
					<cfset xImageAddress="#xRelativePath#\Artists\#qGetMagnum.Subdirectory#\#qGetMagnum.Portfolio#\Images_Large\">
					<CFSET xAlt = "&copy; #trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#">
					<cfset xImage = "Image#qGetMagnum.ImageNumber#">
					<cfset xImageFormat = "jpg">
					<cfif NOT ListFindNoCase(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
						<cfinclude template="../templates/imagesizercreate.cfm">
						<cfquery name="qUpdate"  datasource="photoeyecom">
							Update GalleryIndividualPhotos
							Set ImageSizeList = '#ListAppend(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
							Where RecordNo = #qGetMagnum.RecordNo#
						</cfquery>
					</cfif>
					
					<img src="../artists/#qGetMagnum.Subdirectory#/#qGetMagnum.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"> --->
					<!--- End ImageSizer --->
                    
                    	<a href="http://fotofestbeijing.visualserver.com" target="_blank">
						<cfset xheight=200>
					<cfset xwidth=200>
					<!---<cfset xheight=200 140>
					<cfset xwidth=300 250>--->
					<cfset xImageAddress="">
                    <cfset xPath = "/gallery/">
					<CFSET xAlt = "&copy; Liu Li Jie">
                    <cfset xImage = "LIULIJIE.jpg">
					<cfset xImageFormat = "jpg">
                    	<cfinclude template="/templates/imagesizer9.cfm">
<!---				<img src="LIULIJIE.jpg" width="200" height="200"  border="0">
		--->		<cfoutput><img src="/_cache/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt='#xAlt#' border="0" style="border-color:silver"></CFOUTPUT></A>
                    
                    	</TD>
				</TR>
				<TR>
					<TD ALIGN="CENTER">
					<font color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1">
						LIU LI JIE 
<!--- 					
					<CFSET xPortfolioName = qGetMagnum.PortfolioName>
					<CFSET xTitle = qGetMagnum.Title>
					
					<CFIF NOT FindNoCase("Portfolio", xPortfolioName) and len(xPortfolioName) gt 0 and len(xPortfolioName) lt 35>
					#xPortfolioName# <BR>
					<CFELSEIF NOT FindNoCase("Untitled", xTitle) and len(xTitle) gt 0 and len(xTitle) lt 35>
					#xTitle# <BR>
					</CFIF>
					
					#qGetMagnum.Firstname# #qGetMagnum.Lastname# ---></font>					</TD>
				</TR>
                                <tr><td align="center">
                		<FONT style="font-size: 10px" FACE="VERDANA"><A HREF="/gallery/whatisfotofestbeijing.cfm"><br />What is <br/>
                		Meeting Place FotoFest Beijing?</A></FONT></td>
                                </tr>
				</TABLE>	
              </TD>		
		</TR>
		</TABLE>	
     </TD>
</CFIF>

<CFIF qGetSantaFe.RecordCount gt 0>
	<TD ALIGN="CENTER"  VALIGN="TOP"  WIDTH="210" >
	
		<TABLE CELLPADDING="5" ID="SantaFe">
		<TR>
			<td align="center"  valign="top" BGCOLOR="#xRollover_Off#"  onMouseOver="SantaFe.style.backgroundColor='#xRollOver_On#'; SantaFe.style.cursor='hand';" onMouseOut="SantaFe.style.backgroundColor='#xRollover_Off#'; SantaFe.style.cursor='pointer';" onClick="location.href='RepresentedArtists/index.cfm'">
				<a href="/gallery/RepresentedArtists/index.cfm"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="2"   style="FONT-SIZE:12px; TEXT-DECORATION:none" id="SantaFe_Title">photo-eye<br>
		        Santa Fe Gallery</font></a><font color="##D4C9AE" size="1" style=" TEXT-DECORATION:none"><sup>&nbsp;</sup></font> </td>
		</TR>
		<TR>
			<TD onMouseOver="SantaFe.style.backgroundColor='#xRollOver_On#'; SantaFe.style.cursor='hand';" onMouseOut="SantaFe.style.backgroundColor='#xRollover_Off#'; SantaFe.style.cursor='pointer';" onClick="location.href='RepresentedArtists/index.cfm'" ALIGN="CENTER">
				<TABLE>
				<TR>
					<TD ALIGN="CENTER" BGCOLOR="#xRollover_Off#">
					<CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
					SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
					FROM GalleryPortfolio
					WHERE (Custnumber = #qGetSantaFe.Custnumber#)
					</cfquery>
					 <!--- <a href="forms/index.cfm?image=#ImageNumber#&id=#qGetSantaFe.Custnumber#&imagePosition=#qGetSantaFe.ImagePosition#&Door=0&Portfolio=#qGetSantaFe.Portfolio#&Gallery=1" target="_top"> --->	
					<a href="RepresentedArtists/index.cfm">		
					<!--- ImageSizer --->									
					<cfset xheight=160>
					<cfset xwidth=200>
					<!---<cfset xheight=200 140>
					<cfset xwidth=300 250>--->
					<cfset xImageAddress="#xRelativePath#\Artists\#qGetSantaFe.Subdirectory#\#qGetSantaFe.Portfolio#\Images_Large\">
					<CFSET xAlt = "&copy; #trim(qGetSantaFe.Firstname)# #trim(qGetSantaFe.Lastname)#">
					<cfset xImage = "Image#qGetSantaFe.ImageNumber#">
					<cfset xImageFormat = "jpg">
					<cfif NOT ListFindNoCase(qGetSantaFe.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
						<cfinclude template="/templates/imagesizercreate.cfm">
						<cfquery name="qUpdate"  datasource="photoeyecom">
							Update GalleryIndividualPhotos
							Set ImageSizeList = '#ListAppend(qGetSantaFe.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
							Where RecordNo = #qGetSantaFe.RecordNo#
						</cfquery>
					</cfif>	
					<img src="/artists/#qGetSantaFe.Subdirectory#/#qGetSantaFe.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a>
					<!--- End ImageSizer --->					</TD>
				</TR>
				<TR>
					<TD ALIGN="CENTER"  CELLPADDING="5">
						<font color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1">
						<CFSET xPortfolioName = qGetSantaFe.PortfolioName>
						<CFSET xTitle = qGetSantaFe.Title>
						
						<CFIF NOT FindNoCase("Portfolio", xPortfolioName) and len(xPortfolioName) gt 0 and len(xPortfolioName) lt 35>
						#xPortfolioName# <BR>
						
						<CFELSEIF NOT FindNoCase("Untitled", xTitle) and len(xTitle) gt 0 and len(xTitle) lt 35>
						#xTitle# <BR>
						</CFIF>						
						 #qGetSantaFe.Firstname# #qGetSantaFe.Lastname#</font>					</TD>
				</TR>
				</TABLE>			</TD>
		</TR>
		</TABLE>	</TD>
</CFIF>

<CFIF qGetShowcase.RecordCount gt 0>
	<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="210">
		<TABLE CELLPADDING="5" ID="Showcase">
		<TR>		
			<td align="center" valign="top"  BGCOLOR="#xRollover_Off#"  onMouseOver="Showcase.style.backgroundColor='#xRollOver_On#'; Showcase.style.cursor='hand';" onMouseOut="Showcase.style.backgroundColor='#xRollover_Off#'; Showcase.style.cursor='pointer';" onClick="location.href='PhotoShowcase/homepagePSNew.cfm'">
				<a href="/gallery/PhotoShowcase/homepagePSNew.cfm"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="2"  style="FONT-SIZE:12px; TEXT-DECORATION:none;" id="Showcase_Title">Photographer's<br> 
			       Showcase<font size="1" style=" TEXT-DECORATION:none"><sup>&reg;</sup></font></font></a></td>
		</TR>
        
		<TR>
            <TD onMouseOver="Showcase.style.backgroundColor='#xRollOver_On#'; Showcase.style.cursor='hand';" onMouseOut="Showcase.style.backgroundColor='#xRollover_Off#'; Showcase.style.cursor='pointer';" onClick="location.href='PhotoShowcase/homepagePSNew.cfm'" ALIGN="CENTER">		
            <!--- Panorama? --->
                <CFQUERY NAME="qGetPanorama"  DATASOURCE="photoeyecom">
                    SELECT Panorama
                    FROM GalleryPortfolio where Custnumber=#qGetShowcase.Custnumber# and SubDirectory = '#qGetShowcase.Portfolio#'
                </CFQUERY>
                
                <CFIF qGetPanorama.Panorama is 1>
                    <CFSET xPan = 1>
                <CFELSE>	
                    <CFSET xPan = 0>
                </CFIF>
            
                <TABLE>
                <TR>
                    <TD ALIGN="CENTER" BGCOLOR="#xRollover_Off#">
                    <CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
                    SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
                    FROM GalleryPortfolio
                    WHERE (Custnumber = #qGetShowcase.Custnumber#)
                    </cfquery>
                    
                            <!---  <a href="forms/index.cfm?image=#ImageNumber#&id=#qGetShowcase.Custnumber#&imagePosition=#qGetShowcase.ImagePosition#&Door=0&Portfolio=#qGetShowcase.Portfolio#&Gallery=2" target="_top"> --->
                    
                        <a href="PhotoShowcase/homepagePSNew.cfm">
                        
                    <CFIF xPan is 1>									
                        <img SRC="http://www.visualserver.com/artists/#qGetShowcase.Subdirectory#/#qGetShowcase.Portfolio#/search.gif" border="0">
                    <CFELSE>
                        <!--- ImageSizer --->	
                        <cfset xheight=160>
                        <cfset xwidth=200>
                        <CFSET xAlt = "&copy; #trim(qGetShowcase.Firstname)# #trim(qGetShowcase.Lastname)#">
                        <cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcase.Subdirectory#\#qGetShowcase.Portfolio#\Images_Large\">
                        <cfset xImage = "Image#qGetShowcase.ImageNumber#">
                        <cfset xImageFormat = "jpg">
                    <cfif NOT ListFindNoCase(qGetShowcase.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
                        <cfinclude template="/templates/imagesizercreate.cfm">
                        <cfquery name="qUpdate"  datasource="photoeyecom">
                            Update GalleryIndividualPhotos
                            Set ImageSizeList = '#ListAppend(qGetShowcase.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
                            Where RecordNo = #qGetShowcase.RecordNo#
                        </cfquery>
                        </cfif>
                        <img src="/artists/#qGetShowcase.Subdirectory#/#qGetShowcase.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#">
                        <!--- End ImageSizer --->
                    </CFIF>
                    </a>
                    <!--- End ImageSizer --->                    </TD>
				</TR>

				<TR>
                	<TD ALIGN="CENTER">
                        <font color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1">
                        <CFSET xPortfolioName = qGetShowcase.PortfolioName>
                        <CFSET xTitle = qGetShowcase.Title>
                        
                        <CFIF NOT FindNoCase("Portfolio", xPortfolioName) and len(xPortfolioName) gt 0 and len(xPortfolioName) lt 35>
                        #xPortfolioName# <BR>
                        
                        <CFELSEIF NOT FindNoCase("Untitled", xTitle) and len(xTitle) gt 0 and len(xTitle) lt 35>
                        #xTitle# <BR>
                        </CFIF>
                        
                        #qGetShowcase.Firstname# #qGetShowcase.Lastname#</font></TD>
           
	

				</TR>
                <tr><td align="center">
                		<FONT style="font-size: 10px" FACE="VERDANA"><A HREF="PhotoShowcase/NewDocumentation/artists/index.html"><br />What is the<br />Photographer's Showcase?</A></FONT></td></tr>
				</TABLE>			</TD>
		</TR>
		</TABLE>	</TD>
        
</CFIF>

<CFIF qGetMagnum.RecordCount gt 0>
	
	<TD VALIGN="TOP"   CELLPADDING="5" ALIGN="center" width="210">
		<TABLE   CELLPADDING="5" ID="Magnum" align="center" >
		<TR>
			<td align="center" valign="top" BGCOLOR="#xRollover_Off#"  onMouseOver="Magnum.style.backgroundColor='#xRollOver_On#'; Magnum.style.cursor='hand';" onMouseOut="Magnum.style.backgroundColor='#xRollover_Off#'; Magnum.style.cursor='pointer';" onClick="location.href='MagnumArtists/homepageMA.cfm'">
			<a href="MagnumArtists/homepageMA.cfm"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="2"  style="FONT-SIZE:12px; TEXT-DECORATION:none;" id="Magnum_Title">Magnum&nbsp;Photos<font size="1" style=" TEXT-DECORATION:none"><sup>&reg;</sup></font> <br> Collectors'&nbsp;Prints</font></a></td>
		</TR>
		<TR>
			<TD onMouseOver="Magnum.style.backgroundColor='#xRollOver_On#'; Magnum.style.cursor='hand';" onMouseOut="Magnum.style.backgroundColor='#xRollover_Off#'; Magnum.style.cursor='pointer';" onClick="location.href='MagnumArtists/homepageMA.cfm'" ALIGN="CENTER">
				<TABLE>
				<TR>
					<TD ALIGN="CENTER" BGCOLOR="#xRollover_Off#"  >
						<CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
						SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
						FROM GalleryPortfolio
						WHERE (Custnumber = #qGetMagnum.Custnumber#)
						</cfquery>
						
								 <!--- <a href="forms/index.cfm?image=#ImageNumber#&id=#qGetMagnum.Custnumber#&imagePosition=#qGetMagnum.ImagePosition#&Door=0&Portfolio=#qGetMagnum.Portfolio#&Gallery=3" target="_top"> --->
						
						<a href="MagnumArtists/homepageMA.cfm">
						
						<!--- ImageSizer --->									
						<cfset xheight=160>
						<cfset xwidth=200>
						<cfset xImageAddress="#xRelativePath#\Artists\#qGetMagnum.Subdirectory#\#qGetMagnum.Portfolio#\Images_Large\">
						<CFSET xAlt = "&copy; #trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#">
						<cfset xImage = "Image#qGetMagnum.ImageNumber#">
						<cfset xImageFormat = "jpg">
						<cfif NOT ListFindNoCase(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
							<cfinclude template="/templates/imagesizercreate.cfm">
							<cfquery name="qUpdate"  datasource="photoeyecom">
								Update GalleryIndividualPhotos
								Set ImageSizeList = '#ListAppend(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
								Where RecordNo = #qGetMagnum.RecordNo#
							</cfquery>
						</cfif>
						
						<img src="/artists/#qGetMagnum.Subdirectory#/#qGetMagnum.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#">
						<!--- End ImageSizer --->					</TD>
				</TR>
				<TR>
					<TD ALIGN="CENTER">
						<font color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1">
						
						<CFSET xPortfolioName = qGetMagnum.PortfolioName>
						<CFSET xTitle = qGetMagnum.Title>
						
						<CFIF NOT FindNoCase("Portfolio", xPortfolioName) and len(xPortfolioName) gt 0 and len(xPortfolioName) lt 35>
						#xPortfolioName# <BR>
						<CFELSEIF NOT FindNoCase("Untitled", xTitle) and len(xTitle) gt 0 and len(xTitle) lt 35>
						#xTitle# <BR>
						</CFIF>
						
						#qGetMagnum.Firstname# #qGetMagnum.Lastname#</font>					</TD>
				</TR>
				</TABLE>			</TD>
		</TR>
		</TABLE>	</TD>
</CFIF>

</tr>
<tr><td height="20" colspan="3"></td>
</tr>
<tr>



</TR></TABLE>
</CFOUTPUT>
			
<CFSET xMenuToShow = "Main">

<CFINCLUDE TEMPLATE="/gallery/Menu.cfm">

<BR>
<DIV ALIGN="CENTER">
<FONT style="font-size: 10px" FACE="VERDANA"><A HREF="/Bookstore/GiftCertificates.cfm">Purchase Gift Certificates</A></FONT>
</DIV>
