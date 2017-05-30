<!--- EmailSender.cfm is built to send out any file (HTML, TXT or both) to everyone on the MailingList_OM mailing list. Possible Filter over-rides are SendToNOEMAIL and SendToNOEMAILNEWSLETTER. Specify file names to send out (file names are relative to "/Schedules" folder) --->

<!--- To Test this script without sending actual emails to customers, set xTesting = 1; you'll get a summary reports and error messages sent to xAdminEmail whether in test mode or not --->
<CFSET xTesting = 1>
<CFSET xAdminEmail = "mmafc@dreamlounge.com">

<!--- Set amount to loop through each time, for both HTML and TXT --->
<CFSET xBatchAmount = 400>

<!--- Is their a File ready to go out? --->

<CFQUERY Name="qGetEmailSender" Datasource="photoeyecom">
	SELECT *
	FROM EmailSender
</CFQUERY>

<!--- Is there a file ready to send? --->
<CFIF (qGetEmailSender.ReadyToSend is 0)>
	<CFABORT>
</CFIF>

<!--- Do the files to send exist? --->
<CFIF not FileExists(ExpandPath(qGetEmailSender.FileToSendHTML)) or qGetEmailSender.FileToSendHTML is ''>
	<CFSET xHTMLFile = "">
<CFELSE>
	<CFSET xHTMLFile = qGetEmailSender.FileToSendHTML>
</CFIF>

<CFIF not FileExists(ExpandPath(qGetEmailSender.FileToSendTXT)) or qGetEmailSender.FileToSendTXT is ''>
	<CFSET xTXTFile = "">
<CFELSE>
	<CFSET xTXTFile = qGetEmailSender.FileToSendTXT>
</CFIF>

<!--- Is there a file specified that exists? --->
<CFIF xHTMLFile is "" and xTXTFile is "">
	<CFIF xTesting is 1>
	No HTML or TXT file has been specified for the bulk email to be sent out and/or the files don't exist, yet ReadyToSend has been set to 1. ReadyToSend has automatically been reset to 0, the mailing will NOT continue.
	</CFIF>
	<cfmail to="#xAdminEmail#" from="webmaster@photoeye.com" subject="Error - Email Sender photo-eye E-News #dateformat(Now(),"mmmm d, yyyy")#" >
			No HTML or TXT file has been specified for the bulk email to be sent out and/or the files don't exist, yet ReadyToSend has been set to 1. ReadyToSend has automatically been reset to 0, the mailing will NOT continue.
	</CFMAIL>
	<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
		UPDATE EmailSender
		SET ReadyToSend = 0
	</CFQUERY>
	<CFABORT>
</CFIF>

<!--- Set which column to update in MailingList_OM with date sent to email addresses --->
<CFSET xEmailSentColumn = qGetEmailSender.EmailSentColumn>

<!--- If EmailSentColumn is blank, abort; future admin page for BE should test to see if this column exists in MailingList_OM, or perhaps if it doesn't exist, have SQL make it --->
<CFIF xEmailSentColumn is "">
	<CFIF xTesting is 1>
	EmailSentColumn is blank in EmailSender table. This is the name of the column in MailingList_OM that keeps track of the date that an email address is sent to, if you have a particular mailing to keep track of, you'll most likely want to make a new column, or you could make a general column like LastBESent (BE=Bulk Email). In the meantime, ReadyToSend has automatically been reset to 0, the mailing will NOT continue.
	</CFIF>
	<cfmail to="#xAdminEmail#" from="webmaster@photoeye.com" subject="Error - Email Sender photo-eye E-News #dateformat(Now(),"mmmm d, yyyy")#" >
			EmailSentColumn is blank in EmailSender table. This is the name of the column in MailingList_OM that keeps track of the date that an email address is sent to, if you have a particular mailing to keep track of, you'll most likely want to make a new column, or you could make a general column like LastBESent (BE=Bulk Email). In the meantime, ReadyToSend has automatically been reset to 0, the mailing will NOT continue.
	</CFMAIL>
	<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
		UPDATE EmailSender
		SET ReadyToSend = 0
	</CFQUERY>
	<CFABORT>
</CFIF>

<!--- Reset EmailSender values for the the newsletter before it's sent --->
<CFIF qGetEmailSender.CurrentlySending is 0>
	<!--- Clear old stats --->
	<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
		UPDATE EmailSender
		SET LoopCounterHTML = 0, 
			LoopCounterTXT = 0,
			NumberSentHTML = 0,
			NumberSentTXT = 0,
			LastEmailUsed = '',
			DateSent = #Now()#,
			CurrentlySending = 1
	</CFQUERY>
	<!--- Get new newsletter field values --->
	<CFQUERY Name="qGetEmailSender" Datasource="photoeyecom">
		SELECT *
		FROM EmailSender
	</CFQUERY>
</CFIF>

<!--- Default to NOT send to NOEMAIL and NOEMAILNEWSLETTER people --->
<CFIF qGetEmailSender.SendToNOEMAIL is 1>
	<CFSET xSendToNOEMAIL = 1>
<cfelse>
	<CFSET xSendToNOEMAIL = 0>
</CFIF>
<CFIF qGetEmailSender.SendToNOEMAILNEWSLETTER is 1>
	<CFSET xSendToNOEMAILNEWSLETTER = 1>
<cfelse>
	<CFSET xSendToNOEMAILNEWSLETTER = 0>
</CFIF>

<!--- Default xEmailSubjectHTML and xEmailSubjectTXT --->
<CFIF qGetEmailSender.EmailSubjectHTML is not "">
	<CFSET xEmailSubjectHTML = qGetEmailSender.EmailSubjectHTML>
<cfelse>
	<CFSET xEmailSubjectHTML = "photo-eye">
</CFIF>
<CFIF qGetEmailSender.EmailSubjectTXT is not "">
	<CFSET xEmailSubjectTXT = qGetEmailSender.EmailSubjectTXT>
<cfelse>
	<CFSET xEmailSubjectTXT = "photo-eye">
</CFIF>

<!--- Default xEmailFrom --->
<CFIF qGetEmailSender.EmailFrom is not "">
	<CFSET xEmailFrom = qGetEmailSender.EmailFrom>
<cfelse>
	<CFSET xEmailFrom = "webmaster@photoeye.com">
</CFIF>

<!--- Get Last Email address successfully sent --->
<CFQUERY NAME="qGetLastSent" DATASOURCE="photoeyecom">
   SELECT TOP 1 Email, Custnumber, #xEmailSentColumn#
   FROM MailingList_OM WHERE Email IS NOT NULL AND EMAIL LIKE '%@%' AND NOEMAIL=#xSendToNOEMAIL# AND NOEMAILNEWSLETTER=#xSendToNOEMAILNEWSLETTER# AND PLAINTEXTVERSION=0
   ORDER BY #xEmailSentColumn# DESC, Email			
</CFQUERY>

<CFSET xLastSentEmail = qGetLastSent.Email>
<CFSET xLastSentCustNumber = qGetLastSent.Custnumber>
<CFSET xLastSentDate = evaluate("qGetLastSent.#xEmailSentColumn#")>

<!--- Get Emails for HTML --->
<cfquery name="qGetEmails" datasource="photoeyecom" blockfactor="100" cachedwithin="#CreateTimeSpan(0,6,0,0)#">
SELECT DISTINCT Email, Custnumber, FirstName, LastName
   FROM MailingList_OM WHERE Email IS NOT NULL AND EMAIL LIKE '%@%' AND NOEMAIL=#xSendToNOEMAIL# AND NOEMAILNEWSLETTER=#xSendToNOEMAILNEWSLETTER# AND PLAINTEXTVERSION=0
ORDER BY Email
</cfquery>

<!--- Send HTML newsletter, if there are still addresses to send to --->
<CFIF qGetEmailSender.LoopCounterHTML lte qGetEmails.RecordCount and xHTMLFile is not "">

	<!--- Retry sending the last batch! Send first failure notice to webmaster --->
	<!--- Note: Startrow and Endrow values will still be valid, as the database wasn't successfully updated LAST time --->
	<CFIF qGetEmailSender.StartedSending is 1 and qGetEmailSender.Retried is 0>
		<!--- Set Retried = 1 --->
		<CFQUERY Name="qUpdateStartedSending" Datasource="photoeyecom">
			UPDATE EmailSender
			SET Retried = 1
		</CFQUERY>
		
		<!--- Send out first failure notice to webmaster --->
		<CFSET xLoopCounterAt = qGetEmailSender.LoopCounterHTML + 1>	
		
<cfmail to="#xAdminEmail#" from="webmaster@photoeye.com" subject="HTML #xHTMLFile#: First failure of batch starting at #xLoopCounterAt#">
HTML #xHTMLFile# batch starting at #xLoopCounterAt#

FIRST failure notice

TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#

LAST EMAIL SUCCESSFULLY SENT: 

	Address: #xLastSentEmail#
	Cust. ##: #xLastSentCustNumber#
	Date: #DateFormat(xLastSentDate, "mmmm dd, yyyy")#  #TimeFormat(xLastSentDate, "hh:mm:ss")#
	Table: MailingList_OM
</cfmail>
	
	<!--- Already retried sending the last batch!!! Send second failure notice to webmaster --->
	<CFELSEIF qGetEmailSender.Retried is 1>

		<!--- Send out second failure notice to webmaster --->
		<CFSET xLoopCounterAt = qGetEmailSender.LoopCounterHTML + 1>	
		
<cfmail to="#xAdminEmail#" from="webmaster@photoeye.com" subject="HTML #xHTMLFile#: SECOND failure of batch starting at #xLoopCounterAt#!">
HTML #xHTMLFile# batch starting at #xLoopCounterAt#

*********************
SECOND failure notice
*********************

TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#

LAST EMAIL SUCCESSFULLY SENT: 

	Address: #xLastSentEmail#
	Cust. ##: #xLastSentCustNumber#
	Date: #DateFormat(xLastSentDate, "mmmm dd, yyyy")#  #TimeFormat(xLastSentDate, "hh:mm:ss")#
	Table: MailingList_OM</cfmail>
	
		<!--- As the database wasn't successfully updated LAST time, Update it now so it skips the double-failed section --->
		<CFSET xEndrow = qGetEmailSender.LoopCounterHTML + xBatchAmount>
		<CFQUERY Name="qUpdateRetried" Datasource="photoeyecom">
			UPDATE EmailSender
			SET LoopCounterHTML = #xEndrow#,
				StartedSending = 0,
				Retried =0
		</CFQUERY>
		<CFQUERY Name="qGetEmailSender" Datasource="photoeyecom">
			SELECT *
			FROM EmailSender
		</CFQUERY>
	</CFIF>
	
	<!--- Send the next batch --->
	
	<!--- Set general loop parameters ---> 
	<CFSET xStartrow = qGetEmailSender.LoopCounterHTML + 1>
	<CFSET xEndrow = qGetEmailSender.LoopCounterHTML + xBatchAmount>
	<cfset xEmailCountHTML = 0>
	<cfset xEmailOld = qGetEmailSender.LastEmailUsed>
	
	<!--- Set Started Sending = 1 --->
	<CFQUERY Name="qUpdateStartedSending" Datasource="photoeyecom">
		UPDATE EmailSender
		SET StartedSending = 1
	</CFQUERY>
		
	<cfloop query="qGetEmails" startrow="#xStartrow#" endrow="#xEndrow#">
			
		<cfset xEmail=trim(lcase(qGetEmails.email))>
		
		<!--- Since the order is by email, check to see if there are duplicates; this is actually not necessary since we are now using only MailingList_OM and grab the emails with a "distinct" call, but it doesn't hurt to leave it in, I don't think - mmafc --->
		<CFIF (xEmail is not xEmailOld) and (xTesting is not 1)>
		
			<cfmail to="#xEmail#" from="#xEmailFrom#" subject="#xEmailSubjectHTML# #dateformat(Now(),"mmmm d, yyyy")#" type="HTML"><cfinclude template="#qGetEmailSender.FileToSendHTML#"></cfmail>
		
			<cfset xEmailCountHTML=xEmailCountHTML+1>
			
			<!--- Update date sent on all records --->
			<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
				UPDATE mailinglist_OM
				SET #xEmailSentColumn# = #Now()#
				WHERE Email = '#qGetEmails.Email#' AND NOEMAIL=#xSendToNOEMAIL# AND NOEMAILNEWSLETTER=#xSendToNOEMAILNEWSLETTER# AND PLAINTEXTVERSION=0
			</CFQUERY>
		</CFIF>
		
		<!--- Testing purposes, to simulate successful mailing --->
		<CFIF xTesting is 1>
			<cfset xEmailCountHTML=xEmailCountHTML+1>
		</CFIF>
		
		<cfset xEmailOld=xEmail>
				
	</cfloop>

	
	<!--- If retry was successful --->
	<CFIF qGetEmailSender.Retried is 1>
		<CFSET xLoopCounterAt = qGetEmailSender.LoopCounterHTML + 1>	
<cfmail to="#xAdminEmail#" from="webmaster@photoeye.com" subject="HTML  #xHTMLFile#: RETRY SUCCESSFUL of batch starting at #xLoopCounterAt#!">
HTML #xHTMLFile# batch starting at #xLoopCounterAt#

RETRY SUCCESS!

TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#
</cfmail>
	</CFIF>

	<!--- Update HTML Sent Stats; StartedSending = 0  --->
	<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
		UPDATE EmailSender
		SET LoopCounterHTML = #xEndrow#,
			NumberSentHTML = NumberSentHTML + #xEmailCountHTML#,
			LastEmailUsed = '#xEmail#',
			StartedSending = 0,
			Retried =0
	</CFQUERY>

<CFELSEIF xTXTFile is not "">
	<!--- Get Emails for TXT --->
	<CFQUERY NAME="qGetEmails" DATASOURCE="photoeyecom">
	   SELECT DISTINCT Email, Custnumber, FirstName, LastName
   FROM MailingList_OM WHERE Email IS NOT NULL AND EMAIL LIKE '%@%' AND NOEMAIL=#xSendToNOEMAIL# AND NOEMAILNEWSLETTER=#xSendToNOEMAILNEWSLETTER# AND PLAINTEXTVERSION=1
ORDER BY Email
	</CFQUERY>
	
	<CFIF qGetEmails.RecordCount is 0>
	No TXT emails to send!
	<CFABORT>
	</CFIF>
	
	<!--- Get Last Email address successfully sent --->
	<CFQUERY NAME="qGetLastSent" DATASOURCE="photoeyecom">
	  SELECT TOP 1 Email, '0' AS Custnumber, #xEmailSentColumn#
	  FROM MailingList_OM WHERE Email IS NOT NULL AND EMAIL LIKE '%@%' AND NOEMAIL=#xSendToNOEMAIL# AND NOEMAILNEWSLETTER=#xSendToNOEMAILNEWSLETTER# AND PLAINTEXTVERSION=1
	  ORDER BY #xEmailSentColumn# DESC, Email			
	</CFQUERY>
	<CFSET xLastSentEmail = qGetLastSent.Email>
	<CFSET xLastSentCustNumber = qGetLastSent.Custnumber>
	<CFSET xLastSentDate = evaluate("qGetLastSent.#xEmailSentColumn#")>

	<CFIF qGetEmailSender.LoopCounterTXT lte qGetEmails.RecordCount or qGetEmailSender.LoopCounterTXT lte xBatchAmount>
		
			<!--- Retry sending the last batch! Send first failure notice to webmaster --->
		<!--- Note: Startrow and Endrow values will still be valid, as the database wasn't successfully updated LAST time --->
		<CFIF qGetEmailSender.StartedSending is 1 and qGetEmailSender.Retried is 0>
			<!--- Set Retried = 1 --->
			<CFQUERY Name="qUpdateStartedSending" Datasource="photoeyecom">
				UPDATE EmailSender
				SET Retried = 1
			</CFQUERY>
			
			<!--- Send out first failure notice to webmaster --->
			<CFSET xLoopCounterAt = qGetEmailSender.LoopCounterTXT + 1>	
			
	<cfmail to="#xAdminEmail#" from="webmaster@photoeye.com" subject="TXT #xTXTFile#: First failure of batch starting at #xLoopCounterAt#">
	TXT #xTXTFile# batch starting at #xLoopCounterAt#
	
	FIRST failure notice
	
	TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#
	
	LAST EMAIL SUCCESSFULLY SENT: 
	
		Address: #xLastSentEmail#
		Cust. ##: #xLastSentCustNumber#
		Date: #DateFormat(xLastSentDate, "mmmm dd, yyyy")#  #TimeFormat(xLastSentDate, "hh:mm:ss")#
		Table: MailingList_OM
	</cfmail>
		
		<!--- Already retried sending the last batch!!! Send second failure notice to webmaster --->
		<CFELSEIF qGetEmailSender.Retried is 1>
		
			<!--- Send out first failure notice to webmaster --->
			<CFSET xLoopCounterAt = qGetEmailSender.LoopCounterTXT + 1>	
			
	<cfmail to="#xAdminEmail#" from="webmaster@photoeye.com" subject="TXT #xTXTFile#: SECOND failure of batch starting at #xLoopCounterAt#!">
	TXT #xTXTFile# batch starting at #xLoopCounterAt#
	
	*********************
	SECOND failure notice
	*********************
	
	TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#
	
	LAST EMAIL SUCCESSFULLY SENT: 
	
		Address: #xLastSentEmail#
		Cust. ##: #xLastSentCustNumber#
		Date: #DateFormat(xLastSentDate, "mmmm dd, yyyy")#  #TimeFormat(xLastSentDate, "hh:mm:ss")#
		Table: MailingList_OM
	</cfmail>
		
			<!--- As the database wasn't successfully updated LAST time, Update it now so it skips the double-failed section --->
			<CFSET xEndrow = qGetEmailSender.LoopCounterTXT + xBatchAmount>
			<CFQUERY Name="qUpdateRetried" Datasource="photoeyecom">
				UPDATE EmailSender
				SET LoopCounterTXT = #xEndrow#,
					StartedSending = 0,
					Retried =0
			</CFQUERY>
			<CFQUERY Name="qGetEmailSender" Datasource="photoeyecom">
				SELECT *
				FROM EmailSender
			</CFQUERY>
		</CFIF>

		
		
		<!--- Reset last email used --->
		<CFIF qGetEmailSender.LoopCounterTXT is 0>
			<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
				UPDATE EmailSender
				SET LastEmailUsed = ''
			</CFQUERY>
			
			<!--- Get new newsletter field values --->
			<CFQUERY Name="qGetEmailSender" Datasource="photoeyecom">
				SELECT *
				FROM EmailSender
			</CFQUERY>
		</CFIF>
		
		<!--- Send the next batch --->
		
		<!--- Set loop parameters ---> 
		<!--- If retrying these are still valid, as the database wasn't successfully updated LAST time --->
		<CFSET xStartrow = qGetEmailSender.LoopCounterTXT + 1>
		<CFSET xEndrow = qGetEmailSender.LoopCounterTXT + xBatchAmount>
		<cfset xEmailOld = qGetEmailSender.LastEmailUsed>
		<cfset xEmailCountTXT = 0>
		
		<!--- Set Started Sending = 1 --->
		<CFQUERY Name="qUpdateStartedSending" Datasource="photoeyecom">
			UPDATE EmailSender
			SET StartedSending = 1
		</CFQUERY>		
		
		<cfloop query="qGetEmails" startrow="#xStartrow#" endrow="#xEndrow#">
				
			<cfset xEmail=trim(lcase(qGetEmails.email))>
			
			<!--- Since the order is by email, check to see if there are duplicates--->
			<CFIF (xEmail is not xEmailOld) and (xTesting is not 1)>
			
			<cfmail to="#xEmail#" from="#xEmailFrom#" subject="#xEmailSubjectTXT# #dateformat(Now(),"mmmm d, yyyy")#"><cfinclude template="#qGetEmailSender.FileToSendTXT#"></cfmail>
				
				<cfset xEmailCountTXT=xEmailCountTXT+1>
				
				<!--- Update date sent on all records --->
				<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
					UPDATE MailingList_OM
					SET #xEmailSentColumn# = #Now()#
					WHERE Email = '#xEmail#' AND NOEMAIL=#xSendToNOEMAIL# AND NOEMAILNEWSLETTER=#xSendToNOEMAILNEWSLETTER# AND PLAINTEXTVERSION=1
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
		<CFIF qGetEmailSender.Retried is 1>
				<CFSET xLoopCounterAt = qGetEmailSender.LoopCounterTXT + 1>	
<cfmail to="#xAdminEmail#" from="webmaster@photoeye.com" subject="TXT #xTXTFile#: RETRY SUCCESSFUL of batch starting at #xLoopCounterAt#!">
TXT #xTXTFile# batch starting at #xLoopCounterAt#

RETRY SUCCESS!

TIME: #DateFormat(Now(), "mmmm dd, yyyy")#  #TimeFormat(Now(), "hh:mm:ss")#
</cfmail>
		</CFIF>
	
		<!--- Update TXT Sent Stats; StartedSending = 0 --->
		<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
			UPDATE EmailSender
			SET LoopCounterTXT = #xEndrow#,
				NumberSentTXT = NumberSentTXT + #xEmailCountTXT#,
				<CFIF IsDefined("xEmail")>
				LastEmailUsed = '#xEmail#',
				</CFIF>
				StartedSending = 0,
				Retried =0
		</CFQUERY>
		

	<!--- Done Sending --->
	<CFELSE>
		<CFQUERY Name="qUpdateNewsletterSenderStats" Datasource="photoeyecom">
			UPDATE EmailSender
			SET CurrentlySending = 0,
				ReadyToSend = 0,
				LastEmailUsed = ''
		</CFQUERY>
	
		<CFQUERY Name="qGetEmailSender" Datasource="photoeyecom">
			SELECT *
			FROM EmailSender
		</CFQUERY>

	
		<cfmail to="#xAdminEmail#" from="webmaster@photoeye.com" subject="STATS photo-eye E-News #dateformat(Now(),"mmmm d, yyyy")#" >
			Stats for newsletter sent #DateFormat(qGetEmailSender.DateSent, "mmmm dd,yyyy")#
			
			Total HTML emails sent = #qGetEmailSender.NumberSentHTML#
			
			Total TXT emails sent = #qGetEmailSender.NumberSentTXT#
		</CFMAIL>
		
	</CFIF>
</CFIF>

<CFIF xTesting is 1>
<CFQUERY Name="qGetEmailSender" Datasource="photoeyecom">
SELECT *
FROM EmailSender
</CFQUERY>
<CFOUTPUT>
COMPLETED!
<BR><BR>
Stats for newsletter sent #DateFormat(qGetEmailSender.DateSent, "mmmm dd,yyyy")#
<BR><BR>	
Total HTML emails sent = #qGetEmailSender.NumberSentHTML#
<BR><BR>		
Total TXT emails sent = #qGetEmailSender.NumberSentTXT#
</CFOUTPUT>
</CFIF>