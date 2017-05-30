<cfscript>
	
function insertDivider(title){
	return '
		<div class="divider_top">
			#title#
		</div>
		<div class="divider_bottom">
			<div class="left"> </div>
			<div class="arrow"> </div>
			<div class="right"> </div>
		</div>
	';
}

function insertBigCitation(publication, event){
	return '
<div class="big_citation">

	<div class="image" style="height: 400px;width: 400px;">
		<a href="publication.show/catalog/#publication.catalog_number#">
			<img src="#publication.image_path#/cover_medium.jpg" />
		</a>
	</div>
	<div>
		<p>
		<h3>#publication.tagline#</h3>
		<h1><a href="publication.show/catalog/#publication.catalog_number#">#publication.title#</a></h1>
		<h2>by <a href="#event.linkTo('artist.show', 'name')#">#publication.author#</a></h2>
		#publication.description#
		<br />
		<br />
		<a href="publication.show/catalog/#publication.catalog_number#">read more</a>
	</div>

</div>
	';
}

function insertSmallCitation(publication){
	return '
		<div class="small_citation">
		<div style="margin-bottom: 3px;">
			<a href="publication.show/catalog/#publication.catalog_number#"><img style="border: none;" src="#publication.image_path#/cover_small.jpg" /></a>
		</div>
			<em><a href="publication.show/catalog/#publication.catalog_number#">#publication.title#</a></em><br />#publication.author#
		</div>
	';
}

function insertMessageWindow(type, message){
	switch(type){
		case "error": {
			return '
				<div class="window #type#">
					<div class="exclaimation">
						!
					</div>
					<div class="message">
							Could not complete your request due to an error: <span>#message#</span><br /><br />
							You have been redirected to the home page.
					</div>
				</div>
			';
			break;
		}
		case "notice": {
			return '
				<div class="window #type#">
					<div class="exclaimation">
						!
					</div>
					<div class="message">
							<span>#message#</span><br /><br />
					</div>
				</div>
			';
			break;
		}
	}
}

function openWindow(type){ 
	return '
	';
}

function closeWindow(){
	return '
	';
}

function insertLinkedThumb(calling_page, catalog_number, image_path, image_name){
	return '
	<a href="#calling_page#/catalog/#catalog_number#/img/#image_name#">
		<img src="#image_path##image_name#_thumb.jpg" />
	</a>
	';
}

function insertAdminControls(buttons) {
	if(StructKeyExists(SESSION,'logged_in')){
		button_list = StructKeyList(buttons);
		for(i=1; i LTE ListLen(button_list); i++){
			WriteOutput('<div class="tab"><a href="' & buttons[ListGetAt(button_list,i)] & '">' & replace(ListGetAt(button_list, i),"_"," ","ALL") & '</a></div>' );
		}
	}
}

function insertArtistMenuTab(page, current_page, link) {
	WriteOutput ('<div class="tab '); 
	if(current_page EQ page) WriteOutput('on'); 
	else WriteOutput('off');
	WriteOutput('"><a href="');
	WriteOutput("#link#/page/#page#"&'">#page#</a></div>');
}

function insertPublicationMenuTab(name, page, current_page, link) {
	WriteOutput ('<div class="tab '); 
	if(current_page EQ page) WriteOutput('on'); 
	else WriteOutput('off');
	WriteOutput('"><a href="');
	WriteOutput("#link#/page/#page#"&'">#name#</a></div>');
}

function profileFormat(t){
	if(t CONTAINS "<divider>" OR t CONTAINS "<c>"){
		t = replace(t, 'divider>', 'h2>', 'all');
		t = replace(replace(t, '<c>', '<div class="collection">','all'),'</c>','</div>', 'all');
		t = replace(replace(t, '<e>', '<div class="exhibition">','all'),'</e>','</div>', 'all');
		return t;
	}
	else {
		t = rereplace(t, '\r\n', '<br />', 'ALL');
		return "<p>"&t&"</p>";
	}
}

function checkAbsolutePaths(t){
	if(application.root_path CONTAINS "photoeye"){

	}
	else{
		t = replace(t, '/photoeye_editions/','/','ALL');
	}
	t = replace(replace(t, "src='/", "src='http://www.photoeyeeditions.com/", "ALL"), 'src="/', 'src="http://www.photoeyeeditions.com/', 'ALL');
	return t;
}
</cfscript>
<!--- <cffunction name="generateBlurb">
	<cfargument name="full_text" required="true" />
	<cfset var full_text = REreplace(arguments.full_text,'\n','<br />','ALL') />
	<cfset var paragraph_array = ListToArray(full_text, '<br />') />
	<cfreturn paragraph_array[1] />
</cffunction> --->
<!--- !TODO: make insertAdminControls a proper function to build buttons from a passed struct --->