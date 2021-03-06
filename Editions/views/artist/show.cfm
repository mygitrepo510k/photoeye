<cfset artist = event.getValue('artist') />
<cfset publication = event.getValue('publication') />
<cfset other_publications = event.getValue('other_publications',false) />
<cfset page_name = event.getValue('page','statement') />
<cfoutput>

	<div id="artist_citation" class="two_column">
		<div class="trow">
			<div class="left" style="width:#artist.portrait_width#px;">
				<div style="text-align:left;">
					<img src="#artist.portrait#" width="#artist.portrait_width#" height="#artist.portrait_height#" style="border: 1px solid ##ccc;"/><br />
					<span style="font-size:10px;color:##999;">#artist.portrait_credit#</span>
				</div>
			</div>
	<!--- 		<div class="right" style="#(1010-artist.portrait_width)#" > --->
			<div class="right">
				<h4>#artist.name#</h4>
				<div class="details">#artist.dob#</div>
				<div class="menu">
					<div class="first_tab">
						#helpers.gui.insertArtistMenuTab('statement', page_name, event.linkTo('artist.show','id'))#
					</div>
						#helpers.gui.insertArtistMenuTab('publications', page_name, event.linkTo('artist.show','id'))#
						#helpers.gui.insertArtistMenuTab('exhibitions', page_name, event.linkTo('artist.show','id'))#
						#helpers.gui.insertArtistMenuTab('collections', page_name, event.linkTo('artist.show','id'))#
						#helpers.gui.insertArtistMenuTab('awards', page_name, event.linkTo('artist.show','id'))#
					<div class="last_tab">
						#helpers.gui.insertArtistMenuTab('representation', page_name, event.linkTo('artist.show','id'))#
					</div>	
						<div class="buffer" style="clear:both;height: 15px;"> </div>
				</div>
				<cfif page_name EQ "publications" AND IsArray(other_publications)>
					<cfloop from=1 to="#ArrayLen(other_publications)#" index="i">
						<a href="http://www.photoeye.com/bookstore/citation.cfm?catalog=#other_publications[i].catalog_number#">#other_publications[i].title#</a><br />
					</cfloop>
				<cfelse>
				#helpers.gui.profileFormat(Evaluate("artist.#page_name#"))#
				</cfif>
				<span style="visibility:hidden;">This is some text used to space out the containing div, it is one long line which will help fill the space automatically.</span>
				<div class="site_link">
					<a href="#event.linkTo('publication.show')#/catalog/#publication.catalog_number#">view #publication.title# by #artist.name#</a>
				</div>
			</div>
		</div>
	</div>

</cfoutput>