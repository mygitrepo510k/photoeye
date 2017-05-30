
<cfset publication = event.getValue('publication') />
<cfset display_image = event.getValue('img','cover') />
<cfset page_name = event.getValue('page','description') />
<cfset image_set = event.getValue('image_set','content') />
<cfset name_array = ListToArray(publication.author,' ') />

<!--- 28.Jul 2015 10:16 AM, BLM, if the inventory.subject value in the DB is not set, there will not be a 2 length array    --->
<cfif isArray(name_array) and arrayLen(name_array)>
	<cfset event.setValue('name', name_array[arrayLen(name_array)]) />	
<cfelse>
	<cfset event.setValue('name', '') />
</cfif>
	
<!--- This creates a coming soon text for Elaine Ling which shows when the book in the search engine is clicked --->	
<!---	<cfif publication.catalog_number is 'PE041' and cgi.x_forwarded_for neq '65.100.24.36'>
			Coming Soon <cfabort>
	</cfif> --->


		<style>
		#thumb_scroller {
			position: relative;
			display: table;
		}
		
		#zone_container {
			opacity: .5;
			height: 50px;
			width: 100%;
		}
		
		#zone_left, #zone_right {
			width:33%;
			height:100%;
			float:left;
			background: url('http://www.photoeyeeditions.com/images/left_arrow_on.gif') 20% center no-repeat;
		}
		
		#zone_right {
			float:right;
			background: url('http://www.photoeyeeditions.com/images/right_arrow_on.gif') 80% center no-repeat;
		}
		
		#zone_right:hover {
			background-image: url('http://www.photoeyeeditions.com/images/right_arrow_off.gif');
		}
		
		#zone_left:hover {
			background-image: url('http://www.photoeyeeditions.com/images/left_arrow_off.gif');
		}
		.two_column .right form a:hover {
			background: white;
			color: #333;
		}
		.two_column .right form {
			line-height: 20px;
		}
		
	</style>
	

<cfoutput>



<div class="two_column">
	<div class="trow">
		<div class="left" style="width: 360px;">
			<div class="primary_image" style="width: 360px; text-align: center;">
				<a href="#publication.image_path##display_image#_large.jpg" rel="lightbox[cover]" alt="#publication.author#: <em>#publication.title#</em>"><img src="#publication.image_path##display_image#_main.jpg" /></a>
			</div>
			<div class="menu image_menu">
				<div style="width: 365px; display: table; margin: 0 auto;">
				<div class="first_tab">
	
				<cfif image_set EQ "content">
					<div class="tab on" <cfif NOT publication.total_container_images>style="background:none;"</cfif>>
				<cfelse>
					<div class="tab off">
				</cfif>				
						<a href="#event.LinkTo('publication.show','catalog')#/page/#page_name#/image_set/content">view  contents</a>
					</div>
				</div>
				<div class="last_tab">
				<cfif publication.total_container_images>
					<cfif image_set EQ "container">
						<div class="tab on">
					<cfelse>
						<div class="tab off">
					</cfif>
							<a href="#event.LinkTo('publication.show','catalog')#/page/#page_name#/image_set/container">view presentation box</a>			
						</div>
				<cfelse>
					<div class="tab">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</cfif>
				</div>
				</div>
			</div>
			<div class="secondary_images">
				<div style="width:360px;">
				<cfif StructKeyExists(URL, "testing")>
					<cfloop index="i" from="1" to="#Evaluate('publication.total_#image_set#_images')#">
						<a rel="lightbox['publication']" href="#publication.image_path##image_set##i#_large.jpg" class="thumb" alt="#publication.author#: <em>#publication.title#</em>">
							<img src="#publication.image_path##image_set##i#_thumb.jpg" />
						</a>
						<cfif i EQ 3 OR i EQ 6 OR i EQ 9 OR i EQ 12 OR i EQ 15 OR i EQ 18 OR i EQ 21 OR i EQ 24 OR i EQ 27>
							</div>
							<div>
						</cfif>
					</cfloop>	
				<cfelse>
				<cfloop index="i" from="1" to="#Evaluate('publication.total_#image_set#_images')#">
					<a rel="lightbox['publication']" href="#publication.image_path##image_set##i#_large.jpg" class="thumb" style="background-image: url('#publication.image_path##image_set##i#_thumb.jpg')" alt="#publication.author#: <em>#publication.title#</em>">
					</a>
					<cfif i EQ 3 OR i EQ 6 OR i EQ 9 OR i EQ 12 OR i EQ 15 OR i EQ 18 OR i EQ 21 OR i EQ 24 OR i EQ 27>
						</div>
						<div>
					</cfif>
				</cfloop>
				</cfif>
				</div>
			</div>
		</div>
		<div class="right" style="min-width: 371px; max-width: 635px;">
			<div class="details tagline">#publication.tagline#</div>
			<h4>#publication.title#</h4>
			<div class="details"><a href="#event.linkTo('artist.show', 'name')#">#publication.author#</a></div>
			<div class="menu">
				<div class="first_tab">
					#helpers.gui.insertPublicationMenuTab('description', 'description', page_name, event.linkTo('publication.show','catalog')&'/image_set/#image_set#')#
				</div>
				<div class="last_tab">
					#helpers.gui.insertPublicationMenuTab('pricing structure', 'pricing', page_name, event.linkTo('publication.show','catalog')&'/image_set/#image_set#')#
				</div>
					<div class="buffer"> </div>
			</div>
			<p>
				<cfif page_name EQ "description">
					#helpers.gui.checkAbsolutePaths(Evaluate("publication.#page_name#"))#
				<cfelse>
					#helpers.gui.profileFormat(Evaluate("publication.#page_name#"))#
				</cfif>
			</p>
			<div id="purchase">
			
			<cfif publication.catalog_number is 'PE037'>
				<a href="http://www.photoeyeeditions.com/index.cfm/artist.show/id/3">read more about #publication.author#</a>
			<cfelse>
				<a href="#event.linkTo('artist.show', 'name')#">read more about #publication.author#</a>
			</cfif>
				<br /><br />
				<cfloop from="1" to="#ArrayLen(publication.price)#" index="i">
					<form action="http://www.photoeye.com/templates/AddToCartBoth.cfm#IIF(StructKeyExists(SESSION,'logged_in'),DE("?debugging365asdfaeuy3ohiasdhgeioy384927helkjsdf=true"),DE(""))#" method="post">
						<input type="hidden" name="NUMBER" value="#publication.passthrough_number[i]#" />
						<input type="hidden" name="binding_#publication.catalog_number##helpers.format.underscorize(publication.binding_name[i])#" value="#IIF(publication.binding_name[i] CONTAINS 'DELUXE',DE('Deluxe Edition'), DE('Limited Edition'))#" />
						<input type="hidden" name="CATALOG_LTD#publication.stock_id[i]#" value="#publication.catalog_number#" />
						<input type="hidden" name="saleprice_#publication.catalog_number##helpers.format.underscorize(publication.binding_name[i])#" value="#publication.price[i]#" />
						<input type="hidden" name="listprice_#publication.catalog_number##helpers.format.underscorize(publication.binding_name[i])#" value="#publication.price[i]#" />
						<input type="hidden" name="RecordID_#publication.catalog_number##helpers.format.underscorize(publication.binding_name[i])#" value="#publication.inventory_id#" />
						<input type="hidden" name="NUMCOPIES" value="1" />
						<input type="hidden" name="CATALOG" value="#publication.catalog_number#" />
						
<input type="hidden" name="additional_handling_#publication.catalog_number##helpers.format.underscorize(publication.binding_name[i])#" value="40" />
						<input type="hidden" name="DiscontCount" value="0" />
						<input type="hidden" name="TITLE2X" value="#publication.title#" />
						<input type="hidden" name="SubtitleX" value="#publication.subtitle#" />
						<input type="hidden" name="purchase" value="Add to photo-eye Order" />
						#iif(publication.binding_name[i] CONTAINS 'DELUXE', DE('Deluxe Edition: '), DE('Limited Edition: '))# #iif(page_name EQ 'pricing',DE("currently"),DE(""))# $#publication.price[i]# + <!--- <a id="shipping_trigger"> --->shipping and handling<!--- </a> ---><br />
						<div style="display:none;" id="shipping_details">
						shipping is charged at cost, handling is $15.00
						</div>
						<input type="submit" value="purchase" />
					</form><br />
				</cfloop>
			</div>
		</div>
	</div>
</div>
</cfoutput>
<script type="text/javascript">
var image_elements = $$('.secondary_images a');
var image_array = [];
image_elements.each(function(e){ 
	image_array.push(e.href);
});
document.observe('dom:loaded', function () { s = new thumbScroller(image_array, $$('.secondary_images')[0]); });
$('shipping_trigger').observe('click',function(e){ e.stop(); $('shipping_details').toggle(); });
</script>