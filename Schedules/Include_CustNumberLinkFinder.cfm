<!--- This file outputs xEmail, xCustNumber, xCustNumberLink, xAccountAlreadySetup and xEmailNewsletter --->

		<!--- Build xCustNumberLink; determine which message to send --->
			<CFQUERY NAME="qCustInfo" DATASOURCE="photoeyecom">
			   SELECT *
			   FROM MailingList_OM 
			   WHERE Email = '#xEmail#' 
			   and Custnumber is not null
			   ORDER BY Address1			
			</CFQUERY>
			
			<CFSET xAccountAlreadySetup = 0>
			<CFOUTPUT QUERY="qCustInfo">
				<CFIF trim(qCustInfo.Password) is not ''>
					<CFSET xCustNumber = qCustInfo.CustNumber>
					<CFSET xAccountAlreadySetup = 1>
					<CFSET xEmailNewsletter = qCustInfo.EmailNewsletter>
				</CFIF>
			</CFOUTPUT>
			
			<CFPARAM  NAME="xEmailNewsletter" DEFAULT= 0>
			<CFSET xNumberOfAddresses = 0>
			<CFIF qCustInfo.RecordCount gt 1 and xAccountAlreadySetup is not 1>
				<CFSET xLastAddress1 = "">	
				<CFSET xLastAddress2 = "">
				<CFSET xLastCity = "">
				<CFSET xLastState = "">
				<CFSET xLastZip = "">		
				<CFOUTPUT QUERY="qCustInfo">
					<CFIF (trim(Address1) is trim(xLastAddress1)) and (trim(Address2) is trim(xLastAddress2)) and (trim(City) is trim(xLastCity)) and (trim(State) is trim(xLastState)) and (trim(Zip) is trim(xLastZip))>	
					<CFELSE>
						<CFSET xCustNumber = qCustInfo.CustNumber>
						<CFIF qCustInfo.EmailNewsletter is 1>
							<CFSET xEmailNewsletter = 1>
						</CFIF>
						<CFSET xNumberOfAddresses = xNumberOfAddresses + 1>
					</CFIF>
					<CFSET xLastAddress1 = "#Address1#">
					<CFSET xLastAddress2 = "#Address2#">
					<CFSET xLastCity = "#City#">
					<CFSET xLastState = "#State#">
					<CFSET xLastZip = "#Zip#">
				</CFOUTPUT>
			</CFIF>
			
			<!--- This is to cover the case of email-list only folks--->
			<CFIF xNumberOfAddresses is 0>
			<CFSET xEmailNewsletter = 1>
				<CFSET xCustNumber = qCustInfo.CustNumber> 
				<CFSET xNumberOfAddresses = 1>
			</CFIF>
			
			
			
			<!--- Generate appropriate link --->
			<CFSET xCustNumberLink = "">
			<CFIF xNumberOfAddresses is 1 and xAccountAlreadySetup is 0>
				<CFSET xCustNumberLink="http://www.photoeye.com/emailnewsletter/gateway.cfm?Volume=#qGetNewsletterSender.VolumeToSend#&Number=#qGetNewsletterSender.NumberToSend#&catnumber=ChoosePwd&location=NewAcct&e=#trim(xEmail)#&c=#xCustNumber#">
			<CFELSEIF xNumberOfAddresses gt 1 and xAccountAlreadySetup is 0>
				<CFSET xCustNumberLink="http://www.photoeye.com/emailnewsletter/gateway.cfm?Volume=#qGetNewsletterSender.VolumeToSend#&Number=#qGetNewsletterSender.NumberToSend#&catnumber=ChooseAddress&location=http://www.photoeye.com/Templates/NewPasswordSendCustomerNumber.cfm?Email=#trim(xEmail)#">
			<CFELSE>
				<CFSET xCustNumberLink="http://www.photoeye.com/emailnewsletter/gateway.cfm?Volume=#qGetNewsletterSender.VolumeToSend#&Number=#qGetNewsletterSender.NumberToSend#&catnumber=AlreadySetup&location=AlreadySetup&Email=#xEmail#&Acct=1">
			</CFIF>

			