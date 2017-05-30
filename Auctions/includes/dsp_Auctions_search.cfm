
<div class="MainArea">
    <div class="MASearch">
    <div class="BScontain"><div class="BSsearch">
	
	<div style="float: left; margin-left: 25px; margin-top: 3px; color: ##fafafa; text-transform: uppercase; font-size: 11px; letter-spacing: 1px;display:inline;"><a style="color:#fafafa;" href="inquiries.cfm">inquiries</a><span style="margin-left:5px;margin-right:5px;"><img src="/global/images/rssdot.gif" width="11"/></span><a style="color:#fafafa;" href="comments.cfm">comments</a><span style="margin-left:5px;margin-right:5px;"><img src="/global/images/rssdot.gif" width="11"/></span><a style="color:#fafafa;" href="/emailnewsletter/">newsletter</a><!---<span style="margin-left:5px;margin-right:5px;"><img src="/global/images/rssdot.gif" width="11"/></span><a style="color:##fafafa;" href="javascript:alert('this needs to be delt with');">submissions</a>---></div>

<form name="searchFrm" method="post" action="AuctionSearchResults.cfm">
	
        	  <div class="BSsearchTop"><div class="BSsearchInput" <cfif CGI.HTTP_USER_AGENT CONTAINS "Safari"> style="margin-top:-2px;"</cfif>><input name="SearchInput" type="text" class="input_text" id="BSInput" style="FONT-FAMILY: Arial, Helvetica, sans-serif;FONT-SIZE: 13px" onFocus="if(this.value=='Search Auctions...')this.value='';" value="Search Auctions..." size="55" MAXLENGTH="150"></div>
				<div class="BSsearchSelect"><!--<select name="SearchField"  style="FONT-FAMILY: Arial, Helvetica, sans-serif;FONT-SIZE: 10px">
                <option value="Abstract">Keyword</option>

               <option value="Title">Title</option>
				  
                <option value="Authors">Author</option>
 
                <option value="Publisher">Publisher</option>
							
				<option value="Abstract">ISBN#</option>
				

				</select>--></div>
                <div class="BSsearchSelect"><!--<select name="SearchField"  style="FONT-FAMILY: Arial, Helvetica, sans-serif;FONT-SIZE: 10px">
                <option value="PEdatabase">In photo-eye's database</option>
                
				<option value="AZdatabase">In Amazon's database</option>
				

				</select>--></div>
                <div class="BSsearchButton"><input name="btnSearch" type="image" style="font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;font-size:13px;width:auto;height:auto;" value="Search" src="../global/images/submit.gif" /></div></div></div></div></div>

</form>

  <cfif CGI.PATH_INFO DOES NOT CONTAIN "/index.cfm">
  <div class="Bread_Crumb"><a href="javascript: history.back()"><img src="images/back.jpg" />back</a></div>
  </cfif>                

<div class="MALeft">
      	<!--<div class="Title">-->  

