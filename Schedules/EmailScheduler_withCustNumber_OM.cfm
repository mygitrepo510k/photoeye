<!--- To Test this script without sending actual emails to customers, set xTesting = 1; you'll get a summary reports and error messages sent to xAdminEmail whether in test mode or not --->
<CFSET xTesting = 1>
<CFSET xAdminEmail = "mmafc@dreamlounge.com">

<!--- Set amount to loop through each time, for both HTML and TXT --->
<CFSET xBatchAmount = 1000>

<!--- Is their a newsletter ready to go out? --->

<CFQUERY Name="qGetNewsletterSender" Datasource="photoeyecom">
	SELECT *
	FROM EmailNewsletterSender
</CFQUERY>

<CFIF (qGetNewsletterSender.NewsletterReady is 0) or (qGetNewsletterSender.VolumeToSend is 0) or (qGetNewsletterSender.NumberToSend is 0)>
	<CFABORT>
</CFIF>

<CFIF (qGetNewsletterSender.VolumeToSend is qGetNewsletterSender.VolumeLastSent) and (qGetNewsletterSender.NumberToSend is qGetNewsletterSender.NumberLastSent) and qGetNewsletterSender.CurrentlySending is 0>
		<cfmail to="#xAdminEmail#" from="newsletter@photoeye.com" subject="CANCELLED - DUPLICATED photo-eye E-News #dateformat(Now(),"mmmm d, yyyy")#" >
			The VolumeToSend and NumberToSend are the same as VolumeLastSent and NumberLastSent! NewsletterReady has been reset to 0 --- that is, the newsletter has been reset NOT to be sent.
		</CFMAIL>
	<CFABORT>
</CFIF>

<!--- Reset EmailNewsletterSender values for the the newsletter before it's sent --->
<CFIF qGetNewsletterSender.CurrentlySending is 0>
	<!--- Clear old stats --->
	<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
		UPDATE EmailNewsletterSender
		SET LoopCounterHTML = 0, 
			LoopCounterTXT = 0,
			NumberSentHTML = 0,
			NumberSentTXT = 0,
			LastEmailUsed = '',
			DateSent = #Now()#,
			CurrentlySending = 1,
			VolumeLastSent = VolumeToSend,
			NumberLastSent = NumberToSend
	</CFQUERY>
	<!--- Get new newsletter field values --->
	<CFQUERY Name="qGetNewsletterSender" Datasource="photoeyecom">
		SELECT *
		FROM EmailNewsletterSender
	</CFQUERY>
</CFIF>

<!--- Get Last Email address successfully sent 
<CFQUERY NAME="qGetLastNLSent" DATASOURCE="photoeyecom">
   SELECT TOP 1 Email, Custnumber, LastNLSent
   FROM MailingList_OM WHERE Email IS NOT NULL AND EMAIL LIKE '%@%' AND NOEMAIL=0 AND NOEMAILNEWSLETTER=0 AND PLAINTEXTVERSION=0
   ORDER BY LastNLSent DESC, Email			
</CFQUERY>--->

<!--- with Cust Number version --->
<CFQUERY NAME="qGetLastNLSent" DATASOURCE="photoeyecom">
   SELECT TOP 1 Email, Custnumber, LastNLSent
   FROM MailingList_OM WHERE Email IS NOT NULL AND EMAIL LIKE '%@%' AND PLAINTEXTVERSION=0
   ORDER BY LastNLSent DESC, Email			
</CFQUERY>

<CFSET xLastNLSentEmail = qGetLastNLSent.Email>
<CFSET xLastNLSentCustNumber = qGetLastNLSent.Custnumber>
<CFSET xLastNLSentDate = qGetLastNLSent.LastNLSent>

<!--- Get Emails for HTML 
<cfquery name="qGetEmails" datasource="photoeyecom" blockfactor="100" cachedwithin="#CreateTimeSpan(0,6,0,0)#">
SELECT DISTINCT Email, Custnumber
   FROM MailingList_OM WHERE Email IS NOT NULL AND EMAIL LIKE '%@%' AND NOEMAIL=0 AND NOEMAILNEWSLETTER=0 AND PLAINTEXTVERSION=0
ORDER BY Email
</cfquery>--->

<!--- with Cust Number version --->
<cfquery name="qGetEmails" datasource="photoeyecom" blockfactor="100" cachedwithin="#CreateTimeSpan(0,6,0,0)#">
SELECT DISTINCT Email, Custnumber
   FROM MailingList_OM WHERE Email IS NOT NULL AND EMAIL LIKE '%@%' AND PLAINTEXTVERSION=0
ORDER BY Email
</cfquery>

<!--- Send HTML newsletter, if there are still addresses to send to --->
<CFIF qGetNewsletterSender.LoopCounterHTML lte qGetEmails.RecordCount>

	<!--- Retry sending the last batch! Send first failure notice to webmaster --->
	<!--- Note: Startrow and Endrow values will still be valid, as the database wasn't successfully updated LAST time --->
	<CFIF qGetNewsletterSender.StartedSending is 1 and qGetNewsletterSender.Retried is 0>
		<!--- Set Retried = 1 --->
		<CFQUERY Name="qUpdateStartedSending" Datasource="photoeyecom">
			UPDATE EmailNewsletterSender
			SET Retried = 1
		</CFQUERY>
		
		<!--- Send out first failure notice to webmaster --->
		<CFSET xLoopCounterAt = qGetNewsletterSender.LoopCounterHTML + 1>	
		
<cfmail to="#xAdminEmail#" from="newsletter@photoeye.com" subject="HTML NEWSLETTER: First failure of batch starting at #xLoopCounterAt#">
HTML Newsletter batch starting at #xLoopCounterAt#

FIRST failure notice

TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#

LAST EMAIL SUCCESSFULLY SENT: 

	Address: #xLastNLSentEmail#
	Cust. ##: #xLastNLSentCustNumber#
	Date: #DateFormat(xLastNLSentDate, "mmmm dd, yyyy")#  #TimeFormat(xLastNLSentDate, "hh:mm:ss")#
	Table: MailingList_OM
</cfmail>
	
	<!--- Already retried sending the last batch!!! Send second failure notice to webmaster --->
	<CFELSEIF qGetNewsletterSender.Retried is 1>

		<!--- Send out second failure notice to webmaster --->
		<CFSET xLoopCounterAt = qGetNewsletterSender.LoopCounterHTML + 1>	
		
<cfmail to="#xAdminEmail#" from="newsletter@photoeye.com" subject="HTML NEWSLETTER: SECOND failure of batch starting at #xLoopCounterAt#!">
HTML Newsletter batch starting at #xLoopCounterAt#

*********************
SECOND failure notice
*********************

TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#

LAST EMAIL SUCCESSFULLY SENT: 

	Address: #xLastNLSentEmail#
	Cust. ##: #xLastNLSentCustNumber#
	Date: #DateFormat(xLastNLSentDate, "mmmm dd, yyyy")#  #TimeFormat(xLastNLSentDate, "hh:mm:ss")#
	Table: MailingList_OM
</cfmail>
	
		<!--- As the database wasn't successfully updated LAST time, Update it now so it skips the double-failed section --->
		<CFSET xEndrow = qGetNewsletterSender.LoopCounterHTML + xBatchAmount>
		<CFQUERY Name="qUpdateRetried" Datasource="photoeyecom">
			UPDATE EmailNewsletterSender
			SET LoopCounterHTML = #xEndrow#,
				StartedSending = 0,
				Retried =0
		</CFQUERY>
		<CFQUERY Name="qGetNewsletterSender" Datasource="photoeyecom">
			SELECT *
			FROM EmailNewsletterSender
		</CFQUERY>
	</CFIF>
	
	<!--- Send the next batch --->
	
	<!--- Set general loop parameters ---> 
	<CFSET xStartrow = qGetNewsletterSender.LoopCounterHTML + 1>
	<CFSET xEndrow = qGetNewsletterSender.LoopCounterHTML + xBatchAmount>
	<cfset xEmailCountHTML = 0>
	<cfset xEmailOld = qGetNewsletterSender.LastEmailUsed>
	
	<!--- Set Started Sending = 1 --->
	<CFQUERY Name="qUpdateStartedSending" Datasource="photoeyecom">
		UPDATE EmailNewsletterSender
		SET StartedSending = 1
	</CFQUERY>
		
	<cfloop query="qGetEmails" startrow="#xStartrow#" endrow="#xEndrow#">
			
		<cfset xEmail=trim(lcase(qGetEmails.email))>
		
		<!--- Since the order is by email, check to see if there are duplicates; this is actually not necessary since we are now using only MailingList_OM and grab the emails with a "distinct" call, but it doesn't hurt to leave it in, I don't think - mmafc --->
		<CFIF (xEmail is not xEmailOld) and (xTesting is not 1)>
		
			<!--- This file outputs xEmail, xCustNumber, xCustNumberLink, xAccountAlreadySetup and xEmailNewsletter --->
			<CFINCLUDE TEMPLATE="Include_CustNumberLinkFinder.cfm">  

			<cfmail to="#xEmail#" from="newsletter@photoeye.com" subject="Illustrated photo-eye E-News #dateformat(Now(),"mmmm d, yyyy")#" type="HTML"><cfinclude template="../emailnewsletter/HTMLNewsletter.cfm"></cfmail>
		
			<cfset xEmailCountHTML=xEmailCountHTML+1>
			
			<!--- Update date sent on all records 
			<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
				UPDATE mailinglist_OM
				SET LastNLSent = #Now()#
				WHERE Email = '#qGetEmails.Email#' AND NOEMAIL=0 AND NOEMAILNEWSLETTER=0 AND PLAINTEXTVERSION=0
			</CFQUERY>--->
			
			<!--- with Cust Number version --->
			<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
				UPDATE mailinglist_OM
				SET LastNLSent = #Now()#
				WHERE Email = '#qGetEmails.Email#' AND PLAINTEXTVERSION=0
			</CFQUERY>
			
		</CFIF>
		
		<!--- Testing purposes, to simulate successful mailing --->
		<CFIF xTesting is 1>
			<cfset xEmailCountHTML=xEmailCountHTML+1>
		</CFIF>
		
		<cfset xEmailOld=xEmail>
				
	</cfloop>

	
	<!--- If retry was successful --->
	<CFIF qGetNewsletterSender.Retried is 1>
		<CFSET xLoopCounterAt = qGetNewsletterSender.LoopCounterHTML + 1>	
<cfmail to="#xAdminEmail#" from="newsletter@photoeye.com" subject="HTML NEWSLETTER: RETRY SUCCESSFUL of batch starting at #xLoopCounterAt#!">
HTML Newsletter batch starting at #xLoopCounterAt#

RETRY SUCCESS!

TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#
</cfmail>
	</CFIF>

	<!--- Update HTML Sent Stats; StartedSending = 0  --->
	<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
		UPDATE EmailNewsletterSender
		SET LoopCounterHTML = #xEndrow#,
			NumberSentHTML = NumberSentHTML + #xEmailCountHTML#,
			LastEmailUsed = '#xEmail#',
			StartedSending = 0,
			Retried =0
	</CFQUERY>

<CFELSE>
	<!--- Get Emails for TXT --->
	<CFQUERY NAME="qGetEmails" DATASOURCE="photoeyecom">
	   		
	</CFQUERY>
	
	<!--- Get Last Email address successfully sent 
	<CFQUERY NAME="qGetLastNLSent" DATASOURCE="photoeyecom">
	  SELECT TOP 1 Email, '0' AS Custnumber, LastNLSent
	  FROM MailingList_OM WHERE Email IS NOT NULL AND EMAIL LIKE '%@%' AND NOEMAIL=0 AND NOEMAILNEWSLETTER=0 AND PLAINTEXTVERSION=1
	  ORDER BY LastNLSent DESC, Email			
	</CFQUERY>--->
	
	<!--- with Cust Number version --->
	<CFQUERY NAME="qGetLastNLSent" DATASOURCE="photoeyecom">
	  SELECT TOP 1 Email, '0' AS Custnumber, LastNLSent
	  FROM MailingList_OM WHERE Email IS NOT NULL AND EMAIL LIKE '%@%' AND PLAINTEXTVERSION=1
	  ORDER BY LastNLSent DESC, Email			
	</CFQUERY>
	
	<CFSET xLastNLSentEmail = qGetLastNLSent.Email>
	<CFSET xLastNLSentCustNumber = qGetLastNLSent.Custnumber>
	<CFSET xLastNLSentDate = qGetLastNLSent.LastNLSent>

	<CFIF qGetNewsletterSender.LoopCounterTXT lte qGetEmails.RecordCount>
		
			<!--- Retry sending the last batch! Send first failure notice to webmaster --->
		<!--- Note: Startrow and Endrow values will still be valid, as the database wasn't successfully updated LAST time --->
		<CFIF qGetNewsletterSender.StartedSending is 1 and qGetNewsletterSender.Retried is 0>
			<!--- Set Retried = 1 --->
			<CFQUERY Name="qUpdateStartedSending" Datasource="photoeyecom">
				UPDATE EmailNewsletterSender
				SET Retried = 1
			</CFQUERY>
			
			<!--- Send out first failure notice to webmaster --->
			<CFSET xLoopCounterAt = qGetNewsletterSender.LoopCounterTXT + 1>	
			
	<cfmail to="#xAdminEmail#" from="newsletter@photoeye.com" subject="TXT NEWSLETTER: First failure of batch starting at #xLoopCounterAt#">
	TXT Newsletter batch starting at #xLoopCounterAt#
	
	FIRST failure notice
	
	TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#
	
	LAST EMAIL SUCCESSFULLY SENT: 
	
		Address: #xLastNLSentEmail#
		Cust. ##: #xLastNLSentCustNumber#
		Date: #DateFormat(xLastNLSentDate, "mmmm dd, yyyy")#  #TimeFormat(xLastNLSentDate, "hh:mm:ss")#
		Table: MailingList_OM
	</cfmail>
		
		<!--- Already retried sending the last batch!!! Send second failure notice to webmaster --->
		<CFELSEIF qGetNewsletterSender.Retried is 1>
		
			<!--- Send out first failure notice to webmaster --->
			<CFSET xLoopCounterAt = qGetNewsletterSender.LoopCounterTXT + 1>	
			
	<cfmail to="#xAdminEmail#" from="newsletter@photoeye.com" subject="TXT NEWSLETTER: SECOND failure of batch starting at #xLoopCounterAt#!">
	TXT Newsletter batch starting at #xLoopCounterAt#
	
	*********************
	SECOND failure notice
	*********************
	
	TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#
	
	LAST EMAIL SUCCESSFULLY SENT: 
	
		Address: #xLastNLSentEmail#
		Cust. ##: #xLastNLSentCustNumber#
		Date: #DateFormat(xLastNLSentDate, "mmmm dd, yyyy")#  #TimeFormat(xLastNLSentDate, "hh:mm:ss")#
		Table: MailingList_OM
	</cfmail>
		
			<!--- As the database wasn't successfully updated LAST time, Update it now so it skips the double-failed section --->
			<CFSET xEndrow = qGetNewsletterSender.LoopCounterTXT + xBatchAmount>
			<CFQUERY Name="qUpdateRetried" Datasource="photoeyecom">
				UPDATE EmailNewsletterSender
				SET LoopCounterTXT = #xEndrow#,
					StartedSending = 0,
					Retried =0
			</CFQUERY>
			<CFQUERY Name="qGetNewsletterSender" Datasource="photoeyecom">
				SELECT *
				FROM EmailNewsletterSender
			</CFQUERY>
		</CFIF>

		
		
		<!--- Reset last email used --->
		<CFIF qGetNewsletterSender.LoopCounterTXT is 0>
			<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
				UPDATE EmailNewsletterSender
				SET LastEmailUsed = ''
			</CFQUERY>
			
			<!--- Get new newsletter field values --->
			<CFQUERY Name="qGetNewsletterSender" Datasource="photoeyecom">
				SELECT *
				FROM EmailNewsletterSender
			</CFQUERY>
		</CFIF>
		
		<!--- Send the next batch --->
		
		<!--- Set loop parameters ---> 
		<!--- If retrying these are still valid, as the database wasn't successfully updated LAST time --->
		<CFSET xStartrow = qGetNewsletterSender.LoopCounterTXT + 1>
		<CFSET xEndrow = qGetNewsletterSender.LoopCounterTXT + xBatchAmount>
		<cfset xEmailOld = qGetNewsletterSender.LastEmailUsed>
		<cfset xEmailCountTXT = 0>
		
		<!--- Set Started Sending = 1 --->
		<CFQUERY Name="qUpdateStartedSending" Datasource="photoeyecom">
			UPDATE EmailNewsletterSender
			SET StartedSending = 1
		</CFQUERY>		
		
		<cfloop query="qGetEmails" startrow="#xStartrow#" endrow="#xEndrow#">
				
			<cfset xEmail=trim(lcase(qGetEmails.email))>
			
			<!--- Since the order is by email, check to see if there are duplicates--->
			<CFIF (xEmail is not xEmailOld) and (xTesting is not 1)>
				
				<cfmail to="#xEmail#" from="newsletter@photoeye.com" subject="photo-eye E-News #dateformat(Now(),"mmmm d, yyyy")#" >
			<cfinclude template="../emailnewsletter/PlainTextNewsletter.txt"></cfmail>
				
				<cfset xEmailCountTXT=xEmailCountTXT+1>
				
				<!--- Update date sent on all records 
				<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
					UPDATE MailingList_OM
					SET LastNLSent = #Now()#
					WHERE Email = '#qGetEmails.Email#' AND NOEMAIL=0 AND NOEMAILNEWSLETTER=0 AND PLAINTEXTVERSION=1
				</CFQUERY>--->
				
				<!--- with Cust Number version --->
				<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
					UPDATE MailingList_OM
					SET LastNLSent = #Now()#
					WHERE Email = '#qGetEmails.Email#' AND PLAINTEXTVERSION=1
				</CFQUERY>
				
			</CFIF>
			
			<!--- Testing purposes, to simulate successful mailing --->
			<CFIF xTesting is 1>
				<cfset xEmailCountTXT=xEmailCountTXT+1>
			</CFIF>
			
			<cfset xEmailOld=xEmail>	
				
	</cfloop>

		<!--- If the batch had to be retried and it was successful, notify the webmaster --->
		<!--- If retry was successful --->
		<CFIF qGetNewsletterSender.Retried is 1>
				<CFSET xLoopCounterAt = qGetNewsletterSender.LoopCounterTXT + 1>	
<cfmail to="#xAdminEmail#" from="newsletter@photoeye.com" subject="TXT NEWSLETTER: RETRY SUCCESSFUL of batch starting at #xLoopCounterAt#!">
TXT Newsletter batch starting at #xLoopCounterAt#

RETRY SUCCESS!

TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#
</cfmail>
		</CFIF>
	
		<!--- Update TXT Sent Stats; StartedSending = 0 --->
		<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
			UPDATE EmailNewsletterSender
			SET LoopCounterTXT = #xEndrow#,
				NumberSentTXT = NumberSentTXT + #xEmailCountTXT#,
				LastEmailUsed = '#xEmail#',
				StartedSending = 0,
				Retried =0
		</CFQUERY>
		
<!--- *** TESTING *** 	
</CFIF>		
--->

	<!--- Done Sending --->
	<CFELSE>
		<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
			UPDATE EmailNewsletterSender
			SET CurrentlySending = 0,
				NewsletterReady = 0,
				LastEmailUsed = ''
		</CFQUERY>
	
		<CFQUERY Name="qGetNewsletterSender" Datasource="photoeyecom">
			SELECT *
			FROM EmailNewsletterSender
		</CFQUERY>
	
		<cfmail to="#xAdminEmail#" from="newsletter@photoeye.com" subject="STATS photo-eye E-News #dateformat(Now(),"mmmm d, yyyy")#" >
			Stats for newsletter sent #DateFormat(qGetNewsletterSender.DateSent, "mmmm dd,yyyy")#
			
			Total HTML emails sent = #qGetNewsletterSender.NumberSentHTML#
			
			Total TXT emails sent = #qGetNewsletterSender.NumberSentTXT#
		</CFMAIL>	
	</CFIF>
</CFIF>

<CFIF xTesting is 1>
<CFQUERY Name="qGetNewsletterSender" Datasource="photoeyecom">
SELECT *
FROM EmailNewsletterSender
</CFQUERY>
<CFOUTPUT>
COMPLETED!
<BR><BR>
Stats for newsletter sent #DateFormat(qGetNewsletterSender.DateSent, "mmmm dd,yyyy")#
<BR><BR>	
Total HTML emails sent = #qGetNewsletterSender.NumberSentHTML#
<BR><BR>		
Total TXT emails sent = #qGetNewsletterSender.NumberSentTXT#
</CFOUTPUT>
</CFIF>