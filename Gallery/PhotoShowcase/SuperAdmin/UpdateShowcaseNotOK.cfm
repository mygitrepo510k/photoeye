
<CFQUERY NAME="qUpdateImagesOK" DATASOURCE="photoeyecom">
  UPDATE GALLERYSETUP SET TIER=1, SHOWCASEOK=0, COMPLETE=1 WHERE CUSTNUMBER=#FORM.CUSTNUMBER# 
</CFQUERY>

<!--- <CFQUERY NAME="qUpdateImagesOK" DATASOURCE="photoeyecom">
  SELECT * FROM GALLERYSETUP WHERE CUSTNUMBER=#FORM.CUSTNUMBER# 
</CFQUERY>


<cfoutput query="qUpdateImagesOK">
	#showcaseok# #complete# #custnumber#<br><br>
</cfoutput>
 --->
<CFQUERY NAME="qUpdateImagesOK2" DATASOURCE="photoeyecom">
  UPDATE GALLERYKEYWORDS SET SHOWCASEOK=0 WHERE CUSTNUMBER=#FORM.CUSTNUMBER# AND PORTFOLIO='#FORM.PORTFOLIO#'; 
</CFQUERY>

<!--- <CFQUERY NAME="qUpdateImagesOK2" DATASOURCE="photoeyecom">
  SELECT * FROM GALLERYKEYWORDS WHERE CUSTNUMBER=#FORM.CUSTNUMBER# AND PORTFOLIO='#FORM.PORTFOLIO#'; 
</CFQUERY>

<cfoutput query="qUpdateImagesOK2">
	#showcaseok# #portfolio# #custnumber#<br><br>
</cfoutput> --->

<CFQUERY NAME="qUpdateImagesOK3" DATASOURCE="photoeyecom">
  UPDATE GALLERYPORTFOLIO SET SHOWCASEOK=0, EXHIBITIONOPENED = #NOW()# WHERE CUSTNUMBER=#FORM.CUSTNUMBER# AND SUBDIRECTORY='#FORM.PORTFOLIO#';
</CFQUERY>

<!--- <CFQUERY NAME="qUpdateImagesOK3" DATASOURCE="photoeyecom">
  SELECT * FROM GALLERYPORTFOLIO WHERE CUSTNUMBER=#FORM.CUSTNUMBER# AND SUBDIRECTORY='#FORM.PORTFOLIO#';
</CFQUERY>

<cfoutput query="qUpdateImagesOK3">
	#showcaseok# #exhibitionopened# #custnumber# #portfolio#<br><br>
</cfoutput> --->

<CFQUERY NAME="qUpdateImagesOK4" DATASOURCE="photoeyecom">
  UPDATE GALLERYINDIVIDUALPHOTOS SET SHOWCASEOK=0, COMPLETED=1 WHERE CUSTNUMBER=#FORM.CUSTNUMBER# AND PORTFOLIONAME='#FORM.PORTFOLIO#';
</CFQUERY>


<!--- <CFQUERY NAME="qUpdateImagesOK4" DATASOURCE="photoeyecom">
  SELECT * FROM GALLERYINDIVIDUALPHOTOS WHERE CUSTNUMBER=#FORM.CUSTNUMBER# AND PORTFOLIONAME='#FORM.PORTFOLIO#';
</CFQUERY>

<cfoutput query="qUpdateImagesOk4">
	#showcaseok# #completed# #custnumber# #portfolioname#<br>
</cfoutput> --->

<CFQUERY NAME="qGetArtist" DATASOURCE="photoeyecom">
  SELECT FIRSTNAME, LASTNAME, CUSTNUMBER, EMAIL FROM GALLERYSETUP WHERE CUSTNUMBER=#FORM.CUSTNUMBER#;
</CFQUERY>
	

	
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>photo-eye Photographer's Showcase</title>
</head>


<body bgcolor="#cccc99" link="BLUE" vlink="#000080">
<cfoutput>
	<cfif qGetArtist.recordcount GT 0>
	Removed public access to #FORM.PORTFOLIO# for #qGetArtist.FirstName# #qGetArtist.Lastname#! This Photographer's Showcase portfolio will no longer be exhibited. 

<br><br><br>
<!--- <a href="mailto:#Form.Email#?Subject=Access to setup your portfolio">Email Customer</a> --->

<!--- <cfif form.oktoemail is 1>

<cfinclude template="dynamictostaticArtistsRootName.cfm">
<cfinclude template="emailShowcaseisPublic.cfm">
 
</cfif> --->

	<cfelse>
		Sorry, either the customer number, portfolio, or both were not found!
	</cfif>
</cfoutput>

</body>
</html>
