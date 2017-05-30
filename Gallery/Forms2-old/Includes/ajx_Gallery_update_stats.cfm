<cfscript>
/**
* Cleans string of potential sql injection.
* 
* @param string      String to modify. (Required)
* @return Returns a string. 
*/
function SQLclean(string) {
var sqlList = "-- ,'";
var replacementList = "#chr(38)##chr(35)##chr(52)##chr(53)##chr(59)##chr(38)##chr(35)##chr(52)##chr(53)##chr(59)# , #chr(38)##chr(35)##chr(51)##chr(57)##chr(59)#";

return trim(replaceList( string , sqlList , replacementList ));
}

url.id = SQLclean(url.id);
url.image = SQLclean(url.image);
url.portfolio = SQLclean(url.portfolio);

</cfscript>
<!---Update Stats--->
<!---If Record doesn't Exist, Create it!--->
<CFQUERY NAME="qStats"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryStats where custnumber='#url.id#' AND ImageNumber='#url.image#' AND Portfolio='#url.portfolio#'
</CFQUERY>

<CFIF #qStats.recordcount# is 0>

<CFQUERY NAME="qStatsInsert"  DATASOURCE="photoeyecom">
  INSERT INTO GALLERYSTATS 
		(Custnumber, ImageNumber, Portfolio)
				VALUES (#url.id#, #url.image#, '#url.portfolio#') 
</CFQUERY>

</cfif>

<cfset month=MONTH(#Now()#)>


<CFQUERY NAME="UpdateStats" DATASOURCE="photoeyecom">
UPDATE GALLERYSTATS
SET Imagenumber=#url.image#,
Page=3,
PV_Total=PV_Total+1,
PV_YTD=PV_YTD+1,
Hits_Total=Hits_Total+2,
Hits_YTD=Hits_YTD+2
WHERE custnumber=#url.id# AND ImageNumber='#url.image#' AND Portfolio='#url.portfolio#'
</cfquery>