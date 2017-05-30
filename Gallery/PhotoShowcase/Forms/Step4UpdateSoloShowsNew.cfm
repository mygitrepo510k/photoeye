<!--- First, Save Updates --->
<cfquery name="qGetSoloShows" DATASOURCE="photoeyecom" >
SELECT *
FROM GallerySoloShows WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfquery name="qGetSoloShowsMaxID" DATASOURCE="photoeyecom" >
SELECT  MAX(FieldID) as MaxFieldID
FROM GallerySoloShows WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfset RecordCount = #qGetSoloShows.RecordCount#>
<cfset number=1> 
<cfset VenueNew="Form.Venue00">
<cfset TitleNew="Form.Title00">
<cfset LocationNew="Form.Location00">
<cfset YearNew="Form.Year00">
<cfloop query="qGetSoloShows" startrow="1" endrow="#RecordCount#">
	<cfset Ven =#Replace(VenueNew, "00", Number)#>
	<cfset Tit =#Replace(TitleNew, "00", Number)#>
	<cfset Locat =#Replace(LocationNew, "00", Number)#>
	<cfset Yr =#Replace(YearNew, "00", Number)#>
	<cfset Yr = #Evaluate(Yr)#>
	<cfset Ven = #Evaluate(Ven)#>
	<cfset Tit = #Evaluate(Tit)#>
	<cfset Locat= #Evaluate(Locat)#>
	<CFQUERY NAME="qUpdate"  DATASOURCE="photoeyecom">
  		UPDATE GallerySoloShows
		SET
 	    	Venue = '#Ven#',
			Title = '#Tit#',
			Location = '#Locat#',
			Year = '#Yr#'
 		WHERE CustNumber ='#form.CustNumber#' and FieldID=#number#;
	</CFQUERY>
	<cfset number=number+1>
</cfloop>

<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup
   SET Step4='1'
  WHERE CustNumber = #Form.CustNumber#
</CFQUERY>


<CFIF IsDefined('Form.Add')>

<!---Inserts 4 Rows --->
<cfoutput>
	<cfset RecordCount = #qGetSoloShows.RecordCount#>
	<cfset FieldCounter=#qGetSoloShowsMaxID.MaxFieldID#+1>
	<cfloop index="Count" from="1" to="4" step="1">
		<cfquery name="qGalleryInsert" DATASOURCE="photoeyecom" >
			INSERT INTO GallerySoloShows (Custnumber, FieldID, Venue, Title, Location, Year) VALUES ('#url.custnumber#',#fieldcounter#,'','','','')
		</cfquery>
		<cfset FieldCounter=FieldCounter+1>
	</cfloop>
</cfoutput>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Solo Exhibitions</title>
</head>

<body>
<cfoutput>
<!--- <cfset custnumber=#qGetSoloShows.Custnumber#> --->
<!--- <cfinclude template="DynamictoStaticBio.cfm"> --->
<cfinclude template="Step4SoloShowsURLNew.cfm">
</cfoutput>
</body>
</html>


<CFELSE>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Solo Exhibitions</title>
</head>

<body>
<cfoutput>
<!---All Information has been added! --->
<INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
<!--- <cfinclude template="DynamictoStaticBio.cfm"> --->
<cfinclude template="UpdateSuccessful.cfm">
</cfoutput>
</body>
</html>
</cfif>