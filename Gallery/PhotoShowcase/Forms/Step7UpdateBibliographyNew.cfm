<!--- First, Save Updates --->
<cfquery name="qGetSetup" DATASOURCE="photoeyecom" >
SELECT *
FROM GallerySetup WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfquery name="qGetBibliography" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryBibliography WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfquery name="qGetBibliographyMaxID" DATASOURCE="photoeyecom" >
SELECT MAX(FieldID) as MaxFieldID
FROM GalleryBibliography WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfset RecordCount = #qGetBibliography.RecordCount#>
<cfset number=1> 
<cfset CityNew="Form.City00">
<cfset TitleNew="Form.Title00">
<cfset PublisherNew="Form.Publisher00">
<cfset YearNew="Form.Year00">
<cfset AuthorNew="Form.Author00">
<cfset CatalogNew="Form.Catalog00">
<cfloop query="qGetBibliography" startrow="1" endrow="#RecordCount#">
	<cfset Ven =#Replace(CityNew, "00", Number)#>
	<cfset Tit =#Replace(TitleNew, "00", Number)#>
	<cfset Locat =#Replace(PublisherNew, "00", Number)#>
	<cfset Yr =#Replace(YearNew, "00", Number)#>
	<cfset Auth =#Replace(AuthorNew, "00", Number)#>
	<cfset Cat =#Replace(CatalogNew, "00", Number)#>
	
	<cfset Ven =#Evaluate(Ven)#>
	<cfset Tit =#Evaluate(Tit)#>
	<cfset Locat =#Evaluate(Locat)#>
	<cfset Yr =#Evaluate(Yr)#>
	<cfset Auth =#Evaluate(Auth)#>
	<cfset Cat =#Evaluate(Cat)#>
	
	
	<CFQUERY NAME="qUpdate"  DATASOURCE="photoeyecom">
  		UPDATE GalleryBibliography
		SET
 	    	City = '#Ven#',
			Title = '#Tit#',
			Publisher = '#Locat#',
			Year = '#Yr#',
			Author = '#Auth#',
			Catalog = '#Cat#' 		
 		WHERE CustNumber ='#form.CustNumber#' and FieldID=#number#;
	</CFQUERY>
	<cfset number=number+1>
</cfloop>

<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup
   SET Step7='1'
  WHERE CustNumber = #Form.CustNumber#
</CFQUERY>


<CFIF IsDefined('Form.Add')>

<!---Inserts 4 Rows --->
<cfoutput>
	<cfset RecordCount = #qGetBibliography.RecordCount#>
	<cfset FieldCounter=#qGetBibliographyMaxID.MaxFieldID#+1>
	<cfloop index="Count" from="1" to="4" step="1">
		<cfquery name="qGalleryInsert" DATASOURCE="photoeyecom" >
			INSERT INTO GalleryBibliography (Custnumber, FieldID, Title, Author, Publisher, City, Year, Catalog) VALUES ('#custnumber#',#fieldcounter#,'','','','','','')
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
<!--- <cfset custnumber=#qGetBibliography.Custnumber#> --->
<!--- <cfinclude template="DynamictoStaticBooks.cfm"> --->
<cfinclude template="Step7BibliographyURLNew.cfm">
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
<!--- <cfinclude template="DynamictoStaticBooks.cfm"> --->
<cfinclude template="UpdateSuccessful.cfm">
</cfoutput>
</body>
</html>
</cfif>