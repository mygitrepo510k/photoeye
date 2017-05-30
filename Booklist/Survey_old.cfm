<CFPARAM NAME="Season" DEFAULT="Summer">
<CFPARAM NAME="Year" DEFAULT="2005">

<CFSET xPage="photo-eye booklist">
<CFSET xTitle="Magazine">
<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Survey">

<cfinclude template="../templates/Header.cfm">


<DIV ALIGN="CENTER">

	<CFSET xFontColor = "Black">
	
	<CFIF Page is "Reviews">
		<CFSET xSubTitle = "New Books Reviewed">
	<CFELSEIF Page is "Contact">
		<CFSET xSubtitle = "Contact Us">
	<CFELSEIF Page is "BackIssues">
		<CFSET xSubtitle = "Back Issues">
	<CFELSEIF Page is "SurveyAction">
		<CFSET xSubtitle = "Thank You">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
	
	 <CFINCLUDE TEMPLATE="../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> <br>

<CFSWITCH expression="#Page#">
<CFCASE value = "Survey">
<form method="post" action="survey.cfm?page=SurveyAction">
<style type="text/css">
	.maroontitle {font-family: Trebuchet MS; font-size: 10pt; color:800000; font-weight:bold}
	.standard9 {font-family: arial; font-size: 9pt}
	.standard9bold {font-family: arial; font-size: 9pt; font-weight:bold}
	INPUT {COLOR: Maroon; FONT-Family: Verdana, Arial}
</style>
<table border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td class="maroontitle" style="padding-bottom:12px" align="center">		  We'd appreciate your taking a few minutes to complete the following survey. <br>
		  This anonymous information will help us better serve you. </td>
	</tr>
	<tr>
		<td>
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">1)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">AGE :</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9"><input type="text" name="age" size="3" maxlength="2"></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">2)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">SEX :</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<select size="1" name="gender">
				<option></option>
				<option>Male</option>
				<option>Female</option>
				</select></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">3)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">What is your annual household income?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<select size="1" name="income">
				<option></option>
				<option>Less than $10,000</option>
				<option>$10,000 - 29,999</option>
				<option>$30,000 - 59,999</option>
				<option>$60,00 - 79,999</option>
				<option>$80,000 - 100,000</option>
				<option>Over $100,000</option>
				</select></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">4)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">What is your highest level of education?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<select size="1" name="education">
				<option></option>
				<option>Less than high school</option>
				<option>High School GED:</option>
				<option>Some College</option>
				<option>2-year college degree</option>
				<option>4-year college degree</option>
				<option>Master's Degree</option>
				<option>Doctoral Degree</option>
				<option>Professional Degree</option>
				</select></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">5)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">Where do you live?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9"><input type="text" name="location" size="38"></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">5b)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">If USA, which region?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<select size="1" name="usaregion">
				<option></option>
				<option>Southeast</option>
				<option>Northeast</option>
				<option>Midwest</option>
				<option>Northwest</option>
				<option>Southwest</option>
				<option>Mountain States</option>
				<option>West Coast</option>
				</select></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">6)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">How many photography books do you purchase annually?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<select size="1" name="annualbooks">
				<option></option>
				<option>Under 10</option>
				<option>11-20</option>
				<option>21-30</option>
				<option>Over 30</option>
				</select></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:1px" class="standard9">7)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">How much do you spend on photography books annually?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<select size="1" name="annualbookspending">
				<option></option>
				<option>Under $100</option>
				<option>$100-200</option>
				<option>$200-300</option>
				<option>$300-400</option>
				<option>$500-999</option>
				<option>$1000-1999</option>
				<option>Over $2000</option>
				</select></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">8)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">Where do you buy most of your photography books?&nbsp; Check all that apply.</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td style="padding-right: 5px"><input type="checkbox" name="buyfromphotoeye" value="1"></td>
							<td class="standard9">Photoeye.com</td>
						</tr>
						<tr>
							<td style="padding-right: 5px"><input type="checkbox" name="independentbooksellers" value="1"></td>
							<td class="standard9">Independent booksellers</td>
						</tr>
						<tr>
							<td style="padding-right: 5px"><input type="checkbox" name="onlinebooksellers" value="1"></td>
							<td class="standard9">Online booksellers</td>
						</tr>
						<tr>
							<td style="padding-right: 5px"><input type="checkbox" name="chainbooksellers" value="1"></td>
							<td class="standard9">Chain booksellers</td>
						</tr>
						<tr>
							<td style="padding-right: 5px"><input type="checkbox" name="otherbooksellers" value="1"></td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td style="padding-right: 5px" class="standard9">Other:</td>
										<td><input type="text" name="othersellername" size="20"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">8b)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">What percentage of your photography books purchases are made from photo-eye?</td>
			</tr>

					<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
<select size="1" name="percentage_books_photoeye">
				<option></option>
				<option>None</option>
				<option>1-10%</option>
				<option>11-25%</option>
				<option>26-50%</option>
				<option>51-75%</option>
				<option>75-99%</option>
				<option>All</option>
				</select></td>
			</tr>	
			
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">8c)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">How could we earn more of your business?</td>
			</tr>
			<tr>
			<td style="padding-right: 5px"></td>
				<td class="standard9"><textarea name="earn_more_business" cols="40" rows="5" class="standard9"></textarea></td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9"></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">9)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">Do you collect art/photography? If no, skip to question 10.</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td style="padding-right: 5px"><input type="radio" value="1" name="collectart"></td>
						<td class="standard9">Yes</td>
					</tr>
					<tr>
						<td style="padding-right: 5px"><input type="radio" value="0" name="collectart"></td>
						<td class="standard9">No</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">9b)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">Number of years collecting</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9"><input type="text" name="yearscollecting" size="5" maxlength="2"></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">9c)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">On average, how many prints per year do you collect?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9"><input type="text" name="numberofprints" size="5" maxlength="5"></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">9d)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">Value of art collection :</td>
			</tr>

				
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<select size="1" name="collectionvalue">
				<option></option>
				<option>Under $2,500</option>
				<option>$2,501-5,000</option>
				<option>$5,001-10,000</option>
				<option>$10,001-20,000</option>
				<option>$20,001-50,000</option>
				<option>Over $50,000</option>
				</select></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">10)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">Do you work in the photography industry?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td style="padding-right: 5px"><input type="radio" value="1" name="workinphotography"></td>
						<td class="standard9">Yes</td>
					</tr>
					<tr>
						<td style="padding-right: 5px"><input type="radio" value="0" name="workinphotography"></td>
						<td class="standard9">No</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">11)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">Do you belong to any photography organizations?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td style="padding-right: 5px"><input type="radio" value="1" name="photographyorg"></td>
						<td>
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td style="padding-right: 5px" class="standard9">Yes:</td>
									<td><input type="text" name="whichorgs" size="20" style="color: Maroon; font-family: Verdana, Arial"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="padding-right: 5px"><input type="radio" value="0" name="photographyorg"></td>
						<td class="standard9">No</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">12)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">Number of years you have been a photo-eye Booklist reader :</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9"><input type="text" name="yearsbooklistreader" size="5" maxlength="2"></td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">13)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">Do you read the advertisements in the photo-eye Booklist?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td style="padding-right: 5px"><input type="radio" value="1" name="readadds"></td>
						<td class="standard9">Yes</td>
					</tr>
					<tr>
						<td style="padding-right: 5px"><input type="radio" value="0" name="readadds"></td>
						<td class="standard9">No</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">13b)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">Do you ever act on them?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9">
				<table border="0" cellpadding="0" cellspacing="0" id="table6">
					<tr>
						<td style="padding-right: 5px"><input type="radio" value="1" name="actadds"></td>
						<td class="standard9">Yes</td>
					</tr>
					<tr>
						<td style="padding-right: 5px"><input type="radio" value="0" name="actadds"></td>
						<td class="standard9">No</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 3px; padding-bottom:1px" class="standard9">14)</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:1px" class="standard9">How did you find out about photo-eye?</td>
			</tr>
			<tr>
				<td valign="top" style="padding-right: 5px; padding-bottom:10px" class="standard9">&nbsp;</td>
				<td valign="top" style="padding-right: 10px; padding-bottom:10px" class="standard9"><input type="text" name="findphotoeye" size="38"></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td style="padding-top: 10px" align="center"><input type="submit" value="Submit" name="submitbutton"></td>
	</tr>
</table>
</form>
</CFCASE>

<CFCASE value = "SurveyAction">

	<!--- Store Survey Results --->
	<cfquery name="qSurveyCreate" datasource="Photoeyecom">
		INSERT INTO Survey
		(Age,
		Gender,
		Household_Income,
		Highest_Education,
		Location,
		US_Region,
		AnnualBooks,
		AnnualBookCost,
		<cfif IsDefined("form.buyfromphotoeye")>
			buyfromphotoeye,
		</cfif>
		<cfif IsDefined("form.independentbooksellers")>
			Independant_Booksellers,
		</cfif>
		<cfif IsDefined("form.onlinebooksellers")>
			Online_Booksellers,
		</cfif>
		<cfif IsDefined("form.chainbooksellers")>
			Chain_Booksellers,
		</cfif>
		<cfif IsDefined("form.otherbooksellers")>
			Other_Booksellers,
		</cfif>
		OtherSellerName,
		<cfif IsDefined("form.collectart")>
			Collect_Photography,
		</cfif>		
		Years_Collecting,
		NumberOfPrints,
		Collection_Value,
		<cfif IsDefined("form.workinphotography")>
			Work_In_Photography,
		</cfif>		
		<cfif IsDefined("form.photographyorg")>
			Photography_Organizations,
		</cfif>
		whichorgs,
		Years_Photoeye,
		<cfif IsDefined("form.readAdds")>
			Read_Advertisements,	
		</cfif>
		<cfif IsDefined("form.actadds")>
			Act_on_them,
		</cfif>
		Find_About_Photoeye,
		Earn_More_Business,
		Percentage_books_photoeye,
		TimeCreated)
		
		Values		
		('#form.age#',
		'#form.gender#',
		'#form.income#',
		'#form.education#',
		'#form.location#',
		'#form.usaregion#',
		'#form.annualbooks#',
		'#form.annualbookspending#',
		<cfif IsDefined("form.buyfromphotoeye")>
			#form.buyfromphotoeye#,
		</cfif>
		<cfif IsDefined("form.independentbooksellers")>
			#form.independentbooksellers#,
		</cfif>
		<cfif IsDefined("form.onlinebooksellers")>
			#form.onlinebooksellers#,
		</cfif>
		<cfif IsDefined("form.chainbooksellers")>
			#form.chainbooksellers#,
		</cfif>
		<cfif IsDefined("form.otherbooksellers")>
			#form.otherbooksellers#,
		</cfif>
		'#form.OtherSellerName#',
		<cfif IsDefined("form.collectart")>
			#form.collectart#,
		</cfif>		
		'#form.yearscollecting#',
		'#form.numberofprints#',
		'#form.collectionvalue#',
		<cfif IsDefined("form.workinphotography")>
			#form.workinphotography#,
		</cfif>
		<cfif IsDefined("form.photographyorg")>
			#form.photographyorg#,
		</cfif>		
		'#form.whichorgs#',
		'#form.yearsbooklistreader#',
		<cfif IsDefined("form.readadds")>
			#form.readadds#,
		</cfif>
		<cfif IsDefined("form.actadds")>
			#form.actadds#,
		</cfif>
		'#form.findphotoeye#',
		'#form.Earn_More_Business#',
		'#Percentage_books_photoeye#',
		'#Dateformat(now(), "mm/dd/yyyy")# #Timeformat(now(), "hh:mm:ss tt")#')
	</cfquery>

	<table width="600" align="center">
		<tr>
			<td align="center">Thank you for completing our survey!<br><br>
			
			<cfset page = "Survey">
			<cfinclude template="include_menu.cfm">
			
			</td>
		
		
		</tr>
	</table>

<CFMAIL to="rick@photoeye.com; darius@photoeye.com" from="survey@photoeye.com" subject="Completed Survey" type="html">

<b>Survey Email Contents:</b><br><br>
<b>Age:</b> #form.age#<br><br>
<b>Sex:</b> #form.gender#<br><br>
<b>Household Income:</b> #form.income#<br><br>
<b>Education:</b> #form.education#<br><br>
<b>Location:</b> #form.location#<br><br>
<b>USA Region:</b> #form.usaregion#<br><br>
<b>How Many Photography Books:</b> #form.annualbooks#<br><br>
<b>Annual Photography Book Purchases:</b> #form.annualbookspending#<br><br>
<b>Where do you buy your books?:</b><br>
Photoeye.com - <cfif IsDefined("form.buyfromphotoeye")>#YesNoFormat(form.buyfromphotoeye)#<cfelse>No</cfif><br>
Independant Booksellers - <cfif IsDefined("form.independentbooksellers")>#YesNoFormat(form.independentbooksellers)#<cfelse>No</cfif><br>
Online Booksellers - <cfif IsDefined("form.onlinebooksellers")>#YesNoFormat(form.onlinebooksellers)#<cfelse>No</cfif><br>
Chain Booksellers - <cfif IsDefined("form.chainbooksellers")>#YesNoFormat(form.chainbooksellers)#<cfelse>No</cfif><br>
Other - <cfif IsDefined("form.otherbooksellers")>#YesNoFormat(form.otherbooksellers)#<cfif form.OthersellerName NEQ ""> --- #form.othersellername#</cfif><cfelse>No</cfif><br><br>
<b>What percentage of your photography books purchases are made from photo-eye?</b>#form.percentage_books_photoeye#<br><br>
<b>How could we earn more of your business?</b>#form.earn_more_business#<br><br>
<b>Do you collect photography?:</b> <cfif IsDefined("form.collectart")>#YesNoFormat(form.collectart)#</cfif><br><br>
<b>Number of Years Collecting:</b> #form.yearscollecting#<br><br>
<b>Number of Prints Anually:</b> #form.numberofprints#<br><br>
<b>Value of Collection:</b> #form.collectionvalue#<br><br>
<b>Do you work in the photography industry?:</b> <cfif IsDefined("form.workinphotography")>#YesNoFormat(form.workinphotography)#</cfif><br><br>
<b>Do you belong to any photography Organizations?:</b> <cfif IsDefined("form.photographyorg")>#YesNoFormat(form.photographyorg)#<cfif form.whichorgs NEQ ""> --- #form.WhichOrgs#</cfif></cfif><br><br>
<b>Years as photo-eye Booklist reader:</b> #form.yearsbooklistreader#<br><br>
<b>Do you read ads in the Booklist?:</b> <cfif IsDefined("form.readadds")>#YesNoFormat(form.readadds)#</cfif><br><br>
<b>Do you ever act on ads?:</b> <cfif IsDefined("form.actadds")>#YesNoFormat(form.actadds)#</cfif><br><br>
<b>How did you find photoeye?:</b> #Form.findphotoeye#<br><br><br>

</CFMAIL> 

</cfcase>
</cfswitch>

</DIV>

<BR>
<cfinclude template="../templates/footer_site.cfm">

