<!--- First, Save Updates --->
<cfquery name="qGetMonographs" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryFavoriteBooks WHERE Custnumber = '#form.CustNumber#' and Type='Monographs';
</cfquery>


<cfquery name="qGetTechnical" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryFavoriteBooks WHERE Custnumber = '#form.CustNumber#' and Type='Technical';
</cfquery>

<!--- Update Favorite Monographs --->
<cfset RecordCount = #qGetMonographs.RecordCount#>
<cfset number=1> 
<cfset TitleNew="Form.Title00">
<cfset AuthorNew="Form.Authors00">
<cfset CatalogNew="Form.Catalog00">
<cfloop query="qGetMonographs" startrow="1" endrow="#RecordCount#">
	<cfset Tit =#Replace(TitleNew, "00", Number)#>
	<cfset Auth =#Replace(AuthorNew, "00", Number)#>
	<cfset Cat =#Replace(CatalogNew, "00", Number)#>
	<CFQUERY NAME="qUpdate"  DATASOURCE="photoeyecom">
  		UPDATE GalleryFavoriteBooks
		SET
			Title = '#Evaluate(Tit)#',
			Authors = '#Evaluate(Auth)#',
			CatNum = '#Evaluate(Cat)#' 		
 		WHERE CustNumber ='#form.CustNumber#' and FieldID=#number# and Type='Monographs';
	</CFQUERY>
	<cfset number=number+1>
</cfloop>

<!--- Now Update Favorite Technical --->
<cfset RecordCount = #qGetTechnical.RecordCount#>
<cfset number=1> 
<cfset TitleNew="Form.TitleT00">
<cfset AuthorNew="Form.AuthorsT00">
<cfset CatalogNew="Form.CatalogT00">
<cfloop query="qGetTechnical" startrow="1" endrow="#RecordCount#">
	<cfset Tit =#Replace(TitleNew, "00", Number)#>
	<cfset Auth =#Replace(AuthorNew, "00", Number)#>
	<cfset Cat =#Replace(CatalogNew, "00", Number)#>
	<CFQUERY NAME="qUpdate"  DATASOURCE="photoeyecom">
  		UPDATE GalleryFavoriteBooks
		SET
			Title = '#Evaluate(Tit)#',
			Authors = '#Evaluate(Auth)#',
			CatNum = '#Evaluate(Cat)#' 		
 		WHERE CustNumber ='#form.CustNumber#' and FieldID=#number# and Type='Technical';
	</CFQUERY>
	<cfset number=number+1>
</cfloop>


<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup
   SET Step10='1'
  WHERE CustNumber = '#Form.CustNumber#'
</CFQUERY>


<CFIF IsDefined('Form.Add')>

<!---Inserts 4 Rows --->
<!--- Note this is not currently being used--->
<cfoutput>
	<cfset RecordCount = #qGetFavoriteBooks.RecordCount#>
	<cfset FieldCounter=RecordCount+1>
	<cfloop index="Count" from="1" to="4" step="1">
		<cfquery name="qGalleryInsert" DATASOURCE="photoeyecom" >
			INSERT INTO GalleryFavoriteBooks (Custnumber, FieldID, Title, Author, Publisher, City, Year, Catalog) VALUES ('#custnumber#',#fieldcounter#,'','','','','','')
			</cfquery>
		<cfset FieldCounter=FieldCounter+1>
	</cfloop>
</cfoutput>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Recommended Books</title>
</head>

<body>
<cfoutput>
<!--- <cfset custnumber=#qGetFavoriteBooks.Custnumber#> --->
<!--- <cfinclude template="DynamictoStaticBooks.cfm"> --->
<cfinclude template="Step9RecommendedBooksURLNew.cfm">
</cfoutput>
</body>
</html>


<CFELSE>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Recommended Books</title>
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