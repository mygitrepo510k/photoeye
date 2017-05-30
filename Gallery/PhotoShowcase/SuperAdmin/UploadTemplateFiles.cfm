
<!--- <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="PhotoEyeBookStoreSQL">
  SELECT SubDirectory, Gallery, Custnumber
  FROM GallerySetup where Upper(Gallery)='REPRESENTEDARTISTS' or Upper(Gallery)='PHOTOSHOWCASE' or Upper(Gallery)='MAGNUMARTISTS' order by Gallery, Subdirectory

</CFQUERY> --->


<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
SELECT G.SubDirectory as Name, G.Gallery, G.Custnumber, 
    P.Subdirectory as Portfolio
FROM GallerySetup AS G, GalleryPortfolio AS P
WHERE (UPPER(G.Gallery) = 'REPRESENTEDARTISTS' OR
    UPPER(G.Gallery) = 'PHOTOSHOWCASE' OR
    UPPER(G.Gallery) = 'MAGNUMARTISTS') AND 
    P.Custnumber = G.Custnumber
ORDER BY G.Gallery, g.custnumber, p.Subdirectory

</CFQUERY>

<!--- or Upper(Gallery)='REPRESENTEDARTISTS'  --->
<!--- <CFQUERY NAME="qGetPortfolio"  DATASOURCE="PhotoEyeBookStoreSQL">
  SELECT SubDirectory
  FROM GalleryPortfolio
  WHERE Upper(SubDirectory)='PORTFOLIO1' 

</CFQUERY> --->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase</title>
</head>

<body>

<body bgcolor="gray" link="#000080" vlink="#000080">

<center>
<p align="center">


<cfloop query="qGetShowcaseSetupInfo"> 


<cfif #form.whichfile# is "Pages_Middle">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\pages_middle\"      
nameconflict="OVERWRITE"> 

<cfelseif #form.whichfile# is "HomePage.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\"      
nameconflict="OVERWRITE">  


<cfelseif #form.whichfile# is "index.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\"      
nameconflict="OVERWRITE"> 

<cfelseif #form.whichfile# is "index640.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\"      
nameconflict="OVERWRITE"> 

<cfelseif #form.whichfile# is "Pages_Middle640">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\pages_middle640\"      
nameconflict="OVERWRITE"> 

 

<cfelseif #form.whichfile# is "Pages_Enlarge">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\pages_Enlarge\"      
nameconflict="OVERWRITE">



<cfelseif #form.whichfile# is "Pages_Enlarge640">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\Pages_Enlarge640\"      
nameconflict="OVERWRITE">



<cfelseif #form.whichfile# is "Pages_MaxEnlarge">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\Pages_MaxEnlarge\"      
nameconflict="OVERWRITE">



<cfelseif #form.whichfile# is "Rolloverimages">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\Rolloverimages\"      
nameconflict="OVERWRITE">


<cfelseif #form.whichfile# is "scroll3.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\"      
nameconflict="OVERWRITE">

<cfelseif #form.whichfile# is "scroll640.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\"      
nameconflict="OVERWRITE">


<cfelseif #form.whichfile# is "header1.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\"      
nameconflict="OVERWRITE">

<cfelseif #form.whichfile# is "header640.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\"      
nameconflict="OVERWRITE">

<cfelseif #form.whichfile# is "left.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\"      
nameconflict="OVERWRITE">

<cfelseif #form.whichfile# is "bio.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\"      
nameconflict="OVERWRITE">

<cfelseif #form.whichfile# is "books.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\"      
nameconflict="OVERWRITE">

<cfelseif #form.whichfile# is "bottom.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\"      
nameconflict="OVERWRITE">


<cfelse>
<cfoutput>
<!---Artist Root---></cfoutput>
<cffile action="UPLOAD" filefield="filename" 
destination="#xServerPath#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Name#\#qGetShowcaseSetupInfo.Portfolio#\"      
nameconflict="OVERWRITE">

</cfif>


</cfloop>

<br><br>
<font face="Verdana,Geneva,Arial,Helvetica,sans-serif" color="Silver" size="2">

<cfloop query="qGetShowcaseSetupInfo"> 
<!--- <cfset filename="indexframe.cfm"> --->
<cfoutput>
#qGetShowcaseSetupInfo.Name# #qGetShowcaseSetupInfo.gallery# #qGetShowcaseSetupInfo.custnumber# #qGetShowcaseSetupInfo.Portfolio# <br><br>
</cfoutput>

</cfloop>

Upload Successful!<br> 
 <br><br><br>

 </font>
 <br>
</form>

</p>
</center>


</body>
</html>
