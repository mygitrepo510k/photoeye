<cfoutput>			
		 
		<!--- <div id='standard_container'>
		 
		 <div id='header_title_menu_container'>
		 	    	<div class="about"><a href="info_page.cfm?page=1">About #xLogo#</a></div>
    				<div class="how"><a href="info_page.cfm?page=2">How Photographers are Selected</a></div>
    				<div class="organizations"><a href="info_page.cfm?page=3">Organizations Included</a></div>
    				<div class="enhanced"><a href="info_page.cfm?page=4">Enhanced Listings</a></div>
    				<div class="faqs"><a href="info_page.cfm?page=5">FAQs</a></div>
    				<div class="contact"><a href="contact_us.cfm">Contact Us</a></div>	
    	</div> 
		 </div>--->
		 
		<div id='standard_container' style="margin-top:20px; line-height:20px;">
		
		<h3>Already have a Publisher Direct Account?</h3>
		<div style="margin-bottom:20px;">
			<a href="/publisher_direct/login">Login now</a>
		</div>
		
		<h2>Publisher Direct Overview</h2>

The explosion in the number of photography books published each year has made it impossible for photo-eye to carry every important title published. Publisher Direct is a new service introduced by photo-eye whereby photographers and publishers can catalogue their books and include them in  photo-eye's speciality photobook database.  
		<br><br>
		Publisher Direct  is limited to books that are important to photo-eye's art market and is by invitation only. Orders go directly to the photographer or publisher and photo-eye does not receive any part of the sale. A special Publisher Direct order button is placed on each book's citation page so they can be sold directly.  When the purchase button is clicked, the buyer is taken to any outside page the publisher or photographer desires, usually an order, PayPal or more info page. Since no percentage of the sale is taken by photo-eye, there is an annual, nominal fee for each book included. You may also purchase a BookTease™ of 10 page spreads for a one-time fee.
		<br><br>
		We'll announce your book(s) in our email newsletter which goes out to thousands of photobook lovers worldwide and if they are self-published, we'll include them in our upcoming Indie Books section of our website. <br><br>
		Submit a review copy or PDF of your book(s) to be considered for our Publisher Direct program.<br>
		<br>
		Review copies should be sent to:<br>
		photo-eye<br>
		Publisher Direct<br>
		370 Garcia Street<br>
		Santa Fe, NM 87501<br>
		<br>
		PDFs of your books should be emailed as a link or an attachment to <a href="mailto:melanie@photoeye.com?subject=Publisher Direct PDF">melanie@photoeye.com</a><br><br>
		We'll get back to you within one week of receipt of your book. If you would like your book back, you must pay return shipping. Please included a return UPS or FedEx tag including your shipper number or prepaid postage. 

		<br><br>
		<a href="fees.cfm">View our fee schedule</a> for Publisher Direct.
		<br><br>
		If you have any questions about Publisher Direct <a href="mailto:info@photoeye.com?subject=Publisher Direct Questions">please email us</a>.
		We hope you enjoy Publisher Direct!
		<br><br>
		
		<!--- <a href="">Click here</a> to --->
		<!--- <div id="box_container" style="margin-top:0px; padding: 10px 0 0 30px;">
		 		<div class="info" style="width:280px;">
		 			<a href="info_page.cfm?page=7">Recently Added</a>
 					<div class="info_item">
 						<li><a href="index.cfm?fid=48&View=3">2011 Guggenheim Fellows</a></li>
 					</div>
 					<div class="info_item">
 						<li><a href="http://www.photoeye.com/api/index.cfm?fid=50&View=3">Palm Springs Photo Festival Winners</a></li>
 					</div>
		 		</div>
		 		<div class="info">
		 			<a href="info_page.cfm?page=8">API News</a>
	 				<div class="info_item">
	 					<li><a href="website.cfm?website=cds.aas.duke.edu/bp/announcement2011.html">Benjamin Lowy wins Honickman First Book Prize in Photography!</a></li>
	 				</div>
		 		 	<!--- <div class="info_item">
		 		 		<li><a href="website.cfm?website=www.pdnonline.com/pdn/News-47.shtml">PDN Newswire</a></li>
		 		 	</div>  --->
		 		</div>
		 		<div class="info" style="margin-left:40px;">
		 			<a href="info_page.cfm?page=1">About API</a>
		 			<div class="info_item">
		 				<li><a href="info_page.cfm?page=5">FAQs</a></li>
		 			</div>
 					<div class="info_item">
 						<li><a href="info_page.cfm?page=3">Organizations Included</a></li>
 					</div>
		 		</div>
		 		<div class="info" style="width:185px;">
		 			<a href="contact_us.cfm">Contact Us</a>
		 			<div class="info_item">
		 				<li><a href="contact_us.cfm">Request Listing Form</a></li>
		 			</div>
 					<div class="info_item">
 						<li><a href="mailto:api@photoeye.com?subject=API">api@photoeye.com</a></li>
 					</div>
		 		</div>
			</div> --->
			
	<!---	<cfinclude template="dsp_map_app.cfm">	 --->
<!--- <div id="map_revealable" style='color: ##3399ff;'>
	<div id="map_revealer" style="width:800px; margin-top:10px; margin-bottom:10px; font-size: 16px; line-height: 37px; color: ##666; ">
		<img src="images/magnify_world.png" />
		<span style="vertical-align:top;">Click here for World Map of API Photographers</span> <span style="padding-left:100px; font-size:12px; vertical-align:top;display: none;" id="map_info">Click map 	pin to view photographer(s)</span>
	</div>
	<div id="map_revealee" style="width:800px;  display:none;  font-size: 16px; color: ##666; height: 500px;">
		<cfinclude template="dsp_map_app.cfm" />
	</div>
</div> --->
</cfoutput>
<script type="text/javascript">
	jQuery('#map_revealer').click(function(){
		if(jQuery('#map_revealee:visible').length > 0){
			jQuery('#map_revealee').hide();
			jQuery('#map_info').hide();
		}
		else {
			jQuery('#map_revealee').show();
			jQuery('#map_info').show();
		}
		if(jQuery('#map_revealee.initialized').length < 1){
			map_initialize();
			jQuery('#map_revealee').addClass('initialized');
		}
	});
</script>	   	  		 
<cfoutput>
		
<!---		<cfset qPhotographers = getAllPhotographers(true) />
		
	    <!--- Rule above Alphabet --->
	  	 <div class="alpha_blue_rule" style="margin-top:10px;"></div>
	   	  <div class="alpha_letters">
			<cfset xAsc='65'>
			<cfparam name="url.i" default="">
			<cfloop  index='LoopCounter' from='1' to='26'>
				<cfset xAlpha = chr(xAsc)>
				<cfquery dbtype="query" name="qMatchingAlphaPhotographers">
					SELECT * FROM qPhotographers
					WHERE lastname LIKE '#xAlpha#%'
				</cfquery>
				<cfif qMatchingAlphaPhotographers.recordcount GT 0>
					<a href="alpha.cfm?i=#xAlpha#<cfif isdefined("url.fid")>&if=#url.fid#</cfif><cfif isdefined("url.fyr")>&iy=#url.fyr#</cfif>">#xAlpha#</a>
				<cfelse>
				<a href="" class="disabled">#xAlpha#</a> 
				</cfif>
				<cfset xAsc=xAsc+1>
			</cfloop>
			</div>
	   
	 
	   <!--- Rule below Alphabet --->
	     <div class="alpha_blue_rule"></div>
	 

 
		
		</div>

<cfset expired = serveCacheFragment('index_grid',0) />
<cfif expired>
	<cfsavecontent variable="varnish_index">
	
		<!--- START VARNISH FRAGMENT CACHING --->
	
		  <!--- Go get em --->  
		  <!--- Search REsults --->
		 <cfset tick('start grid') />
		 <cfparam name="aboutipi" default="0">
		  <cfif aboutipi is 0> 
		 		<cfinclude template="dsp_index_alpha_grid.cfm"> 
		  <cfelse>
			 <cfinclude template="dsp_about_ipi_pwp.cfm">	  	  
		  </cfif>
		  <cfset tick('end grid') />
		   <!--- Rule below Alphabet --->
		     <div class="alpha_blue_rule"></div>
	
		<!--- END VARNISH FRAGMENT CACHING --->
	
	</cfsavecontent>
	<cfset writeCacheFragment('index_grid', varnish_index) />
</cfif>
	    	  
	<cfinclude template="dsp_art_ads_horizontal.cfm" />
	
	</div> <!--- standard_container --->
 </div> <!--- ipi_page_container --->

<cfif StructKeyExists(URL,'access_denied')>
	<script type="text/javascript">
		alert("You'll have to log in to access that area");
	</script>
</cfif>
<cfset caller.qGetPhotographers = qGetPhotographers /> 
<div id="initSplash" style="display:none;">
	<div style="width:960px;margin:85px auto 0;">
	  <div class='splashLogo' style="background: url('/#application.root#/images/header_logo_API.gif') no-repeat scroll left top transparent; height: 160px;width: 155px;float:left;"></div>
	 --->  
</cfoutput>
<!---
	  <div class='splashText' style="float:left;margin-left:25px;margin-top:45px;font-size:36px;font-family:Verdana;">
	  Welcome!
	  </div>
--->
  	</div>
</div>