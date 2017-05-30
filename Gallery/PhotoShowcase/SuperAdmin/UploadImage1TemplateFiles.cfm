

<!--- <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT SubDirectory, Gallery
  FROM GallerySetup where Upper(Gallery)='PHOTOSHOWCASE' or Upper(Gallery)='MAGNUMARTISTS' or Upper(Gallery)='REPRESENTEDARTISTS' order by Gallery, Subdirectory

</CFQUERY> --->

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT SubDirectory, Gallery
  FROM GallerySetup where  Upper(Gallery)='MAGNUMARTISTS' 
</CFQUERY> 

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
destination="e:\http\photoeye\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.subDirectory#\Portfolio1\pages_middle\"      
nameconflict="OVERWRITE"> 
 
<cfelseif #form.whichfile# is "Pages_Middle640">

<cffile action="UPLOAD" filefield="filename" 
destination="e:\http\photoeye\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.subDirectory#\Portfolio1\pages_middle640\"      
nameconflict="OVERWRITE"> 

<cfelseif #form.whichfile# is "Header1.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="e:\http\photoeye\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.subDirectory#\Portfolio1\"      
nameconflict="OVERWRITE"> 

<cfelseif #form.whichfile# is "Header640.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="e:\http\photoeye\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.subDirectory#\Portfolio1\"      
nameconflict="OVERWRITE">

<cfelseif #form.whichfile# is "Index.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="e:\http\photoeye\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.subDirectory#\Portfolio1\"      
nameconflict="OVERWRITE"> 

<cfelseif #form.whichfile# is "Index640.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="e:\http\photoeye\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.subDirectory#\Portfolio1\"      
nameconflict="OVERWRITE">

<cfelseif #form.whichfile# is "Scroll3.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="e:\http\photoeye\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.subDirectory#\Portfolio1\"      
nameconflict="OVERWRITE">

<cfelseif #form.whichfile# is "Scroll640.cfm">

<cffile action="UPLOAD" filefield="filename" 
destination="e:\http\photoeye\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.subDirectory#\Portfolio1\"      
nameconflict="OVERWRITE">

<cfelse>

<!---Artist Root--->
<cffile action="UPLOAD" filefield="filename" 
destination="e:\http\photoeye\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.subDirectory#\"      
nameconflict="OVERWRITE">

</cfif>

</cfloop>

<br><br>
<font face="Verdana,Geneva,Arial,Helvetica,sans-serif" color="Silver" size="2">

<cfloop query="qGetShowcaseSetupInfo"> 
<!--- <cfset filename="indexframe.cfm"> --->
<cfoutput>
#subdirectory#<br>
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
