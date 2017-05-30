<cfoutput> 

	
		<!--- Get artist --->
	<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
		SELECT *
		FROM GallerySetup 
		WHERE custnumber = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#url.id#" maxLength="6" />
	</CFQUERY>


<!--- oncontextmenu="return false" --->

<body bgcolor="##f7f8f9" marginheight="0" topmargin="0" vspace="0"  
marginwidth="0" leftmargin="0" hspace="0" style="margin:0; padding:0; " onload='<cfif xloading EQ 1>LoadingFunc();</cfif><cfif xportfolios EQ 1>sizeImgContainers();</cfif>'>	

<!--- Disable right click  --->
<script language="javascript">
document.onmousedown=disableclick;
status="&copy; Nick Brandt. All Rights Reserved.";
Function disableclick(event)
{
  if(event.button==2)
   {
     alert(status);
     return false;    
   }
}
</script>

	<div id='page_container'>
 
				  
		  <div id='header_container' align="left">
	  	 
				<span style="display:block;"><a href="index.cfm" class="title"><img src="/gallery/photo-eye-logo.png" style="vertical-align:middle; border:0; height:45px; padding-top:10px;"><span style="vertical-align:middle; margin-top:80px; color:##999; font-size:19px; letter-spacing:1px;">GALLERY</a> &nbsp; <span style="font-size:12px; color:##999; letter-spacing:1px;">505.988.5152 x202 &nbsp; <a href="mailto:gallery@photoeye.com?Subject=Nick Brandt Release" style="color:##999">GALLERY@PHOTOEYE.COM</a> &nbsp; &nbsp; NICK BRANDT: SEPTEMBER 2013 RELEASE</span></span>


   
	       	
		 </div> <!--- header_container --->
		 

</cfoutput>
