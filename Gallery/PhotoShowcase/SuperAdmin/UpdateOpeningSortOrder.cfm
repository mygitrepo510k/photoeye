 <!--- Run this program to update the sort order after a portfolio opens --->
 <!--- This will make the sort order right on the various gallery pages --->
 
 <CFQUERY NAME="qGetPortfolios"  DATASOURCE="photoeyecom">
 SELECT * FROM GALLERYPORTFOLIO ORDER BY EXHIBITIONOPENED
  </cfquery>
  
  <cfset nSortOrder=1>

  
  <CFOUTPUT QUERY='qGetPortfolios'> 
   
   <CFQUERY NAME="qUpdateOpenedSortOrder"  DATASOURCE="photoeyecom">
UPDATE GALLERYPORTFOLIO SET OpeningSortOrder=#nSortOrder# WHERE Autoid=#qGetPortfolios.AutoId#
  </cfquery>
  
  <cfset nSortOrder=nSortOrder+1>
	
  </cfoutput>	