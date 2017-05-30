

<!--- <cfquery datasource="mysql" name="qGettitles">
	select a.isbn as isbn, title, annotations  from titles as a, annotations as b where b.isbn=a.isbn 
</cfquery>  --->

<cfquery datasource="mysql" name="qGettitles">
	select * from titles  as t left  join annotations as a on t.isbn=a.isbn left join pubmarketing as p on p.isbn=t.isbn limit 2000, 100
</cfquery> 

<cfquery datasource="mysql" name="qGetBindings">
	select * from bindings 
</cfquery> 

<cfoutput>
#qGettitles.recordcount#<br><br>
</cfoutput>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfoutput query="qGetTitles">
<!--- <cfif fileExists("c:/inetpub/wwwroot/photoeyecom/ingram/imageswk/j400w/020204j400/#isbn#.jpg")>
<img src="c:/inetpub/wwwroot/photoeyecom/ingram/imageswk/j400w/020204j400/#isbn#.jpg"><br>
#isbn#<br>
#title#<br>
#annotations#<br>
<br>
</cfif> --->
<cfset xgetTitlesISBN='#isbn#'>
<br>

<cfset xpath="c:/inetpub/wwwroot/photoeyecom/ingram/imageswk/j400w">
<cfset xpath="../ingram/exportimages"><br>
#ExpandPath("#xpath#/#isbn#.jpg")#
<!--- <cfif fileExists(ExpandPath("#xpath#/#isbn#.jpg"))> --->
<cfif fileExists("C:\websites\photoeyecom\html\Ingram\exportimages\#isbn#.jpg")><img src="#xpath#/#isbn#.jpg"><br>yes
<cfelse>
no
</cfif>
<cfif val(mid(pubdate,1,2)) is 1>
<cfset xMonth= "January">
<cfelseif val(mid(pubdate,1,2)) is 2>
<cfset xMonth= "February">
<cfelseif val(mid(pubdate,1,2)) is 3>
<cfset xMonth= "March">
<cfelseif val(mid(pubdate,1,2)) is 4>
<cfset xMonth= "April">
<cfelseif val(mid(pubdate,1,2)) is 5>
<cfset xMonth= "May">
<cfelseif val(mid(pubdate,1,2)) is 6>
<cfset xMonth= "June">
<cfelseif val(mid(pubdate,1,2)) is 7>
<cfset xMonth= "July">
<cfelseif val(mid(pubdate,1,2)) is 8>
<cfset xMonth= "August">
<cfelseif val(mid(pubdate,1,2)) is 9>
<cfset xMonth= "September">
<cfelseif val(mid(pubdate,1,2)) is 10>
<cfset xMonth= "October">
<cfelseif val(mid(pubdate,1,2)) is 11>
<cfset xMonth= "November">
<cfelseif val(mid(pubdate,1,2)) is 12>
<cfset xMonth= "December">
<cfelse>
<cfset xMonth="">
</cfif>
<FONT COLOR="RED">#isbn#</FONT><br>
#title#<br>

<!--- Set variables to see if there are contributors --->
<cfset xcontribut1_start=findoneof(',',contribut1)>
<cfset xcontribut2_start=findoneof(',',contribut2)>
<cfset xcontribut3_start=findoneof(',',contribut3)>


<!--- Invert Contributor 1 --->
<cfif xcontribut1_start gt 0>
<cfquery name="qGetContributRole" datasource="mysql">
	select * from ctbrrole where code='#contr1role#'</cfquery> 
Contributors: #trim(mid(contribut1,xcontribut1_start+1,40))# 
#trim(mid(contribut1,1,xcontribut1_start-1))#<cfif len(trim(qGetContributRole.description)) gt 0> (#trim(qGetContributRole.description)#)</cfif><cfif len(trim(contribut2)) gt 0>,</cfif>

</cfif>

<!--- Invert Contributor 2 --->
<cfset xcontribut2_start=findoneof(',',contribut2)>
<cfif xcontribut2_start gt 0> 
<cfquery name="qGetContributRole" datasource="mysql">
	select * from ctbrrole where code='#contr2role#'</cfquery> 
#trim(mid(contribut2,xcontribut2_start+1,40))# 
#trim(mid(contribut2,1,xcontribut2_start-1))#<cfif len(trim(qGetContributRole.description)) gt 0> (#trim(qGetContributRole.description)#)</cfif><cfif len(trim(contribut3)) gt 0>,</cfif> 
</cfif>

<!--- Invert Contributor 3 --->
<cfif xcontribut3_start gt 0> 
<cfquery name="qGetContributRole" datasource="mysql">
	select * from ctbrrole where code='#contr3role#'</cfquery> 
#trim(mid(contribut3,xcontribut3_start+1,40))# 
#trim(mid(contribut3,1,xcontribut3_start-1))#<cfif len(trim(qGetContributRole.description)) gt 0> (#trim(qGetContributRole.description)#)</cfif>
</cfif>

<br>

<!--- Show Publisher, pubdate, language --->
#pubimprint#, #xMonth# #mid(pubdate,3,4)#. <cfif language IS NOT "ENG"> #language#</cfif>
<br><cfif val(pages) gt 0> 

<cfset xstart=findoneof('123456789',pages)>
<cfif xstart gt 0>  #mid(pages,xstart,5)# pages, </cfif><cfelse>Unpaged, </cfif> 

<cfif right(width,2) GTE 0 and right(width,2) lt 15>
<cfset xfraction="">
<Cfelseif right(width,2) GTE 15 and right(width,2) lt 35>
<cfset xfraction="&frac14;">
<cfelseif right(width,2) GTE .35 and right(width,2) lt 65> 
<cfset xfraction="&frac12;">
<cfelseif right(width,2) GTE 65 and right(width,2) lt 100> 
<cfset xfraction="&frac34;">
<CFELSE>
<cfset xfraction="">
</cfif>

<!--- #width# #length# #height#  --->
<cfif val(width) gt 0> <!--- Dimensions:  --->
<cfset xstart=findoneof('123456789',width)>
#mid(width,xstart,4-xstart)##xfraction#x</cfif><cfif right(length,2) GTE 0 and right(length,2) lt 15><cfset xfraction=""><Cfelseif right(length,2) GTE 15 and right(length,2) lt 35><cfset xfraction="&frac14;"><cfelseif right(length,2) GTE .35 and right(length,2) lt 65><cfset xfraction="&frac12;"><cfelseif right(length,2) GTE 65 and right(length,2) lt 100><cfset xfraction="&frac34;"><CFELSE><cfset xfraction=""></cfif><cfif val(length) gt 0><cfset xstart=findoneof('123456789',length)>#mid(length,xstart,4-xstart)##xfraction#x</cfif><cfif right(height,2) GTE 0 and right(height,2) lt 15><cfset xfraction=""><Cfelseif right(height,2) GTE 15 and right(height,2) lt 35><cfset xfraction="&frac14;"><cfelseif right(height,2) GTE .35 and right(height,2) lt 65><cfset xfraction="&frac12;"><cfelseif right(height,2) GTE 65 and right(height,2) lt 100><cfset xfraction="&frac34;"><CFELSE><cfset xfraction=""></cfif><cfif val(height) gt 0><cfset xstart=findoneof('123456789',height)>#mid(height,xstart,4-xstart)##xfraction#&quot; <!--- (width x height x thickness) --->
</cfif>
<cfif val(weight) gt 0> &nbsp;&nbsp; (#replace(left(weight,5),"0","","all")#.#replace(right(weight,2),"0","","all")# lbs)
</cfif><br>



<cfquery name="qGetBinding" dbtype="query">
	select * from qGetBindings where code='#bisacbind#'</cfquery>
<cfset xdollars=(left(price,4))>
<cfset xstart=findoneof('123456789',xdollars)>
<cfset xend=5-xstart>
$#mid(xdollars,xstart,xend)#.#right(price,2)# #qGetBinding.binding#<br>


<!--- Check for other bindings --->
<cfquery datasource="mysql" name="qGetFamily">
	select * from family where isbn='#isbn#'
</cfquery> 
<cfquery datasource="mysql" name="qGetFamilyID">
	select * from family where familyid='#qGetFamily.familyid#'
</cfquery> 

<cfif qGetFamilyid.recordcount gt 1>
<strong>Other Formats:</strong><br>

<cfloop query=qGetFamilyID>
<cfquery datasource="mysql" name="qGetOtherFormat">
	select * from titles where isbn='#qGetFamilyid.isbn#' and isbn<>'#xGettitlesisbn#'
</cfquery> 

	<cfif qGetOtherFormat.recordcount is 1>
		<cfquery name="qGetBinding" dbtype="query">
	select * from qGetBindings where code='#qGetOtherFormat.bisacbind#'</cfquery>
	
	<cfset xdollars=(left(qGetOtherFormat.price,4))>
<cfset xstart=findoneof('123456789',xdollars)>
<cfset xend=5-xstart>
#qGetOtherFormat.title# #qGetOtherFormat.isbn#
$#mid(xdollars,xstart,xend)#.#right(qGetOtherFormat.price,2)# #qGetBinding.binding#<br>
</cfif>
</cfloop>
</cfif>

<cfif len(trim(bissub1des))GT 0> #bissub1des#</cfif><cfif len(trim(bissub2des))GT 0>, #bissub2des#</cfif><cfif len(trim(bissub3des))GT 0>, #bissub3des#</cfif><br>

<cfquery datasource='mysql' name='qGetThemes'>
	select * from themes a  where a.isbn='#isbn#' 
</cfquery>

<cfif qGetThemes.recordcount gt 0>
	<cfif len(trim(qGetThemes.theme1)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme1,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme1,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>
	<cfelseif len(trim(qGetThemes.theme2)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme2,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme2,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>
	<cfelseif len(trim(qGetThemes.theme3)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme3,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme3,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>	
	<cfelseif len(trim(qGetThemes.theme4)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme4,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme4,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>
	<cfelseif len(trim(qGetThemes.theme5)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme5,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme5,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>
	<cfelseif len(trim(qGetThemes.theme6)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme6,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme6,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>
	<cfelseif len(trim(qGetThemes.theme7)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme7,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme7,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>
	<cfelseif len(trim(qGetThemes.theme8)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme8,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme8,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>
	<cfelseif len(trim(qGetThemes.theme9)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme9,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme9,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>
	<cfelseif len(trim(qGetThemes.theme10)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme10,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme10,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>
	<cfelseif len(trim(qGetThemes.theme11)) GT 0>
		<cfquery datasource='mysql' name='qGetThemesDesc'>
	select * from themesdescription  where code='#mid(qGetThemes.theme11,5,6)#' 
</cfquery>
		<cfquery datasource='mysql' name='qGetThemesGroup'>
	select * from themesgroup  where code='#mid(qGetThemes.theme11,1,4)#' 
</cfquery>
#qGetThemesGroup.Description#: #qGetThemesDesc.description#<br>
	</cfif>


</cfif>

<!--- <cfif len(trim(annotations)) gt 0>
Annotation:<br>#annotations#
</cfif> --->
		<cfquery datasource='mysql' name='qGetPubMarketing'>
	select * from pubmarketing  where isbn='#isbn#' 
</cfquery>

<cfif len(trim(annotations)) GT 0 and len(trim(qGetPubMarketing.description)) lt len(trim(annotations))>Annotation:<br>#annotations#
<cfelse>
<cfif len(trim(qGetPubMarketing.description)) GT 0><BR>Publisher Marketing:<BR>#qGetPubMarketing.description#</cfif>
</cfif> <br>
<br>


<cfflush>
</cfoutput>

</body>
</html>
