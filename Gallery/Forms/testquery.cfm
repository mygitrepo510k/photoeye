<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
SELECT     TOP 10 G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber AS Custnumber, 
                      I.ImageNumber AS Imagenumber, I.ImagePosition AS ImagePosition, I.GeneralRandomNo AS GeneralRandomNo
FROM         GallerySetup G INNER JOIN
                      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber
WHERE     (I.GeneralRandomNo > 0) AND (I.Selected = 1)
ORDER BY I.GeneralRandomNo
</cfquery>
<cfoutput>
#qGetShowcaseSetupInfo.RecordCount#
</cfoutput>
</body>
</html>
