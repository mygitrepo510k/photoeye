<cfif #URL.Category1# is ''>
	
<CFQUERY NAME="qGetShowcaseMedium"  DATASOURCE="photoeyecom">
SELECT G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber, 
    P.Subdirectory as Portfolio, D.Medium as Medium
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P 
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND (D.Medium is Null or D.Medium='')
ORDER BY  MediumRandomNo DESC
</cfquery>

<cfelse>

<CFQUERY NAME="qGetShowcaseMedium"  DATASOURCE="photoeyecom">
SELECT G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber, 
    P.Subdirectory as Portfolio, D.Medium as Medium
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P 
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.Medium='#URL.Category1#'
ORDER BY  MediumRandomNo DESC
</cfquery>


</cfif>

		
	<cfset ImageNumber = 1>
	<cfset ImagePosition = 1>
	
	<cfset Mediumx= "x">  	
	<cfset Column = 1>
	<cfset counter=1>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Galleries | Medium </title>
	
	
	<script language="JavaScript">
<!--
function jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</SCRIPT>


<style type="text/css">
SELECT
{
    
    FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif;
    FONT-SIZE: 9px
}
</style> 
	
	
	
	
	
	
	
</head>


<body bgcolor="#333333" text="#FFFFFF" link="Silver" vlink="Gray" alink="Red">
<cfoutput>
<A NAME="TOP"> </A>


<table width="80%" height="36" border="0" align="center" bgcolor="Black">
<tr>

    <td  width="95%" height="51" align="center"><img src="Photoshowcase/SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></td>

</tr>
</table>
<br>
  <div align="center"><font face="verdana, arial, helvetica, sans-serif" size="2" color="##CCCCCC"><b>E 
    X P L O R E&nbsp;&nbsp;&nbsp;&nbsp;P H O T O 
    G R A P H E R S&nbsp;&nbsp;&nbsp;&nbsp;by&nbsp;&nbsp;&nbsp;&nbsp;P R O C E S S
	</b><br>
    <br>
    </font> 
  <img src="../img/Redlinetoc.gif" width="400" height="1" alt="" border="0"><br>
  <img src="Photoshowcase/SharedImages/dot_clear.gif" width="1" height="1"></div>

  
  


			
			
		<table border="0" cellspacing="6" cellpadding="5" align="center">
		
		<tr>	
			
			<td colspan="5" width=565  align="center">
			<form>
<select name="Category1" onChange="jumpMenu('parent.frames[\'Right\']',this,0)">
                <option value="##TOP" selected >Select&nbsp;Another&nbsp;Process&nbsp;</option>
				<!--- <option value="newCalendars.html" >Calendars</option> --->
				<option value="MoreMedium.cfm?Category1=Albumen Print" >Albumen Print</option>
				<option value="MoreMedium.cfm?Category1=Carbon Print" >Carbon Print</option>
<!--- 				<option value="MoreMedium.cfm?Category1=Black & White" >Black & White</option> --->
				<option value="MoreMedium.cfm?Category1=Chromogenic Print" >Chromogenic Print</option>
				<option value="MoreMedium.cfm?Category1=Cibachrome Print" >Cibachrome Print</option>
				<option value="MoreMedium.cfm?Category1=Cyanotype Print" >Cyanotype Print</option>
<!--- 				<option value="MoreMedium.cfm?Category1=Color" >Color</option> --->
				<option value="MoreMedium.cfm?Category1=Daguerreotype" >Daguerreotype</option>
				<option value="MoreMedium.cfm?Category1=Gelatin-Silver Print" >Gelatin-Silver Print</option>
				<option value="MoreMedium.cfm?Category1=Toned Gelatin-Silver Print" >Toned Gelatin-Silver Print</option>
				<option value="MoreMedium.cfm?Category1=Gicl&eacute;e Print" >Gicl&eacute;e Print </option>
				<option value="MoreMedium.cfm?Category1=Iris Print" >Iris Print </option>
				<option value="MoreMedium.cfm?Category1=Mixed Media" >Mixed Media</option>
				<option value="MoreMedium.cfm?Category1=Montage" >Montage</option>
				<option value="MoreMedium.cfm?Category1=Photocollage" >Photocollage</option>
				<option value="MoreMedium.cfm?Category1=Photogram" >Photogram</option>
				<option value="MoreMedium.cfm?Category1=Photogravure" >Photogravure</option><br>
				<option value="MoreMedium.cfm?Category1=Platinum/Palladium Print" >Platinum/Palladium Print</option>
				<option value="MoreMedium.cfm?Category1=Polaroid" >Polaroid</option>
				<option value="MoreMedium.cfm?Category1=TinType" >TinType</option><br>
				<option value="MoreMedium.cfm?Category1=Contact Print" >Contact Print</option><br>
				<option value="MoreMedium.cfm?Category1=Other Medium" >Other  Processes</option><br>
<!--- 				<option value="MoreMedium.cfm?Category1=" >Undefined&nbsp;Process</option> --->
	            </select></form>
    		</td>
		</tr>
  
  		<tr>
			<cfif #URL.Category1# is ''>
						<td colspan="5" width=565  bgcolor="Black"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver"><b>Undefined Process</b>
			<cfelse>
			<td colspan="5" width=565  bgcolor="Black"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver"><b>#qGetShowcaseMedium.Medium#</b>
			</td>
			
			</cfif>
		</tr>
		
   	<cfloop query="qGetShowcaseMedium">
	 <cfif Column is 1>
   <tr>
    <td width="100" height="77"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
	
	<a href="#qGetShowcaseMedium.Gallery#/Artists/#qGetShowcaseMedium.Subdirectory#/#qGetShowcaseMedium.Portfolio#/index.cfm?id=#qGetShowcaseMedium.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=4&Portfolio=#qGetShowcaseMedium.Portfolio#" target="_parent"><font size="1">
	#qGetShowcaseMedium.FirstName# #qGetShowcaseMedium.LastName# </font></a><font size="1"><br><br>
      #qGetShowcaseMedium.ImageQty# Images</font></b></font></td>  
 	<td width="73">
		<a href="#qGetShowcaseMedium.Gallery#/Artists/#qGetShowcaseMedium.Subdirectory#/#qGetShowcaseMedium.Portfolio#/index.cfm?id=#qGetShowcaseMedium.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=4&Portfolio=#qGetShowcaseMedium.Portfolio#" target="_parent">
		<img src="#qGetShowcaseMedium.Gallery#/Artists/#qGetShowcaseMedium.Subdirectory#/#qGetShowcaseMedium.Portfolio#/Images_thumbs/Image1.jpg" border="0" alt=""></a>
	</td>

	<cfset Column = 2>
	<cfset counter=counter+1>
	
	<cfelseif Column is 2>
	 
    	<td width="100" height="77"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
	<a href="#qGetShowcaseMedium.Gallery#/Artists/#qGetShowcaseMedium.Subdirectory#/#qGetShowcaseMedium.Portfolio#/index.cfm?id=#qGetShowcaseMedium.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=4&Portfolio=#qGetShowcaseMedium.Portfolio#" target="_parent"><font size="1">
	#qGetShowcaseMedium.FirstName# #qGetShowcaseMedium.LastName# </font></a><font size="1"><br><br>
     #qGetShowcaseMedium.ImageQty# Images</font></b></font></td>  
 	<td width="73">
			<a href="#qGetShowcaseMedium.Gallery#/Artists/#qGetShowcaseMedium.Subdirectory#/#qGetShowcaseMedium.Portfolio#/index.cfm?id=#qGetShowcaseMedium.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=4&Portfolio=#qGetShowcaseMedium.Portfolio#" target="_parent">
			<img src="#qGetShowcaseMedium.Gallery#/Artists/#qGetShowcaseMedium.Subdirectory#/#qGetShowcaseMedium.Portfolio#/Images_thumbs/Image1.jpg" border="0" alt=""></a>
		</td>
		<cfset Column =1 >	
		<cfset counter=counter+1>
	</tr>
  	</cfif>
	</cfloop>


  
  </table>
  </cfoutput>
</body>
</html>
