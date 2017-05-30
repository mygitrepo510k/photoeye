
<!--- start total crap solution to div nesting problem --->
<cfif CGI.PATH_INFO CONTAINS "representedartists/index.cfm">
<cfelseif CGI.PATH_INFO CONTAINS "photoshowcase/index.cfm">
	</div>
<cfelse>
	</div>
</cfif>
<!--- end total crap solution --->
</div>   

<cfoutput>   
<cfset xlink="/photoshowcase/NewDocumentation/Artists/SubmissionProcess2.cfm">
<cfset xWindowName="Submit_Your_Work">
<CFSET xPopupWidth = 450>
<CFSET xPopupHeight = 330>
<CFSET xPopupScroll = "no">
 
<div class="DivisionMenu">
   	  <div class="DivisionMenuTop" id="DivisionMenuBottom">
			<cfmodule template="/global/includes/dsp_JumpTop.cfm" division="gallery">
    	</div>
    </div>
    <div style="height:15px"></div>
</div>
</cfoutput>
<cfinclude template="/global/includes/dsp_global_footer.cfm"> 