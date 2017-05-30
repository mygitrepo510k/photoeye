<CFQUERY NAME="qUpdatePhotographersSetup2Info"  DATASOURCE="photoeyecom">
  UPDATE GalleryArtistStatements
   SET StatementA = '#Form.StatementA#',
    StatementP = '#Form.StatementP#'
  WHERE CustNumber = '#Form.CustNumber#'
</CFQUERY>

<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup
   SET Step8='1'
  WHERE CustNumber = #Form.CustNumber#
</CFQUERY>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Artist Statements</title>
</head>

<body>
<cfoutput>

<!---All Information has been added! --->
<INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
<!--- <cfinclude template="DynamictoStaticStatement.cfm"> --->
<cfinclude template="UpdateSuccessful.cfm">
</cfoutput>
</body>
</html>