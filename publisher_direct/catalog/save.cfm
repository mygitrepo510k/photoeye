<style>
	pre { background: #444; color: #ffb266; padding: 50px;}
	pre a { color: #ffb266; }
</style>
<cfset _debug = false />
<cfoutput> 
<cftransaction>
	
	<cfset editing_catnum = FORM.catnum />
	<cfset sqlQueries = ArrayNew(1) />
	
	<cfif NOT ReFindNoCase('^I[0-9]{4}',editing_catnum)>
		<h2>Uh-oh.</h2>
		<ul class="error_messages">
			<li>
				Catalog number was malformed.
			</li>
		</ul>
		<cfabort />
	</cfif>
	
	<cfquery name="qBookOwner" dataSource="photoeyecom">
		SELECT * FROM publisher_direct_catalog
		WHERE catalog = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" maxLength="5" value="#editing_catnum#" />
		AND publisher_direct_id = #SESSION.publisher_direct_id#
	</cfquery>
	
	<cfif NOT qBookOwner.recordcount>
		<h2>Uh-oh.</h2>
		<ul class="error_messages">
			<li>
				Could not find book.
			</li>
		</ul>
		<cfabort />
	</cfif>
	
	<cfquery name="qBook" dataSource="photoeyecom">
		SELECT * FROM inventory
		WHERE catalog = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" maxLength="5" value="#editing_catnum#" />
	</cfquery>
	
	<cfquery name="qBookBindings" dataSource="photoeyecom">
		SELECT s.*, s.number, ps.*, ps.number FROM stock AS s
		LEFT JOIN Publisher_Direct_Bindings AS ps
		ON s.number = ps.number
		WHERE substring(s.number,1,5) = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" maxLength="5" value="#editing_catnum#" />
	</cfquery>
	<!--- trim all the form data --->
	<cfloop list="#FORM.fieldnames#" index="fn">
		<cfset FORM[fn] = TRIM(FORM[fn]) />
	</cfloop>
		
	<cfinclude template="includes/act_validate.cfm" />
	
	<cfif Len(FORM.bookcover) GT 0>
<!--- 		Image uploading...<br /><br /> --->
		<cffile action="upload"
				 destination="#GetTempDirectory()#"
				 fileField="bookcover" 
				 nameConflict="MakeUnique"
				 result="uploadResult"/>
		<cfimage action="info"
				 source="#GetTempDirectory()#\#uploadResult.serverFile#"
				 structname="uploadInfo" />
		<cfif uploadInfo.width GT 0 AND uploadInfo.height GT 0>
			<cfif uploadInfo.width GT 349>
<!--- 					Valid image, write #GetTempDirectory()#\#uploadResult.serverFile# to #ExpandPath('/img/bigIllus/')##qBook.catalog#b.jpg...<br /><br /> --->
					<cfif uploadInfo.width GT 1000 OR uploadInfo.height GT 1000>
						<cfif uploadInfo.width GT uploadInfo.height>
							<cfset _h = "" />
							<cfset _w = "1000" />
						<cfelse>
							<cfset _h = "1000" />
							<cfset _w = "" />						
						</cfif>
						<cfimage action="resize"
								 source="#GetTempDirectory()#\#uploadResult.serverFile#"
								 destination="#ExpandPath('/img/bigIllus/')##qBook.catalog#b.jpg"
								 quality="0.90"
								 height="#_h#"
								 width="#_w#"
								 overwrite="true" />	
					<cfelse>
						<cfimage action="write"
								 source="#GetTempDirectory()#\#uploadResult.serverFile#"
								 destination="#ExpandPath('/img/bigIllus/')##qBook.catalog#b.jpg"
								 quality="0.90"
								 overwrite="true" />
					</cfif>
				
			<cfelse>
				<cfset pdError("bookCover",'Image uploaded is only #uploadInfo.width# pixels wide, it must be at least 350px.') />
			</cfif>
		<cfelse>
			<cfthrow message="File uploaded: #clientFile# to #uploadResult.serverFile# not a valid image" />
		</cfif>
	<cfelse>
<!--- 		No image uploaded...<br /><br /> --->
	</cfif>
	
	<cfif isDefined('_errors')>
<!--- 		Errors found...<br /><br /> --->
		<cfinclude template="edit.cfm" />
		<cfabort />
	</cfif>
	
	<!--- the validator will break and reload the form if necessary, code below ONLY fires if valid data was passed --->
<!--- 	<br /><br />VALID! --->
	
	<!--- STEP 1: Bindings --->
	<cfset bindingTypes = StructNew() />
	
	<cfset bindingTypes.HB = 0 />
	<cfset bindingTypes.HB_ISBN = "" />
	<cfset bindingTypes.SB = 0 />
	<cfset bindingTypes.SB_ISBN = "" />
	<cfset bindingTypes.LTD = 0 />
	<cfset bindingTypes.LTD_ISBN = "" />
	<cfset bindingTypes.EB = 0 />
	<cfset bindingTypes.EB_ISBN = "" />
	
	
	<cfloop from="1" to="#bindingCount#" index="i">
<!--- 		Resolving binding #i#... --->
		<!--- track our binding types --->
		<cfif NOT StructKeyExists(FORM,'binding_#i#_delete')>
			<cfif Right(FORM['binding_#i#_number_base'],2) EQ "HB">
				<cfset bindingTypes.HB = 1 />
				<cfif len(FORM['binding_#i#_ISBN'])>
					<cfset bindingTypes.HB_ISBN = FORM['binding_#i#_ISBN'] />
				</cfif>
			<cfelseif Right(FORM['binding_#i#_number_base'],2) EQ "SB">
				<cfset bindingTypes.SB = 1 />
				<cfif len(FORM['binding_#i#_ISBN'])>
					<cfset bindingTypes.SB_ISBN = FORM['binding_#i#_ISBN'] />
				</cfif>
			<cfelseif Right(FORM['binding_#i#_number_base'],2) EQ "EB">
				<cfset bindingTypes.EB = 1 />
				<cfif len(FORM['binding_#i#_ISBN'])>
					<cfset bindingTypes.EB_ISBN = FORM['binding_#i#_ISBN'] />
				</cfif>
			<cfelse> <!--- LTD --->
				<cfset bindingTypes.LTD = 1 />
				<cfif len(FORM['binding_#i#_ISBN'])>
					<cfset bindingTypes.LTD_ISBN = FORM['binding_#i#_ISBN'] />
				</cfif>
			</cfif>
		</cfif>
	
		<cfset bindingUpdate = StructNew() />
		<cfset bindingUpdate.Number = "#replace(FORM['binding_#i#_number_base'],' ','     ')#" />	
		<cfif len(FORM['binding_#i#_number_suffix'])>
			<cfset bindingUpdate.Number &= "-#FORM['binding_#i#_number_suffix']#" />	
		</cfif>
		<cfset bindingUpdate.Number_root = qBook.catalog />
		<cfset bindingUpdate.Number_binding = "#Mid(bindingUpdate.Number,11,len(bindingUpdate.Number))#" />
		<cfset bindingUpdate.Price1 = "#Replace(FORM['binding_#i#_price'],',','','ALL')#" />
		
		<cfif StructKeyExists(FORM,'binding_#i#_OP')>
			<cfset bindingUpdate.Discont = 1 />
			<cfset bindingUpdate.Units = 0 />
		<cfelse>
			<cfset bindingUpdate.Discont = 0 />
			<!--- Units should always be 0 to avoid appearing in Today's Bookshelf, etc. --->
			<cfset bindingUpdate.Units = 0 />
		</cfif>
		<cfset bindingUpdate.Link = "#FORM['binding_#i#_link']#" />
		<cfif Left(bindingUpdate.Link,4) NEQ "http">
			<cfset bindingUpdate.Link = "http://"&bindingUpdate.Link />
		</cfif>
		<cfset bindingUpdate.Currency_id = FORM['binding_#i#_currency'] />
		<cfif StructKeyExists(FORM,'binding_#i#_new')>
<!--- 			new binding... --->
			<cfif NOT StructKeyExists(FORM,'binding_#i#_delete')>
<!--- 				not deleted... --->
				<!--- new binding --->
				<cfif _debug>
					<cfsavecontent variable="newQuery">
						INSERT into STOCK (Number,Number_root,Number_binding,Units,Price1,Discont)
						VALUES ('#bindingUpdate.Number#','#bindingUpdate.Number_root#','#bindingUpdate.Number_binding#',#bindingUpdate.Units#,#bindingUpdate.price1#,#bindingUpdate.Discont#)
						
						INSERT into PUBLISHER_DIRECT_BINDINGS (Number,Catalog,Link,Currency_id,Click_stat)
						VALUES ('#bindingUpdate.Number#','#editing_catnum#','#bindingUpdate.Link#',#bindingUpdate.Currency_id#,0)
					</cfsavecontent>
					<cfset ArrayAppend(sqlQueries, newQuery) />
				<cfelse>
					<cfquery name="qInsertStock" datasource="#application.dsn#">
						INSERT into STOCK (Number,Number_root,Number_binding,Units,Price1,Discont)
						VALUES (<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#bindingUpdate.Number#" />,
						<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#bindingUpdate.Number_root#' />,
						<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#bindingUpdate.Number_binding#' />,
						<cfqueryparam CFSQLType="CF_SQL_INTEGER" value='#bindingUpdate.Units#' />,
						<cfqueryparam CFSQLType="CF_SQL_FLOAT" value='#bindingUpdate.Price1#' />,
						<cfqueryparam CFSQLType="CF_SQL_BIT" value="#bindingUpdate.Discont#" />)
								
						INSERT into PUBLISHER_DIRECT_BINDINGS (Number,Catalog,Link,Currency_id,Click_stat)
						VALUES (<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#bindingUpdate.Number#' />,
								<cfqueryparam CFSQLType="CF_SQL_VARCHAR" maxLength="5" value="#editing_catnum#" />,
								<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#bindingUpdate.Link#" />,
								<cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#bindingUpdate.Currency_id#" />,0)
					</cfquery>
				</cfif>
			<cfelse>
<!--- 				deleted, ignore... --->
			</cfif>
		<cfelseif StructKeyExists(FORM,'binding_#i#_delete')>
<!--- 			pending removal... --->
			<!--- existing binding to remove --->
			<cfif _debug>
				<cfsavecontent variable="newQuery">
					DELETE from STOCK 
					WHERE substring(number,1,5) = '#qBook.catalog#'
						AND autoID = #FORM['binding_#i#_id']#
						
					DELETE from PUBLISHER_DIRECT_BINDINGS
					WHERE number = '#FORM['binding_#i#_number']#'
						AND catalog = '#editing_catnum#'
				</cfsavecontent>
				<cfset ArrayAppend(sqlQueries, newQuery) />
			<cfelse>
				<cfquery name="qDeleteStock" dataSource="#application.dsn#">
					DELETE from STOCK 
					WHERE substring(number,1,5) = '#qBook.catalog#'
						AND autoID = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#FORM['binding_#i#_id']#" />
						
					DELETE from PUBLISHER_DIRECT_BINDINGS
					WHERE number = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM['binding_#i#_number']#" />
						AND catalog = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" maxLength="5" value="#editing_catnum#" />
	
				</cfquery>		
			</cfif>
		<cfelse>
<!--- 			pending update... --->
			<!--- exisitng binding to update --->
			<cfif _debug>
				<cfsavecontent variable="newQuery">
					UPDATE STOCK 
					SET 
						Number = #bindingUpdate.Number#,
						Number_root = '#bindingUpdate.Number_root#',
						Number_binding = '#bindingUpdate.Number_binding#',
						Units = #bindingUpdate.Units#,
						Price1 = '#bindingUpdate.Price1#',
						Discont = #bindingUpdate.Discont#
					WHERE substring(number,1,5) = '#qBook.catalog#'
						AND autoID = #FORM['binding_#i#_id']#
						
					UPDATE PUBLISHER_DIRECT_BINDINGS
					SET
						Number = '#bindingUpdate.Number#',
						Link = '#bindingUpdate.Link#',
						Currency_id = #bindingUpdate.Currency_id#
					WHERE
						Number = '#FORM['binding_#i#_number']#'	
				</cfsavecontent>
				<cfset ArrayAppend(sqlQueries, newQuery) />
			<cfelse>
				<cfquery name="qUpdateStock" dataSource="photoeyecom">
					UPDATE STOCK 
					SET 
						Number = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#bindingUpdate.Number#" />,
						Number_root = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#bindingUpdate.Number_root#' />,
						Number_binding = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#bindingUpdate.Number_binding#' />,
						Units = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value='#bindingUpdate.Units#' />,
						Price1 = <cfqueryparam CFSQLType="CF_SQL_FLOAT" value='#bindingUpdate.Price1#' />,
						Discont = <cfqueryparam CFSQLType="CF_SQL_BIT" value="#bindingUpdate.Discont#" />
					WHERE substring(number,1,5) = '#qBook.catalog#'
						AND autoID = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#FORM['binding_#i#_id']#" />
						
					UPDATE PUBLISHER_DIRECT_BINDINGS
					SET
						Number = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#bindingUpdate.Number#" />,
						Link = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#bindingUpdate.Link#" />,
						Currency_id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#bindingUpdate.Currency_id#" />
					WHERE
						Number = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM['binding_#i#_number']#" />
				</cfquery>		
			</cfif>
		</cfif>
	</cfloop>
	
	<!--- STEP 2: Inventory --->
	
	<cfset inventoryUpdate = StructNew() />
	<cfset inventoryUpdate.catalog = qBook.catalog />
	
	<!--- !todo: make a real bindingTypeList and bindingCatList --->
	
	<cfset inventoryUpdate.title2 = UCASE(FORM.Title) />
	<cfset inventoryUpdate.title2x = FORM.Title />
	
	<cfset inventoryUpdate.subtitle = UCASE(FORM.Subtitle) />
	<cfset inventoryUpdate.subtitlex = FORM.Subtitle />
	
	<cfset inventoryUpdate.authors = UCASE(FORM.Authors) />
	<cfset inventoryUpdate.authorsx = FORM.Authors />
	
	<cfset inventoryUpdate.publisher = UCASE(FORM.Publisher) />
	<cfset inventoryUpdate.publisherx = FORM.Publisher />
	
	<cfset inventoryUpdate.city = UCASE(FORM.City) />
	<cfset inventoryUpdate.cityx = FORM.City />
	
	<cfset inventoryUpdate.datepub = FORM.DatePub />
	<cfset inventoryUpdate.pages = FORM.Pages />
	<cfset inventoryUpdate.illustrat = FORM.Illustrations />
	<cfset inventoryUpdate.appendices = FORM.Appendices />
	
	<cfset inventoryUpdate.sizex = FORM.Size_Width_1 />
	<cfif FORM.Size_Width_2 NEQ "">
		<cfset inventoryUpdate.sizex &= "-#FORM.Size_Width_2#" />
	</cfif>
	<cfset inventoryUpdate.sizex &= "x#FORM.Size_Height_1#" />
	<cfif FORM.Size_Height_2 NEQ "">
		<cfset inventoryUpdate.sizex &= "-#FORM.Size_Height_2#" />
	</cfif>
	<!--- NOPE, this pushes a "full" size out of the DB limits, citation page appends " anyway --->
	<!--- <cfset inventoryUpdate.sizex &= '"' /> --->
	
	<!--- !todo: this --->
	<cfset inventoryUpdate.categoryno = "" />
	
	<cfset inventoryUpdate.subject = "PUBLISHER DIRECT" />
	<cfset inventoryUpdate.subjectx = "DIRECT, PUBLISHER" />
	
	<!--- !todo: deal with these --->
	<cfset inventoryUpdate.hard_nyp = 0 />
	<cfset inventoryUpdate.hard_due = "" />
	<cfset inventoryUpdate.soft_nyp = 0 />
	<cfset inventoryUpdate.soft_due = "" />
	
	<cfset inventoryUpdate.video = 0 />
	
	<cfset bindingCatList = "" />
	<cfif bindingTypes.HB>
		<cfset bindingCatList &="#qBook.catalog#H " />
	</cfif>
	<cfif bindingTypes.SB>
		<cfset bindingCatList &="#qBook.catalog#S " />
	</cfif>
	<cfif bindingTypes.EB>
		<cfset bindingCatList &="#qBook.catalog#E " />
	</cfif>
	<cfif bindingTypes.LTD>
		<cfset bindingCatList &="#qBook.catalog#L" />
	</cfif>
	
	<cfset inventoryUpdate.ocr = UCASE("#FORM.Title# #FORM.Subtitle# #FORM.Authors# #FORM.Publisher# #FORM.Description# #bindingCatList#") />
	<cfset inventoryUpdate.ocrx = FORM.Description />
	
	<cfif UCASE(FORM.Language) EQ "ENGLISH">
		<cfset inventoryUpdate.language = "" />
	<cfelse>
		<cfset inventoryUpdate.language = FORM.Language />
	</cfif>
	
	<cfif FORM.Country EQ "001">
		<cfset inventoryUpdate.Country = "" />
	<cfelse>
		<cfset inventoryUpdate.Country = FORM.Country />
	</cfif>
	
	<cffunction name="updateInventory" description="I commit updates to the inventory table" output="yes">
		<cfargument name="up" required="true" type="struct" />
		<cfset var qUpdateInventory = "" />
		<cfset var newQuery = "" />
<!--- 		<cfdump var="#up#" /> --->
		<cfif _debug>
			<cfsavecontent variable="newQuery">
				UPDATE inventory
				SET
					hardbound = #up.hardbound#,
					hard_isbn = '#up.hard_isbn#',
					softbound = #up.softbound#,
					soft_isbn = '#up.soft_isbn#',
					ltd_editio = #up.ltd_editio#,
					video = #up.video#,
					title2 = '#up.title2#',
					title2x = '#up.title2x#',
					subtitle = '#up.subtitle#',
					subtitlex = '#up.subtitlex#',
					authors = '#up.authors#',
					authorsx = '#up.authorsx#',
					publisher = '#up.publisher#',
					publisherx = '#up.publisherx#',
					city = '#up.city#',
					cityx = '#up.cityx#',
					datepub = '#up.datepub#',
					pages = '#up.pages#',
					illustrat = '#up.illustrat#',
					appendices = '#up.appendices#',
					sizex = '#up.sizex#',
					categoryno = '#up.categoryno#',
					subject = '#up.subject#',
					subjectx = '#up.subjectx#',
					ocr = '#up.ocr#',
					ocrx = '#up.ocrx#',
					hard_nyp = #up.hard_nyp#,
					hard_due = '#up.hard_due#',
					soft_nyp = #up.soft_nyp#,
					soft_due = '#up.soft_due#',
					country = '#up.country#',
					language = '#up.language#',
					use_pe_image_only = 1
				WHERE catalog = '#up.catalog#'
			</cfsavecontent>
			<cfset ArrayAppend(sqlQueries, newQuery) />
		<cfelse>
			<cfquery name="qUpdateInventory" dataSource="#application.dsn#">
				UPDATE inventory
				SET
					hardbound = <cfqueryparam CFSQLType="CF_SQL_BIT" value="#up.hardbound#" />,
					hard_isbn = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#up.hard_isbn#" />,
					softbound = <cfqueryparam CFSQLType="CF_SQL_BIT" value="#up.softbound#" />,
					soft_isbn = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#up.soft_isbn#" />,
					ltd_editio = <cfqueryparam CFSQLType="CF_SQL_BIT" value="#up.ltd_editio#" />,
					video = <cfqueryparam CFSQLType="CF_SQL_BIT" value="#up.video#" />,
					title2 = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.title2#' />,
					title2x = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.title2x#' />,
					subtitle = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.subtitle#' />,
					subtitlex = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.subtitlex#' />,
					authors = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.authors#' />,
					authorsx = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.authorsx#' />,
					publisher = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.publisher#' />,
					publisherx = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.publisherx#' />,
					city = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.city#' />,
					cityx = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.cityx#' />,
					datepub = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.datepub#' />,
					pages = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.pages#' />,
					illustrat = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.illustrat#' />,
					appendices = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.appendices#' />,
					sizex = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.sizex#' />,
					categoryno = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.categoryno#' />,
					subject = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.subject#' />,
					subjectx = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.subjectx#' />,
					ocr = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.ocr#' />,
					ocrx = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.ocrx#' />,
					hard_nyp = <cfqueryparam CFSQLType="CF_SQL_BIT" value="#up.hard_nyp#" />,
					hard_due = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.hard_due#' />,
					soft_nyp = <cfqueryparam CFSQLType="CF_SQL_BIT" value="#up.soft_nyp#" />,
					soft_due = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.soft_due#' />,
					country = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.country#' />,
					language = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.language#' />,
					use_pe_image_only = 1
				WHERE catalog = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#up.catalog#' />
			</cfquery>
		</cfif>
	</cffunction>
	
	<cfif NOT bindingTypes.LTD>
<!--- 		No limited edition found, only 1 record needed...<br /><br /> --->
		<cfset inventoryUpdate.hardbound = bindingTypes.HB />
		<cfset inventoryUpdate.hard_isbn = bindingTypes.HB_ISBN />	
		<cfset inventoryUpdate.softbound = bindingTypes.SB />
		<cfset inventoryUpdate.soft_isbn = bindingTypes.SB_ISBN />
		<cfset inventoryUpdate.softbound = bindingTypes.EB />
		<cfset inventoryUpdate.soft_isbn = bindingTypes.EB_ISBN />
		<cfset inventoryUpdate.ltd_editio = 0 />
		<cfif qBook.recordCount GT 1>
			<cfquery name="qAlreadyTwoRecords" dbType="query">
				SELECT * FROM qBook
				WHERE ltd_editio = 1
			</cfquery>
			<cfif qAlreadyTwoRecords.recordcount EQ 1>
<!--- 				Two records found, removing one...<br /><br /> --->
				<cfif _debug>
					<cfsavecontent variable="newQuery">
						DELETE FROM inventory
						WHERE catalog = '#qBook.catalog#'
						AND ltd_editio = 1
					</cfsavecontent>
					<cfset ArrayAppend(sqlQueries, newQuery) />
				<cfelse>
					<cfquery name="qDeleteInventory" datasource="#application.dsn#">
						DELETE FROM inventory
						WHERE catalog = '#qBook.catalog#'
						AND ltd_editio = 1
					</cfquery>
				</cfif>
			</cfif>
		</cfif>
<!--- 		Updating...<br /><br /> --->
		<cfset updateInventory(inventoryUpdate) />
			
	<cfelseif NOT bindingTypes.HB AND NOT bindingTypes.SB AND NOT bindingTypes.EB>
<!--- 		Just a limited edition, only 1 record needed...<br /><br /> --->
		<cfset inventoryUpdate.hardbound = 1 />
		<cfset inventoryUpdate.hard_isbn = bindingTypes.LTD_ISBN />	
		<cfset inventoryUpdate.softbound = 0 />
		<cfset inventoryUpdate.soft_isbn = '' />
		<cfset inventoryUpdate.ltd_editio = 1 />
		<cfif qBook.recordCount GT 1>
			<cfquery name="qAlreadyTwoRecords" dbType="query">
				SELECT * FROM qBook
				WHERE ltd_editio = 0
			</cfquery>
			<cfif qAlreadyTwoRecords.recordcount EQ 1>
				Two records found, removing one...<br /><br />
				<cfif _debug>
					<cfsavecontent variable="newQuery">
						DELETE FROM inventory
						WHERE catalog = '#qBook.catalog#'
						AND ltd_editio = 0
					</cfsavecontent>
					<cfset ArrayAppend(sqlQueries, newQuery) />
				<cfelse>
					<cfquery name="qDeleteInventory" dataSource="#application.dsn#">
						DELETE FROM inventory
						WHERE catalog = '#qBook.catalog#'
						AND ltd_editio = 0
					</cfquery>
				</cfif>
			</cfif>
		</cfif>
<!--- 		Updating...<br /><br /> --->
		<cfset updateInventory(inventoryUpdate) />
		
	<cfelseif bindingTypes.LTD AND (bindingTypes.HB OR bindingTypes.SB OR bindingTypes.EB)>
<!--- 		Multiple bindings including LTD found, multiple records required...<br /><br /> --->
		<cfif qBook.recordCount GT 1>
<!---
			Multiple records already exist...<br /><br />
			Updating HB / SB...<br /><br />
--->
			<cfset inventoryUpdate.hardbound = bindingTypes.HB />
			<cfset inventoryUpdate.hard_isbn = bindingTypes.HB_ISBN />	
			<cfset inventoryUpdate.softbound = bindingTypes.SB />
			<cfset inventoryUpdate.soft_isbn = bindingTypes.SB_ISBN />
			<cfset inventoryUpdate.softbound = bindingTypes.EB />
			<cfset inventoryUpdate.soft_isbn = bindingTypes.EB_ISBN />
			<cfset inventoryUpdate.ltd_editio = 0 />
			
			<cfset updateInventory(inventoryUpdate) />
<!---
			
			Updating LTD...<br /><br />
--->
			<cfset inventoryUpdate.hardbound = 1 />
			<cfset inventoryUpdate.hard_isbn = bindingTypes.LTD_ISBN />	
			<cfset inventoryUpdate.softbound = 0 />
			<cfset inventoryUpdate.soft_isbn = '' />
			<cfset inventoryUpdate.ltd_editio = 1 />
	
			<cfset updateInventory(inventoryUpdate) />
	
		<cfelse>
	
<!---
			Only 1 record exists...<br /><br />
			Updating HB / SB...<br /><br />
--->
			<cfset inventoryUpdate.hardbound = bindingTypes.HB />
			<cfset inventoryUpdate.hard_isbn = bindingTypes.HB_ISBN />	
			<cfset inventoryUpdate.softbound = bindingTypes.SB />
			<cfset inventoryUpdate.soft_isbn = bindingTypes.SB_ISBN />
			<cfset inventoryUpdate.softbound = bindingTypes.EB />
			<cfset inventoryUpdate.soft_isbn = bindingTypes.EB_ISBN />
			<cfset inventoryUpdate.ltd_editio = 0 />
	
			<cfset updateInventory(inventoryUpdate) />
	
<!--- 			Inserting LTD...<br /><br /> --->
			<cfset inventoryUpdate.hardbound = 1 />
			<cfset inventoryUpdate.hard_isbn = bindingTypes.LTD_ISBN />	
			<cfset inventoryUpdate.softbound = 0 />
			<cfset inventoryUpdate.soft_isbn = '' />
			<cfset inventoryUpdate.ltd_editio = 1 />
<!--- 			<cfdump var="#inventoryUpdate#" /> --->
			<cfif _debug>
				<cfsavecontent variable="newQuery">
					INSERT INTO inventory ( catalog,
								hardbound,
								hard_isbn,
								softbound,
								soft_isbn,
								ltd_editio,
								video,
								title2,
								title2x,
								subtitle,
								subtitlex,
								authors,
								authorsx,
								publisher,
								publisherx,
								city,
								cityx,
								datepub,
								pages,
								illustrat,
								appendices,
								sizex,
								categoryno,
								subject,
								subjectx,
								ocr,
								ocrx,
								hard_nyp,
								hard_due,
								soft_nyp,
								soft_due,
								country,
								language,
								use_pe_image_only)
					VALUES ('#qBook.catalog#',
							 #inventoryUpdate.hardbound#,
							'#inventoryUpdate.hard_isbn#',
							 #inventoryUpdate.softbound#,
							'#inventoryUpdate.soft_isbn#',
							 #inventoryUpdate.ltd_editio#,
							 #inventoryUpdate.video#,
							'#inventoryUpdate.title2#',
							'#inventoryUpdate.title2x#',
							'#inventoryUpdate.subtitle#',
							'#inventoryUpdate.subtitlex#',
							'#inventoryUpdate.authors#',
							'#inventoryUpdate.authorsx#',
							'#inventoryUpdate.publisher#',
							'#inventoryUpdate.publisherx#',
							'#inventoryUpdate.city#',
							'#inventoryUpdate.cityx#',
							'#inventoryUpdate.datepub#',
							'#inventoryUpdate.pages#',
							'#inventoryUpdate.illustrat#',
							'#inventoryUpdate.appendices#',
							'#inventoryUpdate.sizex#',
							'#inventoryUpdate.categoryno#',
							'#inventoryUpdate.subject#',
							'#inventoryUpdate.subjectx#',
							'#inventoryUpdate.ocr#',
							'#inventoryUpdate.ocrx#',
							 #inventoryUpdate.hard_nyp#,
							'#inventoryUpdate.hard_due#',
							 #inventoryUpdate.soft_nyp#,
							'#inventoryUpdate.soft_due#',
							'#inventoryUpdate.country#',
							'#inventoryUpdate.language#',
							1)
				</cfsavecontent>
				<cfset ArrayAppend(sqlQueries, newQuery) />
			<cfelse>
				<cfquery name="qInsertInventory" dataSource="#application.dsn#">
					INSERT INTO inventory ( catalog,
											hardbound,
											hard_isbn,
											softbound,
											soft_isbn,
											ltd_editio,
											video,
											title2,
											title2x,
											subtitle,
											subtitlex,
											authors,
											authorsx,
											publisher,
											publisherx,
											city,
											cityx,
											datepub,
											pages,
											illustrat,
											appendices,
											sizex,
											categoryno,
											subject,
											subjectx,
											ocr,
											ocrx,
											hard_nyp,
											hard_due,
											soft_nyp,
											soft_due,
											country,
											language,
											use_pe_image_only )
					VALUES ('#qBook.catalog#',
							<cfqueryparam CFSQLType="CF_SQL_BIT" value="#inventoryUpdate.hardbound#" />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#inventoryUpdate.hard_isbn#" />,
							<cfqueryparam CFSQLType="CF_SQL_BIT" value="#inventoryUpdate.softbound#" />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#inventoryUpdate.soft_isbn#" />,
							<cfqueryparam CFSQLType="CF_SQL_BIT" value="#inventoryUpdate.ltd_editio#" />,
							<cfqueryparam CFSQLType="CF_SQL_BIT" value="#inventoryUpdate.video#" />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.title2#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.title2x#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.subtitle#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.subtitlex#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.authors#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.authorsx#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.publisher#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.publisherx#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.city#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.cityx#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.datepub#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.pages#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.illustrat#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.appendices#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.sizex#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.categoryno#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.subject#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.subjectx#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.ocr#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.ocrx#' />,
							<cfqueryparam CFSQLType="CF_SQL_BIT" value="#inventoryUpdate.hard_nyp#" />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.hard_due#' />,
							<cfqueryparam CFSQLType="CF_SQL_BIT" value="#inventoryUpdate.soft_nyp#" />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.soft_due#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.country#' />,
							<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value='#inventoryUpdate.language#' />,
							1)
				</cfquery>
			</cfif>
			
		</cfif>
	</cfif>
</cftransaction>
	
	<cfif _debug>
		
		<cfdump var="#sqlQueries#" />
		<pre>
			<cfloop from="1" to="#ArrayLen(sqlQueries)#" index="i">
				#sqlQueries[i]#
			</cfloop>
		</pre>
		
		<pre>
			<cfloop from="1" to="#ArrayLen(sqlQueries)#" index="i">
				&lt;cfquery name="qQuery#i#" dataSource="#application.dsn#"&gt;
					#sqlQueries[i]#
				&lt;/cfquery&gt;
			</cfloop>
		</pre>
	<cfelse>
<!---
		<cfquery name="qBook" dataSource="photoeyecom">
			SELECT * FROM inventory
			WHERE catalog = '#qBook.catalog#'
		</cfquery>
		<cfdump var="#qBook#" />
--->
		<cflocation url="/#application.root#/catalog?saved=#qBook.catalog#" addToken="no" />
	</cfif>


</cfoutput>
