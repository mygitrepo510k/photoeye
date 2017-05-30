<!--- First, Save Updates --->
<cfquery name="qGetEducation" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryEducation WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfquery name="qGetEducationMaxID" DATASOURCE="photoeyecom" >
SELECT MAX(FieldID) as MaxFieldID
FROM GalleryEducation WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfoutput>

<cfset RecordCount = #qGetEducation.RecordCount#>
<cfset number=1> 

<cfset SchoolNew = "form.School00">
<cfset YearBeginNew = "form.YearBegin00">
<cfset YearEndNew = "form.YearEnd00">
<cfset DegreeNew = "form.Degree00">
<cfset Teacher1New = "form.Teacher100">
<cfset Teacher2New = "form.Teacher200">
<cfset Teacher3New = "form.Teacher300">
<!--- !DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>
#recordcount#
 <cfloop query="qGetEducation" startrow="1" endrow="#RecordCount#">
	<cfset Schoolx = #Replace(SchoolNew, "00", Number)#>
	<!--- <cfset School = '#Evaluate(School)#'> --->
	#Schoolx# '#Evaluate(Schoolx)#'
	<cfset number=number+1>
</cfloop>
</cfoutput>


<body>
</body>
</html> --->



<!--- #RecordCount# --->
 <cfloop query="qGetEducation" startrow="1" endrow="#RecordCount#">
	<cfset Schoolx =#Replace(SchoolNew, "00", Number)#>
	<cfset YearBeginx =#Replace(YearBeginNew, "00", Number)#>
	<cfset YearEndx =#Replace(YearEndNew, "00", Number)#>
	<cfset Degreex =#Replace(DegreeNew, "00", Number)#>
	<cfset Teacher1x =#Replace(Teacher1New, "00", Number)#>
	<cfset Teacher2x =#Replace(Teacher2New, "00", Number)#>
	<cfset Teacher3x =#Replace(Teacher3New, "00", Number)#>
	
	<!--- Replace any Double quotes with HTML Quotes --->
	<cfset Quote=Chr(34)>
	<cfset Schoolx =#Evaluate(Schoolx)#>
	<cfset Schoolx=Replace(Schoolx,Quote,"&quot;","ALL")>
	<cfset YearBeginx =#Evaluate(YearBeginx)#>
	<cfset YearBeginx=Replace(YearBeginx,Quote,"&quot;","ALL")>
	<cfset YearEndx =#Evaluate(YearEndx)#>
	<cfset YearEndx=Replace(YearEndx,Quote,"&quot;","ALL")>
	<cfset Degreex =#Evaluate(Degreex)#>
	<cfset Degreex=Replace(Degreex,Quote,"&quot;","ALL")>
	<cfset Teacher1x =#Evaluate(Teacher1x)#>
	<cfset Teacher1x=Replace(Teacher1x,Quote,"&quot;","ALL")>
	<cfset Teacher2x =#Evaluate(Teacher2x)#>
	<cfset Teacher2x=Replace(Teacher2x,Quote,"&quot;","ALL")>
	<cfset Teacher3x =#Evaluate(Teacher3x)#>
	<cfset Teacher3x=Replace(Teacher3x,Quote,"&quot;","ALL")>
	
	<CFQUERY NAME="qUpdateEducation"  DATASOURCE="photoeyecom">
  		UPDATE GalleryEducation
		SET
 	    School = '#Schoolx#',
		YearBegin = '#YearBeginx#',
		YearEnd = '#YearEndx#',	
		Degree = '#Degreex#',	
		Teacher1 = '#Teacher1x#',	
		Teacher2 = '#Teacher2x#',	
		Teacher3 = '#Teacher3x#'
 		WHERE CustNumber ='#form.CustNumber#' and FieldID=#number#;
	</CFQUERY>
	<cfset number=number+1>
</cfloop>

<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup
   SET Step2='1'
  WHERE CustNumber = #form.custnumber#
</CFQUERY>


<!--- ,
    Birth = '#form.Birth#',
    BirthL = '#form.BirthL#' --->

</cfoutput>

<CFIF IsDefined('Form.Add')>

<!---Inserts 4 More Rows --->
<cfoutput>
	<cfset RecordCount = #qGetEducation.RecordCount#>
	<cfset FieldCounter=#qGetEducationMaxID.MaxFieldID#+1>
	<cfloop index="Count" from="1" to="4" step="1">
		<cfquery name="qGalleryEducationInsert" DATASOURCE="photoeyecom" >
				INSERT INTO GalleryEducation (Custnumber, FieldID, School, YearBegin, YearEnd, Degree, Teacher1, Teacher2, Teacher3) VALUES ('#custnumber#',#fieldcounter#,'','','','','','','')
		</cfquery>
		<cfset FieldCounter=FieldCounter+1>
	</cfloop>
</cfoutput>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Education Setup</title>
</head>

<body>
<cfoutput>
<!--- <cfset custnumber=#qGetSoloShows.Custnumber#> --->
<!--- <cfinclude template="DynamictoStaticBio.cfm"> --->
<cfinclude template="Step2Education.cfm">
</cfoutput> 
</body>
</html>


<CFELSE>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Education Setup</title>
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