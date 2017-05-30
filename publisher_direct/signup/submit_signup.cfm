<cfif NOT len(FORM.email)>
	<cfset pdError('email','Please enter your email address') />
</cfif>

<cfif NOT len(FORM.password)>
	<cfset pdError('password','Please enter your password') />
</cfif>

<cfif isDefined("_errors")>
	<cfinclude template="index.cfm" /><cfabort />
</cfif>

<cfquery name="qAccountDup" dataSource="#application.dsn#">
	SELECT email FROM publisher_direct_accounts
	WHERE email = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.email#" />
</cfquery>

<cfif qAccountDup.recordcount>
	<cfset backToPath = '/#application.root#/signup/' />
	<cfinclude template="/#application.root#/login/submit_login.cfm" /><cfabort />
</cfif>

<cfset crypted_pass = ToBase64(Encrypt(trim(form.password), "#application.xbird#"))>
<cfquery name="qPhotoeyeAccount" dataSource="#application.dsn#">
	SELECT * FROM Mailinglist_OM
	WHERE email = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.email#" />
	AND ((SUBSTRING(password,1,5)='#LEFT(crypted_pass,5)#') 
   		OR (SUBSTRING(password,1,5)='#LEFT(lcase(crypted_pass),5)#'))
</cfquery>
<cfif qPhotoeyeAccount.recordcount GT 0>
	<cfquery name="qLastRecord" dataSource="#application.dsn#">
		SELECT TOP 1 * FROM publisher_direct_accounts
		ORDER BY id DESC
	</cfquery>
	<cfif qLastRecord.recordcount GT 0>
		<cfset freshID = qLastRecord.id+1 />
	<cfelse>
		<cfset freshID = 10000 />
	</cfif>
		
	<cfquery name="qCreatePubDirAccount" dataSource="#application.dsn#">
		INSERT INTO publisher_direct_accounts (Custnumber,
												ID,
												AltNum,
												FirstName,
												LastName,
												Company,
												Address1,
												Address2,
												City,
												State,
												Zip,
												Country,
												Email,
												Password,
												Phone,
												Extension,
												Phone2,
												Extension2,
												Hint)
		VALUES (#qPhotoeyeAccount.custnumber#,
				#freshID#,
				#qPhotoeyeAccount.AltNum#,
				'#qPhotoeyeAccount.FirstName#',
				'#qPhotoeyeAccount.LastName#',
				'#qPhotoeyeAccount.Company#',
				'#qPhotoeyeAccount.Address1#',
				'#qPhotoeyeAccount.Address2#',
				'#qPhotoeyeAccount.City#',
				'#qPhotoeyeAccount.State#',
				'#qPhotoeyeAccount.Zip#',
				'#qPhotoeyeAccount.Country#',
				'#qPhotoeyeAccount.Email#',
				'#qPhotoeyeAccount.Password#',
				'#qPhotoeyeAccount.Phone#',
				'#qPhotoeyeAccount.Extension#',
				'#qPhotoeyeAccount.Phone2#',
				'#qPhotoeyeAccount.Extension2#',
				'#qPhotoeyeAccount.Hint#')
	</cfquery>

	<cflock scope="Session" type="exclusive" timeout="5">
		<cfquery name="qRedeemToken" dataSource="#application.dsn#">
			UPDATE publisher_direct_token
			SET publisher_direct_id = #freshID#
			WHERE token = '#SESSION.publisher_direct_redeeming_token#'
		</cfquery>
		<cfset SESSION.publisher_direct_id = #freshID# />
	</cflock>
	
	<cflocation url="/#application.root#/purchase/" addToken="no" />
<cfelse>
	<cfset pdError('login','Photo-eye account was not found') />
	<cfinclude template="index.cfm" /><cfabort />
</cfif>