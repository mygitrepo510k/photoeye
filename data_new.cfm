

<cfif cgi.REMOTE_ADDR EQ "xxx168.103.100.212">1a<cfoutput>xAmazonDirect#xAmazonDirect#</cfoutput>
</cfif>

<cfparam name="session.sortfield" default="0">
<cfparam name="session.searchinput" default="0">
<cfparam name="session.searchfield" default="0">
<cfparam name="session.indexfield" default="0">

<cfsetting showdebugoutput="yes">
<cfparam name="AmazonTotalResultsAlreadyinDB" default="0">
<!--- Set param for url.s (how we determine if this is coming from a search page search2.cfm) --->
<cfparam name="url.s" default="0">
<cfparam name="xBrowseNode" default="2020">
<!--- Set the url.i to soft_isbn if hard_isbn doesn't exist --->
<cfif url.s is 0>
	<cfif len(trim(url.i)) is 0>
		<cfset url.i = url.i2>
	</cfif>
</cfif>
<!--- Grab and parse Amazon  --->
<cfparam name="xItemLookup" default="0">
<!---Get the Search Rest Statemet --->

<cftimer label="act_Search_Keyword.cfm" type="debug">
<cfif url.s is "1" and  SearchField NEQ "ISBN">
	<cfswitch expression = "#SearchField#">
		<cfcase value = "Abstract">
		<cfinclude template="act_Search_Keyword.cfm">
		</cfcase>
		<cfcase value = "Title">
		<cfinclude template="act_Search_Title.cfm">
		</cfcase>
		<cfcase value = "Authors">
		<cfinclude template="act_Search_Author.cfm">
		</cfcase>
		<cfcase value = "Publisher">
		<cfinclude template="act_Search_Publisher.cfm">
		</cfcase>
		<!--- TODO: Not sure how to resolve Search by Subject one yet --->
		<cfcase value = "Subject">
		<cfinclude template="act_Search_Keyword.cfm">
		</cfcase>
		<!--- TODO: Not sure how to resolve Search by Catalog yet --->
		<cfcase value = "Catalog">
		<cfinclude template="act_Search_Keyword.cfm">
		</cfcase>
	</cfswitch>
	<cfset xDataRootNode = "ItemSearchResponse">
	<cfset xDataRootNumber = 3>
<cfelse>
			<cfparam name="session.searchinput" default="#url.i#">
			<cfparam name="searchinput" default="#url.i#">
			<cfset searchinput=url.i>
			<cfinclude template="act_Search_keyword_isbn_cataloging.cfm">
			<cfset xDataRootNode = "ItemSearchResponse">
			<cfset xDataRootNumber = 3>
</cfif>
</cftimer>
 


<cfset xdebug = 0>

<!--- use XMLParse function to create tmp variable &Availaility=Available&Condition=All&MerchantID=All--->
<!--- <cftry>
	<cfset qrySearch = XMLParse(AmzSearch.filecontent)>
	<cfcatch>
		<!--- Try again --->
		<cfif url.s is "1" and  SearchField NEQ "ISBN">
			<cfswitch expression = "#SearchField#">
				<cfcase value = "Abstract">
				<cfinclude template="act_Search_Keyword.cfm">
				</cfcase>
				<cfcase value = "ISBN">
					<cfset url.i=session.searchinput>
				<cfinclude template="act_ItemLookup.cfm">
				</cfcase>
				<cfcase value = "Title">
				<cfinclude template="act_Search_Title2.cfm">
				</cfcase>
				<cfcase value = "Authors">
				<cfinclude template="act_Search_Author.cfm">
				</cfcase>
				<cfcase value = "Publisher">
				<cfinclude template="act_Search_Publisher.cfm">
				</cfcase>
				<cfcase value = "Catalog">
				<cfinclude template="act_Search_ISBN.cfm">
				<cfabort>
				</cfcase>
			</cfswitch>
			<cfset xDataRootNode = "ItemSearchResponse">
			<cfset xDataRootNumber = 3>
		<cfelse>
				<cfparam name="url.i" default="#session.searchinput#">
			<cfinclude template="act_ItemLookup.cfm">
			<cfset xDataRootNode = "ItemLookupResponse">
			<cfset xDataRootNumber = 1>
		</cfif>
		<cfset qrySearch = XMLParse(AmzSearch.filecontent)>
	</cfcatch>
</cftry> --->

<cftry>
	<cfset qrySearch = XMLParse(AmzSearch.filecontent)>
	<cfcatch>
		<cfinclude template="/templates/amazon_includes/AmazonServerUnavailable.cfm">
	</cfcatch>
</cftry>


<!--- Set if this is a valid request --->
<cfset chkRequest = evaluate("qrySearch.#xDataRootNode#.Items[1].Request.IsValid.xmltext")>
<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[1]"),"TotalResults")>
	<cfset xTotalResults = evaluate("qrySearch.#xDataRootNode#.Items.TotalResults.xmlText")>
		
	<!--- Added the following structurekeyexists in case the ISBN doesn't exist (as in the case of a photo-eye db only search --->
<cfelseif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items"),"Item")>
	<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items.Item.Offers"),"TotalOffers")>
		<cfset xTotalResults = evaluate("qrySearch.#xDataRootNode#.Items.Item.Offers.TotalOffers.xmlText")>
	</cfif>
	<cfelse>
	<cfset xTotalResults = 0>
</cfif>


<!--- Compare this request's total results with what's already in the Amazon db --->
<!--- Query the amazon db to see how many records there are --->
<!--- 20080911 Added Keyword <> '0' otherwise it will return 1/4 million records!!!! --->

<cfquery datasource="photoeyecom" name="qGetAmazon">
	Select ASIN, Keyword from Amazon 
	where Keyword='#session.searchinput#' and Searchfield='#session.searchfield#'  and browsenode='#xBrowseNode#' and sortfield='#session.Sortfield#' AND keyword <> '0'
</cfquery>

<!--- and Binding <>'Digital' and pubdate<='#xShowPubBeforeThisYear#'  and (TotalNew+TotalUsed+TotalCollectible)> 0 --->
<!--- where Keyword = '#Ucase(session.searchinput)#' and  Searchfield = '#session.searchfield#' --->

<!--- If these don't match continue the query, otherwise don't run the query. Make sure this is not a search item--->
<cfif (AmazonTotalResultsAlreadyinDB NEQ xTotalResults) or url.s is 0>
	<cfset xCompletedAllRestQueries = 0>

<!--- Note this should be -3 for SearchLookups --->
<cfif chkRequest and xTotalResults GT 0>
	<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[1].Request"),"Errors")>
		<cfset xError = evaluate("qrySearch.#xDataRootNode#.Items.Request.Errors.Error.Code.xmlText")>
		<cfif xError is not "AWS.InvalidParameterValue">
			<cfset session.numAmzItem = ArrayLen(evaluate("qrySearch.#xDataRootNode#.items.xmlchildren"))-xDataRootNumber>
			<!--- Set the total number of Pages --->
			<cfif xDataRootNode is 'ItemLookupResponse'>
				<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items.Item.Offers"),"TotalOfferPages")>
					<cfset totalPages=evaluate("qrySearch.#xDataRootNode#.Items.Item.Offers.TotalOfferPages.xmlText")>
					<cfelse>
					<cfset totalPages=0>
				</cfif>
				<cfelse>
				<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items"),"TotalPages")>
					<cfset totalPages=evaluate("qrySearch.#xDataRootNode#.Items.TotalPages.xmlText")>
					<cfelse>
					<cfset totalPages=0>
				</cfif>
			</cfif>
		</cfif>
	</cfif>
</cfif>

<!--- Set the total number of Amazon Titles in request  --->
<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items"),"TotalResults")>
	<cfset TotalResults=evaluate("qrySearch.#xDataRootNode#.Items.TotalResults.xmlText")>
<cfelse>
	<cfif  xDataRootNode is 'ItemLookupResponse'>
		<cfif structkeyexists(evaluate("qrySearch.ItemLookupResponse.Items"),"Item")>
			<cfif structkeyexists(evaluate("qrySearch.ItemLookupResponse.Items.Item.Offers"),"TotalOffers")>
				<cfset TotalResults=evaluate("qrySearch.#xDataRootNode#.Items.Item.Offers.TotalOffers.xmlText")>
				<!---				<cfif TotalResults is 0>
					<cfif structkeyexists(evaluate("qrySearch.ItemLookupResponse.Items.Item"),"OfferSummary")>
						<cfif structkeyexists(evaluate("qrySearch.ItemLookupResponse.Items.Item.OfferSummary"),"TotalNew")>
							<cfset TotalResults=evaluate("qrySearch.#xDataRootNode#.Items.Item.OfferSummary.TotalNew.xmlText")>
						</cfif>
											
					</cfif>
				</cfif>--->
				<cfelse>
				<cfset TotalResults=0>
			</cfif>
			<cfelse>
			<cfset TotalResults=0>
		</cfif>
	</cfif>
</cfif>

<cfif TotalResults is 0>
	<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items"),"Item")>
		<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items.Item"),"OfferSummary")>
			<cfset TotalResults=evaluate("qrySearch.#xDataRootNode#.Items.Item.OfferSummary.TotalNew.xmlText") + 
			evaluate("qrySearch.#xDataRootNode#.Items.Item.OfferSummary.TotalUsed.xmlText") +
			evaluate("qrySearch.#xDataRootNode#.Items.Item.OfferSummary.TotalCollectible.xmlText")>
		</cfif>
	</cfif>
	<cfif TotalResults gt 0>
		<cfset TotalResults = 1>
	</cfif>
</cfif>
<!--- Set the Amazon Direct toggle --->
<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items"),"Item")>
	<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items.Item.Offers"),"TotalOffers")>
		<cfset yTotalOffers = evaluate("qrySearch.#xDataRootNode#.Items.Item.Offers.TotalOffers.xmlText")>
		<cfif yTotalOffers gt 0>
			<cfset xAmazonDirect = 1>
		<cfelse>
			<cfset xAmazonDirect = 0>
		</cfif>
	</cfif>
</cfif>

<cfset xTotalResults = TotalResults>

<!--- Set the Inner Loop Counter Property Remember this is a batch process of 20 possible entries if it is a Search lookup--->
<cfif xTotalResults lt 10>
	<cfset xInnerLoopCounter = xTotalResults>
	<cfelse>
	<cfset xInnerLoopCounter = 10>
</cfif>

<!--- Set if this is a valid request --->
<cfset chkRequest = evaluate("qrySearch.#xDataRootNode#.Items[1].Request.IsValid.xmltext")>
<!--- Count if there are 1 or 2 batches --->
<cfset iCount = 0>
<cfif xDataRootNode is 'ItemSearchResponse'>
	<!--- does Items exist in structure? --->
	<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#"),"Items")>
		<!--- YES! begin looping through ItemLookupResponse to see how many Items keys exist--->
		<cfloop list="#StructKeyList(qrySearch.ItemSearchResponse)#" delimiters="," index="j">
			<!--- Is there a Items key? --->
			<cfif j eq "Items">
				<!--- Yes! increment iCount by 1--->
				<cfset iCount = iCount + 1>
			</cfif>
		</cfloop>
	</cfif>
	<cfset session.numAmzItem = icount>
	<cfelse>
	<cfset session.numAmzItem = ArrayLen(evaluate("qrySearch.#xDataRootNode#.items.xmlchildren"))-xDataRootNumber>
	<cfset icount = 1>
</cfif>
<cfset xdebug = 0>
<cfif xdebug is 1>
	<cfoutput>chkRequest=#chkRequest# xTotalResults=#xTotalResults#</cfoutput><br><br><cfflush>
</cfif>
<cfset xdebug = 0>


<cfif chkRequest and xTotalResults GT 0> 

	<!--- Create the Array to hold all items --->
	<cfset lstItem = ArrayNew(1)>
	<!--- Loop through the retrieved items --->
	<cfset i=1>
	<!--- Setup counter for each item to compare against xTotalResults --->
	<cfset xItemCounter = 0>
	<!--- This is the outer loop of a batch request of potentially 10 each --->

	<cfloop from="1" to="#iCount#" index="x">
		
		<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x]"),"Item")>

<!--- 		YES structkeyexists<BR><BR> --->
			<!--- Make sure we have an ASIN otherwise this will fail --->
			<!---		<cfif structkeyexists(qrySearch.ItemSearchResponse.Items[1].Item[i],"ASIN")>--->
			<!--- set subkey counter to 0 --->
			<cfset bCount = 0>
			<!--- begin looping through Items structure, looking for Item subkey. --->
			<cfloop index="i" from = "1" to = #xInnerLoopCounter#>

				<cfparam name="session.xendbatch" default="1">
				<cfparam name="session.searchinput" default="">
				<cfparam name="session.searchfield" default="">

			
				<cfset xcounter = xTotalResults-((session.xendbatch-2)*10)>

			    <cfif xTotalResults is 1>
			    	<!--- this is a datalookup with 1 record --->
			    	<cfset xcounter = 1>
			    </cfif>
			  <!---   <cfelseif xTotalResults is 20>
			    	<cfset xcounter = 10>
			    <cfelseif xTotalResults lte 10>
			    	<cfset xcounter = xTotalResults>
			    <cfelseif xTotalResults GT 10 and xTotalResults LT 20>	
			    	<cfif i is 1>
			    		<cfset xcounter = 10>
			    	<cfelseif i is 2>
			    		<cfset xcounter = xTotalResults-10>
			    	</cfif>
			    		    
				<cfelseif xcounter lte 0 and session.xendbatch is 2>
					<cfset xcounter = xTotalResults>
				<cfelseif  xcounter lte 0 and session.xendbatch gt 2>
				<!--- 	<cfset xcounter = ((session.xendbatch)*10)-xTotalResults> --->
					<cfset xcounter = xTotalResults-((session.xendbatch-2)*10)>	
				</cfif> --->
						
				<cfif xItemCounter LT xcounter and xItemCounter LTE 20>	

					<cfset bCount = bCount + 1>
					<cfset xItemCounter = xItemCounter+1>
					<!--- Create the Item row --->
					<cfset lstItem[i] = StructNew()>
					<!--- Param the items --->
					<cfparam name="acounttotal" default="0">
					<cfparam name="xAmazonDirect" default="0">
					<cfparam name="xAmazonMarketplace" default="0">
					<cfparam name="lstItem[i].ASIN" default="">
					<cfparam name="lstItem[i].URL" default="">
					<cfparam name="lstItem[i].Title" default="">
					<cfparam name="lstItem[i].Binding" default="">
					<cfparam name="lstItem[i].smImage" default="">
					<cfparam name="lstItem[i].smImageH" default="">
					<cfparam name="lstItem[i].smImageW" default="">
					<cfparam name="lstItem[i].mdImage" default="">
					<cfparam name="lstItem[i].mdImageH" default="">
					<cfparam name="lstItem[i].mdImageW" default="">
					<cfparam name="lstItem[i].lgImage" default="">
					<cfparam name="lstItem[i].lgImageH" default="">
					<cfparam name="lstItem[i].lgImageW" default="">
					<cfparam name="lstItem[i].Price" default="">
					<cfparam name="lstItem[i].AmazonFormattedPrice" default="">
					<cfparam name="lstItem[i].AmazonAmount" default="">
					<cfparam name="lstItem[i].Amount" default="">
					<cfparam name="lstItem[i].ProductGroup" default="">
					<cfparam name="lstItem[i].EditorialReviews" default="">
					<cfparam name="lstItem[i].EditorialReviewSource" default="">
					<cfparam name="lstItem[i].EditorialReviewContent" default="">
					<cfparam name="lstItem[i].CustomerReviewsASIN" default="">
					<cfparam name="lstItem[i].CustomerReviewsAverageRating" default="">
					<cfparam name="lstItem[i].CustomerReviewsContent" default="">
					<cfparam name="lstItem[i].CustomerReviewsCustomerId" default="">
					<cfparam name="lstItem[i].CustomerReviewsDate" default="">
					<cfparam name="lstItem[i].CustomerReviewsHelpfulVotes" default="">					
					<cfparam name="lstItem[i].CustomerReviewsRating" default="">
					<cfparam name="lstItem[i].CustomerReviewsSummary" default="">					
					<cfparam name="lstItem[i].CustomerReviewsTotalPages" default="">
					<cfparam name="lstItem[i].CustomerReviewsTotalResults" default="">					
					<cfparam name="lstItem[i].CustomerReviewsTotalReviewPages" default="">					
					<cfparam name="lstItem[i].CustomerReviewsTotalReviews" default="">
					<cfparam name="lstItem[i].CustomerReviewsTotalVotes" default="">										
					<cfparam name="lstItem[i].available" default="">
					<cfparam name="lstItem[i].TotalNew" default="0">
					<cfparam name="lstItem[i].TotalUsed" default="0">
					<cfparam name="lstItem[i].TotalCollectible" default="0">
					<cfparam name="lstItem[i].OfferListingId" default="0">
					<cfparam name="lstItem[i].IsEligibleForSuperSaverShipping" default="0">
					<cfparam name="lstItem[i].catalogx" default="">
					<cfparam name="lstItem[i].publisher" default="">
					<cfparam name="lstItem[i].isbn" default="">
					<cfparam name="lstItem[i].isbn2" default="">
					<cfparam name="lstItem[i].pubdate" default="">
					<!---	unused		<cfparam name="lstItem[i].pubyear" default="">	--->
					<cfparam name="lstItem[i].keyword" default="">
					<cfparam name="lstItem[i].itempage" default="">
					<cfparam name="lstItem[i].edition" default="">
					<cfparam name="lstItem[i].author" default="">
					<cfparam name="lstItem[i].creator" default="">
					<cfparam name="lstItem[i].DeweyDecimalNumber" default="">
					<cfparam name="lstItem[i].height" default="">
					<cfparam name="lstItem[i].width" default="">
					<cfparam name="lstItem[i].length" default="0">
					<cfparam name="lstItem[i].weight" default="">
					<cfparam name="lstItem[i].EAN" default="">
					<cfparam name="lstItem[i].salesrank" default="">
					<cfparam name="lstItem[i].CurrencyCode" default="">
					<cfparam name="lstItem[i].Numberofpages" default="">
					<cfparam name="lstItem[i].LowestNewPriceAmount" default="">
					<cfparam name="lstItem[i].LowestNewPrice" default="">
					<cfparam name="lstItem[i].LowestNewPriceCurrencyCode" default="">
					<cfparam name="lstItem[i].LowestNewPriceFormattedPrice" default="">
					<cfparam name="lstItem[i].LowestUsedPriceAmount" default="">
					<cfparam name="lstItem[i].LowestUsedPrice" default="">
					<cfparam name="lstItem[i].LowestUsedPriceCurrencyCode" default="">
					<cfparam name="lstItem[i].LowestUsedPriceFormattedPrice" default="">
					<cfparam name="lstItem[i].LowestCollectiblePrice" default="">
					<cfparam name="lstItem[i].LowestCollectiblePriceAmount" default="">
					<cfparam name="lstItem[i].LowestCollectiblePriceCurrencyCode" default="">
					<cfparam name="lstItem[i].LowestCollectiblePriceFormattedPrice" default="">
					<cfparam name="lstItem[i].MerchantId" default="">
					<cfparam name="lstItem[i].TotalUsedOffers" default="">
					<cfparam name="lstItem[i].insertdatetime" default="">
					<cfparam name="xauthor" default="">
				<!--- <cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x]"),"Item[i]")> --->

					<cfset lstItem[i].ASIN = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ASIN.xmltext")>
					<!--- Also set the ISBN (used for clarity in programming --->
					<cfset lstItem[i].ISBN = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ASIN.xmltext")>
					<cfset lstItem[i].TotalNew = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.TotalNew.xmltext")>
					<cfset lstItem[i].TotalUsed = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.TotalUsed.xmltext")>
					<cfset lstItem[i].TotalCollectible = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.TotalCollectible.xmltext")>
			
					<!--- Multiple Creators --->
					<!--- If Creator exists, create the array --->
					<cfset xCreator="">
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"Creator")>
						<cfset lstItem[i].Creator = ArrayNew(1)>
						<cfset aCount = 0>
						<!--- Now insert the Creators/creators into the array--->
						<cfloop list="#StructKeyList(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"))#" delimiters="," index="j">
							<cfif j eq "Creator">
								<cfset aCount = aCount + 1>
								<cfset lstItem[i].Creator[aCount] = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.Creator[aCount].xmlText")>
								<cfset lstItem[i].CreatorRole[aCount] = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.Creator[aCount].XmlAttributes.Role")>
								<cfset lstItem[i].CreatorType[aCount] = 'C'>
								<!--- Determine if Creator is already in db for this title--->
								<cfquery name="getAmazonCreator" datasource="photoeyecom"> 
									Select * from AmazonAuthors where asin='#lstItem[i].ASIN#' and author='#lstItem[i].Creator[aCount]#'
								</cfquery>
								<!--- If not, insert it --->
								<cfif getAmazonCreator.recordcount is 0>
									<cfquery name="insertAmazonCreators" datasource="photoeyecom">
										insert into AmazonAuthors
										(asin, author, type, role) values ('#lstItem[i].ASIN#', '#lstItem[i].Creator[aCount]#','#lstItem[i].CreatorType[aCount]#','#lstItem[i].CreatorRole[aCount]#')
									</cfquery>
									<cfelse>
									<!---<cfoutput>#lstItem[i].Author[aCount]# is already in AmazonAuthors #lstItem[i].ASIN# #acount#<br /></cfoutput>--->
								</cfif>
							</cfif>
						</cfloop>
						<cfset CreatorCountTotal=acount>
						<!--- 					<cfif trim("#lstItem[x].Creator#") neq ""> --->
						<cfset aCount=1>
						<cfloop index="j" from="1" to="#CreatorCountTotal#" step="1">
							<cfif CreatorCountTotal neq 2 and acount eq CreatorCountTotal-1>
								<cfset xPunctuation=", and ">
								<cfelseif CreatorCountTotal gt acount and CreatorCountTotal gt 2 and acount neq CreatorCountTotal>
								<cfset xPunctuation=", ">
								<cfelseif CreatorCountTotal gt acount and CreatorCountTotal is 2>
								<cfset xPunctuation=" and ">
								<cfelse>
								<cfset xPunctuation="">
							</cfif>
							<cfset xCreator="#xCreator##lstItem[i].Creator[aCount]#, #	 lstItem[i].CreatorRole[aCount]##xPunctuation#">
							<cfset acount=acount+1>
						</cfloop>
					</cfif>
					<cfparam name="CreatorCountTotal" default="0">

					<!--- Multiple Authors --->
					<!--- If Author exists, create the array --->
					<cfset xAuthor="">
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"Author")>
						<cfset lstItem[i].Author = ArrayNew(1)>
						<cfset aCount = 0>
						<!--- Now insert the authors/creators into the array--->
						<cfloop list="#StructKeyList(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"))#" delimiters="," index="j">
							<cfif j eq "Author">
								<cfset aCount = aCount + 1>
								<cfset lstItem[i].Author[aCount] = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.Author[aCount].xmlText")>
								<cfset lstItem[i].AuthorType[aCount] = 'A'>
								<!--- Determine if author is already in db for this title--->
								<cfquery name="getAmazonAuthor" datasource="photoeyecom"> 
								Select * from AmazonAuthors where asin='#lstItem[i].ASIN#' and author='#lstItem[i].Author[aCount]#'
							</cfquery>
								<!--- If not, insert it --->
								<cfif getAmazonAuthor.recordcount is 0>
									<cfquery name="insertAmazonAuthors" datasource="photoeyecom">
									insert into AmazonAuthors
									(asin, author, type) values ('#lstItem[i].ASIN#', '#lstItem[i].Author[aCount]#','#lstItem[i].AuthorType[aCount]#')
								</cfquery>
									<cfelse>
									<!---<cfoutput>#lstItem[i].Author[aCount]# is already in AmazonAuthors #lstItem[i].ASIN# #acount#<br /></cfoutput>--->
								</cfif>
								<!--- 	<cfoutput>z#lstItem[i].Author[aCount]# #ACOUNT#</cfoutput> --->
							</cfif>
						</cfloop>
						<cfset AuthorCountTotal=acount>
						<!--- 		<cfparam name="xauthorsx" default="">
					<cfparam name="xAuthor" default=""> --->
						<cfset xAuthorx="">
						<!--- 				<cfif trim("#lstItem[x].Author[x]#") neq ""> --->
						<cfset aCount=1>
						<cfloop index="j" from="1" to="#AuthorCountTotal#" step="1">
							<cfif AuthorCountTotal neq 2 and acount eq AuthorCountTotal-1>
								<cfset xPunctuation=", and ">
								<cfelseif AuthorCountTotal gt acount and AuthorCountTotal gt 2 and acount neq AuthorCountTotal>
								<cfset xPunctuation=", ">
								<cfelseif AuthorCountTotal gt acount and AuthorCountTotal is 2>
								<cfset xPunctuation=" and ">
								<cfelse>
								<cfset xPunctuation="">
							</cfif>
							<cfset xauthor="#xauthor##lstItem[i].Author[aCount]##xPunctuation#">
							<!--- 							<cfoutput>#xauthor#</cfoutput> --->
							<!--- if this is the second item in the search --->
							<!--- 							<cfif i is 2>
								<cfabort>
							</cfif> --->
							<!--- <cfabort>
							<cfset xauthor= evaluate("#xauthor##lstItem[i].Author[aCount]##xPunctuation#")> --->
							<!--- ArrayLen(evaluate("qrySearch.#xDataRootNode#.items.xmlchildren"))-xDataRootNumber --->
							<cfset acount=acount+1>
						</cfloop>
						<!--- <cfoutput>#xauthor#</cfoutput>  --->
						<!--- 					</cfif>
		 --->
					</cfif>
					<cfparam name="AuthorCountTotal" default="0">
					<!--- If DetailPageURL exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"DetailPageURL")>
						
						<cfset lstItem[i].URL = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].DetailPageURL.xmlText")>
						
					</cfif>
				<!--- If Title exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"Title")>
						<cfset lstItem[i].Title = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.Title.xmlText")>
						<!---			lstItem[i].Title=	#lstItem[i].Title#--->
						<cfelse>
						<!---no title--->
					</cfif>
					
					<!--- If Binding exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"Binding")>
						<cfset lstItem[i].Binding = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.Binding.xmlText")>
					</cfif>
					<!--- If SmallImage exists, set the array items --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"SmallImage")>
						<cfset lstItem[i].smImage = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].SmallImage.URL.xmlText")>
						<cfset lstItem[i].smImageH = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].SmallImage.Height.xmlText")>
						<cfset lstItem[i].smImageW = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].SmallImage.Width.xmlText")>
					</cfif>
					<!--- If MediumImage exists, set the array items --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"MediumImage")>
						<cfset lstItem[i].mdImage = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].MediumImage.URL.xmlText")>
						<cfset lstItem[i].mdImageH = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].MediumImage.Height.xmlText")>
						<cfset lstItem[i].mdImageW = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].MediumImage.Width.xmlText")>
					</cfif>
					<!--- If LargeImage exists, set the array items --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"LargeImage")>
						<cfset lstItem[i].lgImage = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].LargeImage.URL.xmlText")>
						<cfset lstItem[i].lgImageH = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].LargeImage.Height.xmlText")>
						<cfset lstItem[i].lgImageW = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].LargeImage.Width.xmlText")>
					</cfif>
					<!--- checks for list price (if available) or lowest used price --->
					<!--- sets price to $0.00 if no pricing info found --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"ListPrice")>
						<cfset lstItem[i].Price = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.ListPrice.FormattedPrice.xmlText")>
						<cfset lstItem[i].Amount = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.ListPrice.Amount.xmlText")>
						<cfset lstItem[i].CurrencyCode = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.ListPrice.CurrencyCode.xmlText")>
						<cfelseif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary"),"LowestUsedPrice")>
							<cfset lstItem[i].Price = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestUsedPrice.FormattedPrice.xmlText")>
							<cfset lstItem[i].Amount = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestUsedPrice.Amount.xmlText")>
							<cfset lstItem[i].CurrencyCode = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestUsedPrice.CurrencyCode.xmlText")>
						<cfelseif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary"),"LowestNewPrice")>
							<cfset lstItem[i].Price = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestNewPrice.FormattedPrice.xmlText")>
							<cfset lstItem[i].Amount = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestNewPrice.Amount.xmlText")>
							<cfset lstItem[i].CurrencyCode = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestNewPrice.CurrencyCode.xmlText")>
						<cfelseif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary"),"LowestUsedPrice")>
							<cfset lstItem[i].Price = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestUsedPrice.FormattedPrice.xmlText")>
							<cfset lstItem[i].Amount = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestUsedPrice.Amount.xmlText")>
							<cfset lstItem[i].CurrencyCode = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestUsedPrice.CurrencyCode.xmlText")>
					<cfelse>
					<!--- If Amazon is selling it there may be an Offer Listing Price --->
						<cfset lstItem[i].Price = DollarFormat(0)>
						<cfset lstItem[i].Amount = 0>
						<cfset lstItem[i].CurrencyCode = 0>		
					</cfif>
					<!--- If ProductGroup exists, set the array items --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"ProductGroup")>
						<cfset lstItem[i].ProductGroup = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.ProductGroup.xmlText")>
					</cfif>
					<!--- If EditorialReviews exists, set the array items --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"EditorialReviews")>
						<!---<cfset lstItem[i].EditorialReviews = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.TotalOfferPages.xmlText")>
	--->
						<cfset lstItem[i].EditorialReviews = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].EditorialReviews.EditorialReview.Content.xmlText")>
					</cfif>
					
<!--- 					<!--- If CustomerReviews exists, set the array items --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"CustomerReviews")>
						<!---<cfset lstItem[i].EditorialReviews = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.TotalOfferPages.xmlText")>
	--->
						<cfset lstItem[i].CustomerReviewsASIN = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.Review.ASIN.xmlText")>
						<cfset lstItem[i].CustomerReviewsAverageRating = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.AverageRating.xmlText")>
						<cfset lstItem[i].CustomerReviewsContent = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.Review.Content.xmlText")>
						<cfset lstItem[i].CustomerReviewsCustomerId = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.Review.CustomerId.xmlText")>
						<cfset lstItem[i].CustomerReviewsDate = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.Review.Date.xmlText")>
						<cfset lstItem[i].CustomerReviewsHelpfulVotes = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.Review.HelpfulVotes.xmlText")>
						<cfset lstItem[i].CustomerReviewsRating = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.Review.Rating.xmlText")>
						<cfset lstItem[i].CustomerReviewsSummary = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.Review.Summary.xmlText")>
						<cfset lstItem[i].CustomerReviewsTotalPages = evaluate("qrySearch.#xDataRootNode#.Items[x].TotalPages.xmlText")>
						<cfset lstItem[i].CustomerReviewsResults = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].TotalResults.xmlText")>
						<cfset lstItem[i].CustomerReviewsReviewPages = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.TotalReviewPages.xmlText")>
						<cfset lstItem[i].CustomerReviewsReviews = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.TotalReviews.xmlText")>
						<cfset lstItem[i].CustomerReviewsVotes = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].CustomerReviews.Review.TotalVotes.xmlText")>			
					</cfif> --->
					
					<!--- If Availability exists, set the array items --->
					<!--- Note that this is checking for the top tier of Offers --->
					<!--- Check if Amazon Direct Exists --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"Offers")>
						<!---	<cfset xAmazonMarketplace = 1>--->
						<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers"),"Offer")>
							<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.Offer"),"OfferListing")>
								<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.Offer.OfferListing"),"Availability")>
									<cfset lstItem[i].available = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.Offer.OfferListing.Availability.xmlText")>
								</cfif>
								<cfset lstItem[i].OfferListingId = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.Offer.OfferListing.OfferListingId.xmlText")>
								<cfset lstItem[i].IsEligibleForSuperSaverShipping = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.Offer.OfferListing.IsEligibleForSuperSaverShipping.xmlText")>
								<cfset lstItem[i].AmazonFormattedPrice = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.Offer.OfferListing.Price.FormattedPrice.xmlText")>
								<cfset lstItem[i].AmazonAmount = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.Offer.OfferListing.Price.Amount.xmlText")>
								<cfset lstItem[i].AmazonPrice = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.Offer.OfferListing.Price.FormattedPrice.xmlText")>
							</cfif>
						</cfif>
					</cfif>
					<!--- Use param for catalogx as there is none for Amazon (used for clarity in programming --->
					<!--- If Publisher exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"Publisher")>
						<cfset lstItem[i].publisher = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.Publisher.xmlText")>
						<!--- Get rid of the comma if the publisher ends with a comma --->
						<cfif Right(trim(lstItem[i].Publisher),1) is ','>
							<cfset xstringlen=len(trim(lstItem[i].Publisher))>
							<cfset lstItem[i].Publisher = trim(left(lstItem[i].Publisher,xstringlen-1))>
						</cfif>
					</cfif>
					<!--- Use param for isbn2  as there is none for Amazon (used for clarity in programming --->
					<!--- If PublicationDate exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"PublicationDate")>
						<cfset lstItem[i].pubdate = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.PublicationDate.xmlText")>
					</cfif>
					<!--- If Edition exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"Edition")>
						<cfset lstItem[i].Edition = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.Edition.xmlText")>
					</cfif>
					<!--- If PackageDimensions exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"PackageDimensions")>
						<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.PackageDimensions"),"Height")>
							<cfset lstItem[i].Height = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.PackageDimensions.Height.xmlText")>
						</cfif>
						<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.PackageDimensions"),"Length")>
							<cfset lstItem[i].Length = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.PackageDimensions.Length.xmlText")>
						</cfif>
						<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.PackageDimensions"),"Width")>
							<cfset lstItem[i].Width = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.PackageDimensions.Width.xmlText")>
						</cfif>
						<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.PackageDimensions"),"Weight")>
							<cfset lstItem[i].Weight = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.PackageDimensions.Weight.xmlText")>
						</cfif>
					</cfif>
					<!--- If EAN exists, set the array item This could be another ISBN choice 13 digits vs 10 digit--->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"EAN")>
						<cfset lstItem[i].EAN = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.EAN.xmlText")>
					</cfif>
					<!--- If DeweyDecimalNumber exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"DeweyDecimalNumber")>
						<cfset lstItem[i].DeweyDecimalNumber = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.DeweyDecimalNumber.xmlText")>
					</cfif>
					<!--- If SalesRank exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"SalesRank")>
						<cfset lstItem[i].SalesRank = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].SalesRank.xmlText")>
					</cfif>
					<!--- If Numberofpages exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes"),"Numberofpages")>
						<cfset lstItem[i].Numberofpages = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].ItemAttributes.Numberofpages.xmlText")>
					</cfif>
					<!--- If LowestNewPrice exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary"),"LowestNewPrice")>
						<cfset lstItem[i].LowestNewPriceAmount = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestNewPrice.Amount.xmlText")>
						<cfset lstItem[i].LowestNewPriceCurrencyCode = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestNewPrice.CurrencyCode.xmlText")>
						<cfset lstItem[i].LowestNewPriceFormattedPrice = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestNewPrice.FormattedPrice.xmlText")>
					</cfif>
					<!--- If LowestUsedPrice exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary"),"LowestUsedPrice")>
						<cfset lstItem[i].LowestUsedPriceAmount = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestUsedPrice.Amount.xmlText")>
						<cfset lstItem[i].LowestUsedPriceCurrencyCode = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestUsedPrice.CurrencyCode.xmlText")>
						<cfset lstItem[i].LowestUsedPriceFormattedPrice = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestUsedPrice.FormattedPrice.xmlText")>
					</cfif>
					<!--- If LowestCollectiblePrice exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary"),"LowestCollectiblePrice")>
						<cfset lstItem[i].LowestCollectiblePriceAmount = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestCollectiblePrice.Amount.xmlText")>
						<cfset lstItem[i].LowestCollectiblePriceCurrencyCode = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestCollectiblePrice.CurrencyCode.xmlText")>
						<cfset lstItem[i].LowestCollectiblePriceFormattedPrice=evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestCollectiblePrice.FormattedPrice.xmlText")>
					</cfif>
					<!--- If EditorialReview exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"EditorialReviews")>
						<cfset lstItem[i].EditorialReviewSource = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].EditorialReviews.EditorialReview.Source.xmlText")>
						<cfset lstItem[i].EditorialReviewContent = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].EditorialReviews.EditorialReview.Content.xmlText")>
						<cfset lstItem[i].EditorialReviewType = 'E'>
					</cfif>
					<!--- If OfferSummary exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"OfferSummary")>
						<cfset lstItem[i].TotalNew = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.TotalNew.xmlText")>
						<cfset lstItem[i].TotalUsed = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.TotalUsed.xmlText")>
						<!---					<cfset lstItem[i].TotalOffers = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.TotalOffers.xmlText")>--->
						<cfset lstItem[i].TotalCollectible = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.TotalCollectible.xmlText")>
						<cfset lstItem[i].TotalUsedOffers = lstItem[i].TotalUsed>
						<cfif lstItem[i].TotalNew gt 0 and lstItem[i].TotalUsed gt 0>
							<cfset lstItem[i].OfferTypes = "New and Used">
							<cfelseif lstItem[i].TotalNew gt 0>
							<cfset lstItem[i].OfferTypes = "New and Used">
							<cfelse>
							<cfset lstItem[i].OfferTypes = "Used">
						</cfif>
						<!--- If there are no offers used or total, then there is no Direct and Marketplace --->
						<cfif lstItem[i].TotalUsedOffers is 0 and lstItem[i].TotalNew is 0 and lstItem[i].TotalCollectible is 0>
							<cfset xAmazonMarketplace = 0>
							<!--- If there is only 1 total offer and only 1 UsedOffer then that used offer is an amazondirect book, don't show it in the Marketplace --->
							<cfelseif xAmazonDirect and lstItem[i].TotalUsedOffers is 1 and lstItem[i].TotalNew is 0 and lstItem[i].TotalCollectible is 0>
							<cfset xAmazonMarketplace = 0>
							<!--- if there are more than one Totaloffers and TotalusedOffers each then there is a Direct and Marketplace offering --->
							<cfelseif xAmazonDirect is 1 and (lstItem[i].TotalUsedOffers gt 1  or  lstItem[i].TotalNew GT 1)>
							<cfset xAmazonMarketplace = 1>
							<!--- If there are no used offerings then there is No marketplace --->
							<cfelseif xAmazonDirect is 0 and lstItem[i].TotalUsedOffers is 0 and lstItem[i].TotalNew is 0 and lstItem[i].TotalCollectible is 0>
							<cfset xAmazonMarketplace = 0>
							<!---if there is no total offes but there is are more than one used offers, then it is a marketplace --->
							<cfelseif xAmazonDirect is 0 and (lstItem[i].TotalUsedOffers gt 0 or lstItem[i].TotalNew gt 0 or lstItem[i].TotalCollectible gt 0)>
							<cfset xAmazonMarketplace = 1>
						</cfif>
						
						<!---						<!--- does current key equal "Offer" if yes, continue processing. if no, loop through to next key in list --->	
						<cfset x=1>	
						<!--- Only loop through offers if this is not a submit button on fullcitation page or Used listings Page --->
						<cfparam name="xFullCitation" default="0">
								<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i]"),"Offers")>		
									<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers"),"Offer")>	
										<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.Offer.Merchant"),"MerchantId")>	
											<cfset lstItem[i].MerchantID = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].Offers.Offer.Merchant.MerchantId.xmlText")>								</cfif>
									</cfif>
								</cfif>
						<cfif xFullCitation is 1>
							<cfif lstItem[i].MerchantID eq "ATVPDKIKX0DER">
							xxxxxxxxxxxxxxx
								<cfset xAmazonDirect = 1>
							<cfelse>
						<cfoutput>lstItem[i].MerchantID=#lstItem[i].MerchantID#</cfoutput>
							</cfif>
						</cfif>--->
						<!--- Set xAmazonMarketplace --->
						<!---						<cfif lstItem[i].TotalOffers gt 1 and xAmazonDirect is 1>
							<cfset xAmazonMarketplace = 1>
						<cfelseif lstItem[i].TotalOffers gt 0 and xAmazonDirect is 0>
							<cfset xAmazonMarketplace = 1>
						<cfelse>
							<cfset xAmazonMarketplace = 0>
						</cfif>		
					</cfif>	--->
					</cfif>
					<!--- If LowestUsedPrice exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary"),"LowestUsedPrice")>
						<cfset lstItem[i].LowestUsedPrice = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestUsedPrice.FormattedPrice.xmlText")>
					</cfif>
					<!--- If LowestNewPrice exists, set the array item --->
					<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary"),"LowestNewPrice")>
						<cfset lstItem[i].LowestNewPrice = evaluate("qrySearch.#xDataRootNode#.Items[x].Item[i].OfferSummary.LowestNewPrice.FormattedPrice.xmlText")>
					</cfif>

				<!--- If this is from search2.cfm --->
				<!---<cfif url.s is 1>--->
				<!--- Find out if this search item is in Amazon --->
				<cfif xdebug is 1>
					<cfoutput> Select ASIN from Amazon where ASIN = '#lstItem[i].ASIN#' </cfoutput>
				</cfif>
				<cfparam name="url.indexfield" default="">				
				<cfparam name="searchinput" default = "">
				<cfparam name="searchfield" default = "">

				
				<cfquery datasource="photoeyecom" name="qGetAmazon">
				Select datetimestamp, ASIN, Keyword from Amazon where ASIN = '#lstItem[i].ASIN#' <cfif len(trim(session.searchinput)) GT 0>and Keyword = '#UCase(session.searchinput)#'</cfif><cfif len(trim(session.searchfield)) GT 0> and  Searchfield = '#session.searchfield#'</cfif> <cfif len(trim(url.indexfield)) GT 0> and Sortfield='#url.indexfield#' and Browsenode='#xbrowsenode#'</cfif> 
				</cfquery>
				<!--- Determine if it's been over 24 hours and thus we need to refresh the db--->
				<cfif qGetAmazon.recordcount gt 0>
					<cfset xdatetimedif=#DateDiff("h", qGetAmazon.datetimestamp, createodbcdatetime(Now()))#>
					<cfif xdatetimedif GTE 24>	
						<cfset xRefreshdb = 1>
					<cfelse>
						<cfset xRefreshdb = 0>
					</cfif>
				</cfif>


				<!--- if it isn't in Amazon.dbf and it's not a Digital binding, and TotalResults (meaning there at least 1 collectible, new, or used item in the OfferSummary) then insert it--->
				<!--- and lstItem[i].TotalNew+lstItem[i].TotalUsed+lstItem[i].TotalCollectible gt 0 --->
				<cfset xEditorialReviews = replace("#lstItem[i].EditorialReviews#","'","''","ALL")>
				<cfif qGetAmazon.recordcount is 0>
				

					<cfquery datasource="photoeyecom" name="qInsertamazon">
					Insert into Amazon 
						(
						Weight,
	                    Width,
	                    Length,
	                    Height,
	                    TotalNew, 
	                    TotalUsed, 
	                    TotalCollectible, 
						LowestNewPriceAmount,			
						LowestNewPriceCurrencyCode,
						LowestNewPriceFormattedPrice,
						LowestUsedPriceAmount,	
						LowestUsedPriceCurrencyCode,			
						LowestUsedPriceFormattedPrice,			
						LowestCollectiblePriceAmount,
						LowestCollectiblePriceFormattedPrice,						
						Price,
						Amount,
						OfferListingId,
						Binding,
	                    Available, 
						Title, 
						Author,
						Creator, 
						Publisher, 
						ASIN, 
						ISBN2, 
						EAN,
						URL,
						pubdate, 
						smimage, 
						smimageh, 
						smimagew,
						mdimage, 
						mdimageh, 
						mdimagew,
						lgimage, 
						lgimageh, 
						lgimagew,
						EditorialReviews,
						Keyword,
						Searchfield,
						Sortfield,
	                    BrowseNode, 
						datetimestamp)
						values (
						'#lstItem[i].Weight#',
						'#lstItem[i].Width#',
						'#lstItem[i].Length#',
						'#lstItem[i].Height#',
	                    '#lstItem[i].TotalNew#',
	                    '#lstItem[i].TotalUsed#',
	                    '#lstItem[i].TotalCollectible#',
						'#lstItem[i].LowestNewPriceAmount#',
						'#lstItem[i].LowestNewPriceCurrencyCode#',
						'#lstItem[i].LowestNewPriceFormattedPrice#',
						'#lstItem[i].LowestUsedPriceAmount#',	
						'#lstItem[i].LowestUsedPriceCurrencyCode#',			
						'#lstItem[i].LowestUsedPriceFormattedPrice#',									
						'#lstItem[i].LowestCollectiblePriceAmount#',
						'#lstItem[i].LowestCollectiblePriceFormattedPrice#',	 	
						'#lstItem[i].Price#',
						'#lstItem[i].Amount#',
						'#lstItem[i].OfferListingId#',
						'#lstItem[i].Binding#',
						'#lstItem[i].Available#', 
						'#lstItem[i].Title#',
						'#xAuthor#',
						'#xCreator#',
						'#lstItem[i].Publisher#',
						'#lstItem[i].ASIN#',
						'#lstItem[i].ISBN2#',
						'#lstItem[i].EAN#',
						'#lstItem[i].URL#',
						'#lstItem[i].pubdate#',
						'#lstItem[i].smimage#',
						'#lstItem[i].smimageh#',
						'#lstItem[i].smimagew#',
						'#lstItem[i].mdimage#',
						'#lstItem[i].mdimageh#',
						'#lstItem[i].mdimagew#',
						'#lstItem[i].lgimage#',
						'#lstItem[i].lgimageh#',
						'#lstItem[i].lgimagew#',
						'#xEditorialReviews#',
						'#UCase(session.searchinput)#',
						'#session.searchfield#',
						'#session.indexfield#',
	                    '#xBrowseNode#',
						#createodbcdatetime(Now())#
						)
					</cfquery> 
			
				<!--- </cfif> --->

								<!--- '#xEditorialReviews#', --->				<!--- EditorialReviews, --->
				<cfelse>
				
			
					
				
				<cfif xRefreshdb is 1>
				
				<!---	<cfif cgi.REMOTE_ADDR EQ "71.216.245.69">
				<cfoutput>
				
								Update Amazon set 
					TotalNew='#lstItem[i].TotalNew#',
					TotalUsed='#lstItem[i].TotalUsed#',
					TotalCollectible='#lstItem[i].TotalCollectible#',
					LowestNewPriceAmount='#lstItem[i].LowestNewPriceAmount#',
					LowestNewPriceCurrencyCode='#lstItem[i].LowestNewPriceCurrencyCode#',
					LowestNewPriceFormattedPrice='#lstItem[i].LowestNewPriceFormattedPrice#',
					LowestUsedPriceAmount='#lstItem[i].LowestUsedPriceAmount#',
					LowestUsedPriceCurrencyCode='#lstItem[i].LowestUsedPriceCurrencyCode#',
					LowestUsedPriceFormattedPrice='#lstItem[i].LowestUsedPriceFormattedPrice#',
					LowestCollectiblePriceAmount='#lstItem[i].LowestCollectiblePriceAmount#',
					LowestCollectiblePriceFormattedPrice='#lstItem[i].LowestCollectiblePriceFormattedPrice#',
					Price='#lstItem[i].Price#',
					Amount='#lstItem[i].Amount#',
					OfferListingId='#lstItem[i].OfferListingId#',
					Binding='#lstItem[i].Binding#',
					Available='#lstItem[i].Available#',
					Title='#lstItem[i].Title#',
					Author='#xAuthor#',
					Creator='#xCreator#',
					Publisher ='#lstItem[i].Publisher#',
					ASIN ='#lstItem[i].ASIN#',
					ISBN2 ='#lstItem[i].ISBN2#',
					EAN='#lstItem[i].EAN#',
					<!--- URL='#1stItem[i].URL#', --->
					pubdate ='#lstItem[i].pubdate#',
					smimage ='#lstItem[i].smimage#',
					smimageh ='#lstItem[i].smimageh#',
					smimagew='#lstItem[i].smimagew#',
					mdimage ='#lstItem[i].mdimage#',
					mdimageh ='#lstItem[i].mdimageh#',
					mdimagew='#lstItem[i].mdimagew#',
					lgimage ='#lstItem[i].lgimage#',
					lgimageh ='#lstItem[i].lgimageh#',
					lgimagew='#lstItem[i].lgimagew#',
					EditorialReviews='#xEditorialReviews#',
					Keyword='#UCase(session.searchinput)#',
					Searchfield='#UCase(session.searchfield)#',
					Sortfield='#session.indexfield#',
                    BrowseNode ='#xBrowseNode#',
					datetimestamp=#createodbcdatetime(Now())#
					where ASIN = '#lstItem[i].ASIN#' <cfif len(trim(session.searchinput)) GT 0>and Keyword = '#UCase(session.searchinput)#'</cfif><cfif len(trim(session.searchfield)) GT 0> and  Searchfield = '#session.searchfield#'</cfif> <cfif len(trim(session.indexfield)) GT 0> and Sortfield='#session.indexfield#' and Browsenode='#xbrowsenode#'</cfif>
					</cfoutput>
					</cfif>--->
	
				
					<cfquery datasource="photoeyecom" name="qUpdateamazon">
					Update Amazon set 
					Weight = '#lstItem[i].Weight#',
					Length = '#lstItem[i].Length#',
					Width = '#lstItem[i].Width#',
					Height = '#lstItem[i].Height#',
					TotalNew='#lstItem[i].TotalNew#',
					TotalUsed='#lstItem[i].TotalUsed#',
					TotalCollectible='#lstItem[i].TotalCollectible#',
					LowestNewPriceAmount='#lstItem[i].LowestNewPriceAmount#',
					LowestNewPriceCurrencyCode='#lstItem[i].LowestNewPriceCurrencyCode#',
					LowestNewPriceFormattedPrice='#lstItem[i].LowestNewPriceFormattedPrice#',
					LowestUsedPriceAmount='#lstItem[i].LowestUsedPriceAmount#',
					LowestUsedPriceCurrencyCode='#lstItem[i].LowestUsedPriceCurrencyCode#',
					LowestUsedPriceFormattedPrice='#lstItem[i].LowestUsedPriceFormattedPrice#',
					LowestCollectiblePriceAmount='#lstItem[i].LowestCollectiblePriceAmount#',
					LowestCollectiblePriceFormattedPrice='#lstItem[i].LowestCollectiblePriceFormattedPrice#', 
					Price='#lstItem[i].Price#',
					Amount='#lstItem[i].Amount#',
					OfferListingId='#lstItem[i].OfferListingId#',
					Binding='#lstItem[i].Binding#',
					Available='#lstItem[i].Available#', 
					Title='#lstItem[i].Title#',
					Author='#xAuthor#',
					Creator='#xCreator#',
					Publisher ='#lstItem[i].Publisher#',
					ASIN ='#lstItem[i].ASIN#',
					ISBN2 ='#lstItem[i].ISBN2#',
					EAN='#lstItem[i].EAN#',
					<!--- URL='#1stItem[i].URL#', --->
					pubdate ='#lstItem[i].pubdate#',
					smimage ='#lstItem[i].smimage#',
					smimageh ='#lstItem[i].smimageh#',
					smimagew='#lstItem[i].smimagew#',
					mdimage ='#lstItem[i].mdimage#',
					mdimageh ='#lstItem[i].mdimageh#',
					mdimagew='#lstItem[i].mdimagew#',
					lgimage ='#lstItem[i].lgimage#',
					lgimageh ='#lstItem[i].lgimageh#',
					lgimagew='#lstItem[i].lgimagew#', 
					EditorialReviews='#xEditorialReviews#',
					Keyword='#UCase(session.searchinput)#',
					Searchfield='#UCase(session.searchfield)#',
					Sortfield='#session.indexfield#',
                    BrowseNode ='#xBrowseNode#', 
					datetimestamp=#createodbcdatetime(Now())#
					where ASIN = '#lstItem[i].ASIN#' <cfif len(trim(session.searchinput)) GT 0>and Keyword = '#UCase(session.searchinput)#'</cfif><cfif len(trim(session.searchfield)) GT 0> and  Searchfield = '#session.searchfield#'</cfif> <cfif len(trim(session.indexfield)) GT 0> and Sortfield='#session.indexfield#' and Browsenode='#xbrowsenode#'</cfif>  
					</cfquery>
				
					
				</cfif>
			
						
						
	                     

						<cfparam name="xloopdebug" default="0">
						<cfif xloopdebug is 2>
							<cfbreak>				
						</cfif>
					</cfif>	
					<cfif xdebug is 1>
						Record NOT Inserted
					</cfif>
				</cfif>
			</cfloop>
		</cfif>
	</cfloop>
	<!--- If this is a search, set variable if we should rerun the batch query so that we can get 20 items on a page --->


	<!---<CFELSEIF chkRequest and xTotalResults is 0>
<cfoutput>
<!--- Check and see if there is some image information --->
	<!--- Create the Array to hold all items --->
	<cfset lstItem = ArrayNew(1)>		

	<!--- Loop through the retrieved items --->
	<cfset i=1>
	<!--- Setup counter for each item to compare against xTotalResults --->
	<cfset xItemCounter = 0>

	<!--- This is the outer loop of a batch request of potentially 10 each --->


	<!---
		<cfset lstItem[i] = StructNew()>

					<cfoutput>	<cfparam name="lstItem[i].smImage" default="">
					<cfparam name="lstItem[i].smImageH" default="">
					<cfparam name="lstItem[i].smImageW" default="">
					<cfparam name="lstItem[i].mdImage" default="">
					<cfparam name="lstItem[i].mdImageH" default="">
					<cfparam name="lstItem[i].mdImageW" default="">
					<cfparam name="lstItem[i].lgImage" default="">
					<cfparam name="lstItem[i].lgImageH" default="">
					<cfparam name="lstItem[i].lgImageW" 

		<!--- If SmallImage exists, set the array items --->
				<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items.Item[i]"),"SmallImage")>
					<cfset lstItem[i].smImage = evaluate("qrySearch.#xDataRootNode#.Items.Item[i].SmallImage.URL.xmlText")>
					<cfset lstItem[i].smImageH = evaluate("qrySearch.#xDataRootNode#.Items.Item[i].SmallImage.Height.xmlText")>
					<cfset lstItem[i].smImageW = evaluate("qrySearch.#xDataRootNode#.Items.Item[i].SmallImage.Width.xmlText")>
				</cfif>
				
				<!--- If MediumImage exists, set the array items --->
				<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items.Item[i]"),"MediumImage")>  
					<cfset lstItem[i].mdImage = evaluate("qrySearch.#xDataRootNode#.Items.Item[i].MediumImage.URL.xmlText")>
					<cfset lstItem[i].mdImageH = evaluate("qrySearch.#xDataRootNode#.Items.Item[i].MediumImage.Height.xmlText")>
					<cfset lstItem[i].mdImageW = evaluate("qrySearch.#xDataRootNode#.Items.Item[i].MediumImage.Width.xmlText")>
				</cfif>
				
				<!--- If LargeImage exists, set the array items --->
				<cfif structkeyexists(evaluate("qrySearch.#xDataRootNode#.Items.Item[i]"),"LargeImage")>  
					<cfset lstItem[i].lgImage = evaluate("qrySearch.#xDataRootNode#.Items.Item[i].LargeImage.URL.xmlText")>
					<cfset lstItem[i].lgImageH = evaluate("qrySearch.#xDataRootNode#.Items.Item[i].LargeImage.Height.xmlText")>
					<cfset lstItem[i].lgImageW = evaluate("qrySearch.#xDataRootNode#.Items.Item[i].LargeImage.Width.xmlText")>
				</cfif>--->
				</cfoutput>--->
				
<cfelse>

	<!---Search REQUEST not found --->
	<cfif IsDefined("SearchInput")>
		<!---		<br />
		<div align="center"><cfoutput>#ucase(SearchInput)#</cfoutput> was not found in the Amazon database! Please retry.<br /></div>--->
		<cfif xBrowseNode is 2020>
			<cfparam name="xtitle2x" default="">
			<cfparam name="url.catalog" default="">
			<cfparam name="url.i" default="">
			<cfparam name="url.i2" default="">
			<cfmail to="rick@photoeye.com" from="webmaster@photoeye.com" subject="photo-eye ISBN not in Amazon">
				The following Keyword was not in Amazon's database:
				<cfif len(trim(xTitle2x)) gt 0>
					#xTitle2x#
				</cfif>
				<cfif len(trim(url.catalog)) gt 0>
					#url.catalog#
				</cfif>
				<cfif len(trim(url.i)) gt 0>
					#url.i#
				</cfif>
				<cfif len(trim(url.i2)) gt 0>
					#url.i2#
				</cfif>
			</cfmail>
		</cfif>
	</cfif>
</cfif> 
<cfelse>
	<cfset xCompletedAllRestQueries = 1>
</cfif> <!--- TotalResults of Query don't match the amazon database record count--->
<!--- If there are no results because of a bad ISBN --->
<cfif xTotalResults is 0>
	<cfset xNoData = "1">
<cfelse>
	<cfset xNoData = "0">
</cfif>

