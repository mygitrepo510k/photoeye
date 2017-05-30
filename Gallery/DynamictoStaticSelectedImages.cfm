

<!--- <!--- get the SelectedImages.cfm page --->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/SelectedImages.cfm?"

path="d:\html\users\cfxa905\photoeyecom\html\gallery\" file="temp.txt"

METHOD="Get">

</cfhttp>

<!--- read the page into a variable named contents--->
<cffile action="read"
file="d:\html\users\cfxa905\photoeyecom\html\gallery\temp.txt" variable="contents">


<!--- write the page --->
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\SelectedImages.html" 
output="#contents#" addnewline="Yes">  --->

 
<!--- Write Pages --->
<!--- <cfquery name="qGetRecordCount" DATASOURCE="photoeyecom">
SELECT generalrandomno from galleryIndividualPhotos
</cfquery>

<cfset ceiling=#qGetRecordCount.recordcount#/20> --->
bypass
<!--- 
<cfset counter=1>
<cfset additional=1>
<cfset additional2=20>
<cfset lastbeginNo=0>
<cfloop index="WritePages" from="1" to="10" step="1">

<!--- #qGetRecordCount.recordcount# --->
	<!--- Get next random number--->
	<cfloop index="GetNewBeginingRandomNumber" from="#additional#" to="#additional2#" step="1"><!--- #Additional# --->
	<CFQUERY NAME="qGetNextBeginningRandomNumber"  DATASOURCE="photoeyecom">
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND I.GeneralRandomNo>#lastBeginNo# AND I.Selected=1 and NOT (I.notavailable=4 and I.imagenumber>1)
ORDER BY I.GeneralRandomNo
</cfquery>
<cfset lastBeginNo = qGetNextBeginningRandomNumber.GeneralRandomNo> 
<cfset additional=additional+20>
<cfset additional2=additional+20>
	</cfloop>

<cfhttp
URL="#xCfhttpPath#/gallery/SelectedImages.cfm?page=#counter#&LastBeginNo=#lastBeginNo#&additional=#additional#&NewBegin=#lastBeginNo#"

path="#xServerPath#\gallery\" file="temp.txt"

METHOD="Get">

</cfhttp>


<!--- read the page into a variable named contents--->
<cffile action="read"
file="#xServerPath#\gallery\temp.txt" variable="contents">


<!--- write the page --->
<cffile action="WRITE" file="#xServerPath#\gallery\SelectedImages#counter#.html" 
output="#contents#" addnewline="Yes"> 

<cfset counter=counter+1>

</cfloop>
 --->