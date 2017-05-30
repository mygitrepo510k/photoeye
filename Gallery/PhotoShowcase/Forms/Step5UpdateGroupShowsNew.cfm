<!--- First, Save Updates --->
<cfquery name="qGetGroupShows" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryGroupShows WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfquery name="qGetGroupShowsMaxID" DATASOURCE="photoeyecom" >
SELECT  MAX(FieldID) as MaxFieldID
FROM GalleryGroupShows WHERE Custnumber = '#form.CustNumber#';
</cfquery>
 
<cfoutput>

</cfoutput>

<cfset RecordCount = #qGetGroupShows.RecordCount#>
<cfset number=1> 
<cfset VenueNew="Form.Venue00">
<cfset TitleNew="Form.Title00">
<cfset LocationNew="Form.Location00">
<cfset YearNew="Form.Year00">
<cfloop query="qGetGroupShows" startrow="1" endrow="#RecordCount#">
	<cfset Ven =#Replace(VenueNew, "00", Number)#>
	<cfset Tit =#Replace(TitleNew, "00", Number)#>
	<cfset Locat =#Replace(LocationNew, "00", Number)#>
	<cfset Yr =#Replace(YearNew, "00", Number)#>
	<cfset Yr = #Evaluate(Yr)#>
	<cfset Ven = #Evaluate(Ven)#>
	<cfset Tit = #Evaluate(Tit)#>
	<cfset Locat = #Evaluate(Locat)#>	
	<CFQUERY NAME="qUpdate"  DATASOURCE="photoeyecom">
  		UPDATE GalleryGroupShows
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
   SET Step5='1'
  WHERE CustNumber = #Form.CustNumber#
</CFQUERY>


<CFIF IsDefined('Form.Add')>

<!---Inserts 4 Rows --->
<cfoutput>
	<cfset RecordCount = #qGetGroupShows.RecordCount#>
	<cfset FieldCounter=#qGetGroupShowsMaxID.MaxFieldID#+1>
	<cfloop index="Count" from="1" to="4" step="1">
		<cfquery name="qGalleryInsert" DATASOURCE="photoeyecom" >
			INSERT INTO GalleryGroupShows (Custnumber, FieldID, Venue, Title, Location, Year) VALUES ('#url.custnumber#',#fieldcounter#,'','','','')
		</cfquery>
		<cfset FieldCounter=FieldCounter+1>
	</cfloop>
</cfoutput>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Group Exhibitions</title>
</head>

<body>
<cfoutput>
<!--- <cfset custnumber=#qGetGroupShows.Custnumber#> --->
<!--- <cfinclude template="DynamictoStaticBio.cfm"> --->
<cfinclude template="Step5GroupShowsURLNew.cfm">
</cfoutput>
</body>
</html>


<CFELSE>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Group Exhibitions</title>
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