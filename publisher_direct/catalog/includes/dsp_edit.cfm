<cfset editing_catnum = "" />
<cfif StructKeyExists(URL,'c')>
	<cfset editing_catnum = URL.c />
<cfelseif StructKeyExists(FORM,'catnum')>
	<cfset editing_catnum = FORM.catnum />
</cfif>

<!--- is this a valid catnum as far as PD is concerned? --->
<cfquery name="qPDBook" dataSource="#application.dsn#">
	SELECT * FROM publisher_direct_catalog
	WHERE catalog = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" maxLength="5" value="#editing_catnum#" />
	AND publisher_direct_id = #request.qPD_user.id#
</cfquery>

<cfif NOT qPDBook.recordcount>
	<!--- no, quit. --->
	<h2>Uh-oh.</h2>
	<ul class="error_messages">
		<li>
			Catalog number was not valid or malformed.
		</li>
	</ul>
	<cfabort />
</cfif>

<cfquery name="qBook" dataSource="photoeyecom">
	SELECT * FROM inventory
	WHERE catalog = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" maxLength="5" value="#editing_catnum#" />
</cfquery>

<cfif NOT qBook.recordcount>

	<!--- inventory record has disappeared? Insert it again --->
	<cfquery name="qCreateInventoryItem" dataSource="#application.dsn#">
		INSERT INTO inventory (catalog, subject, subjectx) VALUES ('#qPDBook.catalog#','PUBLISHER DIRECT','DIRECT, PUBLISHER')
	</cfquery>

	<!--- get the new book entry --->
	<cfquery name="qBook" dataSource="photoeyecom">
		SELECT * FROM inventory
		WHERE catalog = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" maxLength="5" value="#editing_catnum#" />
	</cfquery>

</cfif>

<cfquery name="qBookBindings" dataSource="photoeyecom">
	SELECT s.*, s.number, ps.*, ps.number, ps.currency_id FROM stock AS s
	LEFT JOIN Publisher_Direct_Bindings AS ps
	ON s.number = ps.number
	WHERE substring(s.number,1,5) = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" maxLength="5" value="#editing_catnum#" />
</cfquery>

<!---
<cfdump var="#qBook#" />
<cfdump var="#qBookBindings#" />
--->

<cffunction name="parseSize" description="I get the different chunks of the sizeX field out" output="no">
	<cfargument name="size" />
	<cfset var parts = StructNew() />
	<cfset var calc = StructNew() />
	<cfset calc.size_w = Left(arguments.size,ReFind('x',arguments.size,1,true).pos[1]-1) />
	<cfset calc.size_h = Mid(arguments.size,ReFind('x',arguments.size,1,true).pos[1]+1,Len(arguments.size)) />
	<cfset calc.w2f = ReFind('-',calc.size_w,1,true) />
	<cfset calc.h2f = ReFind('-',calc.size_h,1,true) />
	<cfif calc.w2f.pos[1] GT 0>
		<cfset parts.w1 = Left(calc.size_w,calc.w2f.pos[1]-1) />
		<cfset parts.w2 = Mid(calc.size_w,calc.w2f.pos[1]+1,Len(calc.size_w)) />
	<cfelse>
		<cfset parts.w1 = calc.size_w />
		<cfset parts.w2 = "" />
	</cfif>
	<cfif calc.h2f.pos[1] GT 0>
		<cfset parts.h1 = Left(calc.size_h,calc.h2f.pos[1]-1) />
		<cfset parts.h2 = Mid(calc.size_h,calc.h2f.pos[1]+1,Len(calc.size_h)) />
	<cfelse>
		<cfset parts.h1 = calc.size_h />
		<cfset parts.h2 = "" />
	</cfif>
	<cfreturn parts />
</cffunction>

<cffunction name="parseNumber" description="I get the root and suffix of a stock number" output="no">
	<cfargument name="stock_number" />
	<cfset var parts = StructNew() />
	<cfset arguments.stock_number = replace(arguments.stock_number,'     ',' ') />
	<cfset parts.root = left(arguments.stock_number,8) />
	<cfif right(parts.root,2) EQ "LT">
		<cfset parts.root &= "D" />
		<cfif len(arguments.stock_number) GT 11>
			<cfset parts.suffix = mid(arguments.stock_number,11,len(arguments.stock_number)) />
		<cfelse>
			<cfset parts.suffix = "" />
		</cfif>
	<cfelse>
		<cfif len(arguments.stock_number) GT 10>
			<cfset parts.suffix = mid(arguments.stock_number,10,len(arguments.stock_number)) />
		<cfelse>
			<cfset parts.suffix = "" />
		</cfif>
	</cfif>
	<cfreturn parts />
</cffunction>

<cffunction name="findISBN" description="gets ISBN from inventory data based on stock number">
	<cfargument name="qInventory" />
	<cfargument name="number_binding" />
	<cfset var isbn = "" />
	<cfset var qISBN = "" />
	<cfswitch expression="#Left(arguments.number_binding,2)#">
		<cfcase value="HB">
			<cfquery name="qISBN" dbtype="query">
				SELECT hard_isbn FROM qInventory
				WHERE ltd_editio = 0
			</cfquery>
			<cfset isbn = qISBN.hard_isbn />
		</cfcase>
		<cfcase value="SB">
			<cfquery name="qISBN" dbtype="query">
				SELECT soft_isbn FROM qInventory
				WHERE ltd_editio = 0
			</cfquery>
			<cfset isbn = qISBN.soft_isbn />		
		</cfcase>
		<cfcase value="EB">
			<cfquery name="qISBN" dbtype="query">
				SELECT soft_isbn FROM qInventory
				WHERE ltd_editio = 0
			</cfquery>
			<cfset isbn = qISBN.soft_isbn />		
		</cfcase>
		<cfcase value="LT">
			<cfquery name="qISBN" dbtype="query">
				SELECT hardbound, softbound, hard_isbn, soft_isbn FROM qInventory
				WHERE ltd_editio = 1
			</cfquery>
			<cfif qISBN.hardbound>
				<cfset isbn = qISBN.hard_isbn />
			<cfelse>
				<cfset isbn = qISBN.soft_isbn />									
			</cfif>
		</cfcase>
	</cfswitch>
	<cfreturn isbn />
</cffunction>

<cfif qBook.recordcount GT 0>

	<cfparam name="FORM.Title" default="#qBook.Title2x#" />
	<cfparam name="FORM.Subtitle" default="#qBook.Subtitlex#" />
	<cfparam name="FORM.Authors" default="#qBook.Authorsx#" />
	<cfparam name="FORM.Publisher" default="#qBook.Publisherx#" />
	<cfparam name="FORM.City" default="#qBook.Cityx#" />
	<cfparam name="FORM.Country" default="#qBook.Country#" />
	<cfparam name="FORM.Language" default="#qBook.Language#" />
	<CFIF FORM.Language is ''>
		<cfset FORM.Language = 'English'>
	</CFIF>
	<cfparam name="FORM.DatePub" default="#qBook.DatePub#" />
	<cfparam name="FORM.Pages" default="#qBook.Pages#" />
	<cfparam name="FORM.Illustrations" default="#qBook.Illustrat#" />
	<cfparam name="FORM.Appendices" default="#qBook.Appendices#" />

	<cfif Len(qBook.sizex)>
		<cfset sizeParts = parseSize(qBook.sizex) />
	<cfelse>
		<cfset sizeParts = StructNew() />
		<cfset sizeParts.w1 = 1 />
		<cfset sizeParts.w2 = 0 />
		<cfset sizeParts.h1 = 1 />
		<cfset sizeParts.h2 = 0 />
	</cfif>
	
	<cfparam name="FORM.Size_Width_1" default="#sizeParts.w1#" />
	<cfparam name="FORM.Size_Width_2" default="#sizeParts.w2#" />
	<cfparam name="FORM.Size_Height_1" default="#sizeParts.h1#" />
	<cfparam name="FORM.Size_Height_2" default="#sizeParts.h2#" />
	<cfparam name="FORM.Description" default="#qBook.OCRX#" />
	
	<cfif Len(Trim(FORM.Country)) LT 1>
		<cfset FORM.Country = "001" />
	</cfif>
	
<!---
	<cfif Len(Trim(FORM.Language)) LT 1>
		<cfset FORM.Language = "English" />
	</cfif>
--->
	
<!--- 	<cfdump var="#FORM#" /> --->
	
<cfelse>

</cfif>

<cfquery NAME="qCountries" DATASOURCE="photoeyecom">
	SELECT Country, CountryCode
	FROM  Country
	ORDER BY CountryCode
</cfquery>

<cfquery NAME="qBindings" DATASOURCE="photoeyecom">
	SELECT Binding
	FROM  Bindings
	ORDER BY SortOrder
</cfquery>

<cfquery NAME="qCurrencies" DATASOURCE="photoeyecom">
	SELECT *
	FROM  Currency
</cfquery>

<script type="text/javascript">
	jQuery.noConflict();
	
	jQuery(document).ready(function(){
		j$ = jQuery;
		binI = parseInt(j$('.binding_fields').last().attr('data-id'))+1 || 1;
		__cat = "<cfoutput>#qBook.catalog#</cfoutput>";
		var numberRoot = function(bindingType){
			switch(bindingType){
				case 'Hardbound':
					return __cat+" HB"
					break;
				case 'Softbound':
					return __cat+" SB"
					break;
				case 'e-book':
					return __cat+" EB"
					break;
				case 'Limited Edition':
					return __cat+" LTD"
					break;
			}
		}

		var newBinding = function(bindingType){
			_h = '<div id="binding_'+binI+'" class="binding_fields" data-id="'+binI+'">';
			_h += '<div style="margin-bottom:0px;"><h3>'+numberRoot(bindingType)+'-';
			_h += '<input type="text" name="binding_'+binI+'_number_suffix" class="binding_number_suffix" value="" maxlength="'+(20-(numberRoot(bindingType).length+5))+'"/>';
			_h += '<span style="font-size:10px;color:#666;"> optional custom binding code (ex: "SIGNED", '+(20-(numberRoot(bindingType).length+5))+' characters max)</span>';
			_h += '</h3><input type="hidden" name="binding_'+binI+'_new" value="true" /><input type="hidden" name="binding_'+binI+'_number_base" value="'+numberRoot(bindingType)+'" /><div><label>ISBN</label><input type="text" name="binding_'+binI+'_ISBN" value="" /></div>';
			_h += '<div><label>Currency</label><select name="binding_'+binI+'_currency"><cfoutput><cfloop query="qCurrencies"><option value="#qCurrencies.id#" <cfif qCurrencies.id EQ 1>SELECTED</cfif>>#qCurrencies.symbol# #qCurrencies.currency# (#qCurrencies.code#)</option></cfloop></cfoutput></select></div>';
			_h += '<div><label>List Price $</label><input type="text" name="binding_'+binI+'_price" value="" /></div><div><label>Purchase Link</label><input type="text" name="binding_'+binI+'_link" value="" /></div><div><label>Binding is signed</label><input type="checkbox" class="binding_signed" name="binding_'+binI+'_signed" value="1" /><div><label>No Longer Available</label><input type="checkbox" name="binding_'+binI+'_OP" value="1" /></div></div><div><label>Delete</label><input type="checkbox" name="binding_'+binI+'_delete" class="binding_delete" value="1" /></div></div>';
			binI++;
			return _h;
		};
		
		var trim = function(str){
			return str.replace(/^\s+|\s+$/g,"");
		}
		
		var renderPreview = function(){
			// FF 3.6.17 bug triggered by this =>
			j$('#preview_title').html(trim(j$('input[name=Title]').val()));
			j$('#preview_subtitle').html(trim(j$('input[name=Subtitle]').val()));
			j$('#preview_authors').html(trim(j$('input[name=Authors]').val()));
			var info = trim(j$('input[name=Publisher]').val())+', '+trim(j$('input[name=City]').val())+', '+trim(j$('select[name=DatePub]').val())+'. ';
			info += trim(j$('input[name=Pages]').val())+' pp., '+trim(j$('input[name=Illustrations]').val())+', ';
			if(trim(j$('input[name=Appendices]').val()).length > 0) info += trim(j$('input[name=Appendices]').val())+', ';
			if (trim(j$('select[name=Size_Width_1]').val()).length > 0) {			
			 info += trim(j$('select[name=Size_Width_1]').val());
			info += (trim(j$('select[name=Size_Width_2]').val()).length > 0) ? '-'+trim(j$('select[name=Size_Width_2]').val())+'x' : 'x'; 
			info += trim(j$('select[name=Size_Height_1]').val());
			info += (trim(j$('select[name=Size_Height_2]').val()).length > 0) ? '-'+trim(j$('select[name=Size_Height_2]').val())+'".' : '".';
		}
		 else {info};
			j$('#preview_info').html(info);
			// and this =>
			j$('#preview_description').html(trim(j$('textarea[name=Description]').val()));
			return true;
		}
		
		renderPreview();
		
		var preview_updater = '';
		
		if(typeof j$.browser.mozilla !== 'undefined' && j$.browser.mozilla && parseInt(j$.browser.version) == 1){			
			j$('.right_pane h2').first().html("Preview (updates after field is filled in)");
			j$('input[name=Title],input[name=Subtitle],input[name=Authors],input[name=Publisher],input[name=City],select[name=DatePub],input[name=Pages],input[name=Illustrations],input[name=Appendices],select[name=Size_Width_1],select[name=Size_Width_2],select[name=Size_Height_1],select[name=Size_Height_2],textarea[name=Description]').change(function(event){
				renderPreview();
				return true;
			});
		}
		else {
			j$('input[name=Title],input[name=Subtitle],input[name=Authors],input[name=Publisher],input[name=City],input[name=Pages],input[name=Illustrations],input[name=Appendices],textarea[name=Description]').keydown(function(event){
				clearTimeout(preview_updater);
				preview_updater = setTimeout(renderPreview,750);
				return true;
			});
			j$('select[name=DatePub],select[name=Size_Width_1],select[name=Size_Width_2],select[name=Size_Height_1],select[name=Size_Height_2]').change(function(event){
				renderPreview();
			});

		}
		
		var _s = 0; // padding offset from top
		var _st = ""; // padding offset timer
		
		j$(window).scroll(function(event){
			_s = j$(window).scrollTop();
/* 			console.log(s); */
			clearTimeout(_st);
			_st = setTimeout(function(){
				if(_s > 295 && _s < 848)
				  j$('.split_container .right_pane').animate({ 'padding-top': _s-295+"px" }, { duration: 200 });
				else
					if(_s < 295)
					  j$('.split_container .right_pane').animate({ 'padding-top': "0px" }, { duration: 200 });
					else
					  j$('.split_container .right_pane').animate({ 'padding-top': 848-295+"px" }, { duration: 200 });				

			},200);
		});
		
		j$('.binding_delete').each(function(){
			(this.checked) ? j$(this).parent().parent().children().first().addClass('deleted') : j$(this).parent().parent().children().first().removeClass('deleted');
		});
		
		j$('.binding_delete').live('click',function(){
			(this.checked) ? j$(this).parent().parent().children().first().addClass('deleted') : j$(this).parent().parent().children().first().removeClass('deleted');		
		});

		j$('.binding_signed').live('click',function(){
			(this.checked) ? j$(this).parent().parent().children().find('.binding_number_suffix').val('SIGNED') :  j$(this).parent().parent().children().find('.binding_number_suffix').val('');		
		});
		
		j$('.binding_number_suffix').live('change',function(){
			if(j$(this).val() === 'SIGNED' && !j$(this).parent().parent().find('.binding_signed').checked) j$(this).parent().parent().find('.binding_signed').attr('checked',true);
		});
		
		if(j$('.langtog').checked) 
			j$('.langtarg').show();
		else
			j$('.langtarg').hide();
		
		j$('.langtog').change(function(){
			(this.checked) ? j$('.langtarg').show() : j$('.langtarg').hide();
		});
		
		j$('#createBinding').change(function(){
			if(j$(this).val() === "") return false;
			bindForm = j$(newBinding(j$(this).val()));
			j$("#bindings_container").prepend(bindForm);
			bindForm.find('input[type="text"]').first().focus();
			j$(this).val('');
			return true;
		});
		
		j$('.cancel').click(function(){
			window.location = '/publisher_direct/catalog';
			return false;
		});
		
		function _keepAlive(){
			j$.ajax({
				url: 'marco.cfm',
				method: 'GET',
				success: function(){
					setTimeout(_keepAlive,300000);
				}
			});
		}
		
		_keepAlive();
	});
</script>

<cfoutput>
<div class="standard_container">
	<h1>Publisher Direct</h1>
	
	#validationErrors()#
	
	<form action="save.cfm" method="post" id="publisher_direct_catalog_form" name="publisher_direct_catalog_form" enctype="multipart/form-data">
		<div class="split_container">
			<div class="left_pane">
				
				<h2>General Information</h2>
				<input type="hidden" name="catnum" value="#editing_catnum#" />
				<div>
					<label>Title *</label>
					<input type="text" name="Title" value="#FORM.Title#" />
				</div>
				<div>
					<label>Subtitle</label>
					<input type="text" name="Subtitle" value="#FORM.Subtitle#" />
				</div>
				<div class="dented note" style="margin-top:0;margin-bottom:0">
					&nbsp;&nbsp;(ex: Photographs by John Doe.  Edited by Jane Lane.)
				</div>
				<div>
					<label>Authors *</label>
					<input type="text" name="Authors" value="#FORM.Authors#" />
				</div>
		<!---
				<div>
					<label>Index Author</label>
					<input type="text" name="IndexAuthors" value="#FORM.IndexAuthors#" />
				</div>
		--->
				<div>
					<label>Publisher *</label>
					<input type="text" name="Publisher" value="#FORM.Publisher#" />
				</div>
				<div>
					<label>City *</label>
					<input type="text" name="City" value="#FORM.City#" />
				</div>
				<div>
					<label>Country *</label>
					<select name="Country">
						<option value="">Select Country</option>
						<cfloop query="qCountries">
							<option value="#qCountries.CountryCode#" <CFIF qCountries.CountryCode is FORM.Country>SELECTED</CFIF>>
								#qCountries.Country#
							</option>
						</cfloop>
					</select>
				</div>
				<div class="dented note" style="margin-top:0;margin-bottom:0">
					&nbsp;&nbsp;(ex: English, German and French)
				</div>
				<div>
					<label>Language(s) *</label>
					<input type="text" name="Language" value="#FORM.Language#" maxlength="27" />
				</div>
				<div>
					<label>Pub. Date *</label>
					<select name="DatePub">
						<option value="">Select Pub. Date</option>
						<cfloop from="#DateFormat(Now(), 'yyyy')+2#" to="1950" index="y" step="-1">
							<option value="#y#" <CFIF FORM.DatePub is y>SELECTED</CFIF>>
								#y#
							</option>
						</cfloop>
					</select>
				</div>
				<div>
					<label>Pages *</label>
					<input type="text" name="Pages" value="#FORM.Pages#" />
				</div>
				<div class="dented note" style="margin-top:0;margin-bottom:0">
					&nbsp;&nbsp;(ex: 22 tritone plates, 15 color illustrations)
				</div>
				<div>
					<label>Illustrations</label>
					<input type="text" name="Illustrations" value="#FORM.Illustrations#" />
				</div>
				<div class="dented note" style="margin-top:0;margin-bottom:0">
					&nbsp;&nbsp;(ex: Bibliography, index)
				</div>
				<div>
					<label>Appendices</label>
					<input type="text" name="Appendices" value="#FORM.Appendices#" />
				</div>
				<div>
					<label>Size in Inches (1 inch = 2.54cm) *</label>
					<select name="Size_Width_1">
						<option value=""></option>
						<cfloop from="1" to="80" index="i">
							<option value="#i#" <cfif FORM.Size_Width_1 EQ i>SELECTED</cfif>>#i#</option>
						</cfloop>
					</select>
					<select name="Size_Width_2">
						<option value=""></option>
						<cfloop list="1/4,1/2,3/4" index="i">
							<option value="#i#" <cfif FORM.Size_Width_2 EQ i>SELECTED</cfif>>#i#</option>
						</cfloop>
					</select>
					width by 
					<select name="Size_Height_1">
						<option value=""></option>
						<cfloop from="1" to="80" index="i">
							<option value="#i#" <cfif FORM.Size_Height_1 EQ i>SELECTED</cfif>>#i#</option>
						</cfloop>
					</select>
					<select name="Size_Height_2">
						<option value=""></option>
						<cfloop list="1/4,1/2,3/4" index="i">
							<option value="#i#" <cfif FORM.Size_Height_2 EQ i>SELECTED</cfif>>#i#</option>
						</cfloop>
					</select> height
				</div>								
				<h2>Description *</h2>
				<div class="dented note" style="margin-top:0;margin-bottom:0">
					&nbsp;&nbsp;Allows HTML like &lt;br /&gt;
				</div>
			
				<div>
					<label>&nbsp;</label>
					<textarea name="Description">#FORM.Description#</textarea>
				</div>
			</div>
			<div class="right_pane">
				<h2>Preview</h2>
				<div id="publisher_direct_catalog_preview">
					<div id="preview_title"></div>
					<div id="preview_subtitle"></div>
					<div id="preview_authors"></div>
					<div id="preview_info"></div>
					<div id="preview_description_header">Publisher's Description</div>
					<div id="preview_description"></div>
				</div>
			</div>
		</div>

		
		<h2>Cover</h2>
		<cfif FileExists(ExpandPath('/img/bigIllus/#qBook.catalog#b.jpg'))>
			<div>
				<label>&nbsp;</label>
				<img src="/img/bigIllus/#qBook.catalog#b.jpg" width="100" />
			</div>
		</cfif>
		<div>
			<label>Upload book cover (500kb max, 1000px on the longest side is recommended, must be at least 350px wide)</label>
			<input type="file" name="bookCover" />
			<cfif FileExists(ExpandPath('/img/bigIllus/#qBook.catalog#b.jpg'))>
				(will replace current image)
			</cfif>
		</div>
		
		<h2>Bindings *</h2>
		<div>
			<label>Select Binding(s)</label>
			<select id="createBinding" name="CreateBinding" STYLE="font-size: 14px">
				<option value="">Select binding type to create</option>
				<cfloop query="qBindings">
					<option value="#qBindings.Binding#">
						#Binding#
					</option>
				</cfloop>
			</select>
		</div>
		<div id="bindings_container">
		
		<cfsavecontent variable="dspExisting">
			<cfset bi = 1 />
				<cfloop query="qBookBindings">
					<cfparam name="FORM.binding_#bi#_number_suffix" default="#parseNumber(qBookBindings.number).suffix#" />
					<cfparam name="FORM.binding_#bi#_ISBN" default="#findISBN(qBook,qBookBindings.number_binding)#" />
					<cfparam name="FORM.binding_#bi#_price" default="#qBookBindings.Price1#" />
					<cfparam name="FORM.binding_#bi#_currency" default="#qBookBindings.currency_id#" />
					<cfparam name="FORM.binding_#bi#_link" default="#qBookBindings.Link#" />
					<cfparam name="FORM.binding_#bi#_OP" default="#qBookBindings.Discont#" />
					<cfparam name="FORM.binding_#bi#_delete" default="0" />
					<div id="binding_#bi#" class="binding_fields" data-id="#bi#">
						<div style="margin-bottom:0px;">
							<h3>#parseNumber(qBookBindings.number).root#-<input type="text" name="binding_#bi#_number_suffix" value="#FORM['binding_#bi#_number_suffix']#" class="binding_number_suffix" maxlength="#20-(len(parseNumber(qBookBindings.number).root)+5)#" /><span style="font-size:10px;color:##666;">  optional custom binding code (ex: "SIGNED", #20-(len(parseNumber(qBookBindings.number).root)+5)# characters max)</span></h3>
							<input type="hidden" name="binding_#bi#_number" value="#qBookBindings.Number#" />
							<input type="hidden" name="binding_#bi#_number_base" value="#parseNumber(qBookBindings.number).root#" />
							<input type="hidden" name="binding_#bi#_id" value="#qBookBindings.autoid#" />
							<div>
								<label>ISBN</label>
								<input type="text" name="binding_#bi#_ISBN" value="#FORM['binding_#bi#_ISBN']#" />
							</div>
							<div>
								<label>Currency</label>
								<select name="binding_#bi#_currency">
									<cfloop query="qCurrencies">
										<option value="#qCurrencies.id#" <cfif qCurrencies.id EQ FORM['binding_#bi#_currency']> SELECTED</cfif>>#qCurrencies.symbol# #qCurrencies.currency# (#qCurrencies.code#)</option>
									</cfloop>
								</select>
							</div>
							<div>
								<label>List Price</label>
								<input type="text" name="binding_#bi#_price" value="#FORM['binding_#bi#_Price']#" />
							</div>
							<div>
								<label>Purchase link</label>
								<input type="text" name="binding_#bi#_link" value="#FORM['binding_#bi#_Link']#" />
							</div>
							<div>
								<label>Binding is signed</label>
								<input type="checkbox"  class="binding_signed" name="binding_#bi#_signed" value="1" <cfif FORM['binding_#bi#_number_suffix'] EQ "SIGNED">CHECKED="checked"</cfif> />
							</div>
							<div>
								<label>No Longer Available</label>
								<input type="checkbox" name="binding_#bi#_OP" value="1" <cfif FORM['binding_#bi#_OP']>CHECKED="checked"</cfif> />
							</div>
						</div>
						<div>
							<label>Delete</label>
							<input type="checkbox" name="binding_#bi#_delete" class="binding_delete" value="1" <cfif  FORM['binding_#bi#_delete']>CHECKED="checked"</cfif> />
						</div>
					</div>
					<cfset bi++ />
				</cfloop>
			</cfsavecontent>
			
			<!--- if the form is being resubmitted (failed validation), then insert / restore the new binding fields --->
			<cfif IsDefined('bindingCount') AND bindingCount GT qBookBindings.recordcount>
				<cfloop from="#qBookBindings.recordcount+1#" to="#bindingCount#" index="i">
					<div id="binding_#i#" class="binding_fields" data-id="#i#">
						<div style="margin-bottom:0px;">
							
							<h3>#FORM['binding_#i#_number_base']#-<input type="text" name="binding_#i#_number_suffix" class="binding_number_suffix" value="#FORM['binding_#i#_number_suffix']#" maxlength="#20-(len(FORM['binding_#i#_number_base'])+5)#" /><span style="font-size:10px;color:##666;"> optional custom binding code (ex: "SIGNED", #20-(len(FORM['binding_#i#_number_base'])+5)# characters max)</span></h3>
							<input type="hidden" name="binding_#i#_new" value="true">
							<input type="hidden" name="binding_#i#_number_base" value="#FORM['binding_#i#_number_base']#">
							<div>
								<label>ISBN</label>
								<input type="text" name="binding_#i#_ISBN" value="#FORM['binding_#i#_ISBN']#">
							</div>
							<div>
								<label>Currency</label>
								<select name="binding_#i#_currency">
									<cfloop query="qCurrencies">
										<option value="#qCurrencies.id#" <cfif qCurrencies.id EQ FORM['binding_#i#_currency']> SELECTED</cfif>>#qCurrencies.symbol# #qCurrencies.currency# (#qCurrencies.code#)</option>
									</cfloop>
								</select>
							</div>
							<div>
								<label>List Price $</label>
								<input type="text" name="binding_#i#_price" value="#FORM['binding_#i#_Price']#">
							</div>
							<div>
								<label>Purchase link</label>
								<input type="text" name="binding_#i#_link" value="#FORM['binding_#i#_Link']#" />
							</div>
							<div>
								<label>Binding is signed</label>
								<input type="checkbox" class="binding_signed" name="binding_#i#_signed" value="1" <cfif FORM['binding_#i#_number_suffix'] EQ "SIGNED">CHECKED="checked"</cfif> />
							</div>
							<div>
								<label>No Longer Available</label>
								<input type="checkbox" name="binding_#i#_OP" value="1" <cfif StructKeyExists(FORM,'binding_#i#_OP')>CHECKED="checked"</cfif> />
							</div>
						</div>
						<div>
							<label>Delete</label>
							<input type="checkbox" name="binding_#i#_delete" class="binding_delete" value="1" <cfif StructKeyExists(FORM,'binding_#i#_delete')>CHECKED="checked"</cfif> />
						</div>
					</div>
				</cfloop>
			</cfif>
			
			#dspExisting#
			
		</div>
		<div>
			<label>&nbsp;</label>
			<input type="submit" value="save" />
			<input type="submit" value="cancel" class="cancel" />
		</div>
	</form>	
</div>
</cfoutput>