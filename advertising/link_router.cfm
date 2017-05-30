Coming Soon!

<!--- So we don't know which ad is here ---> 
<!--- So we can query the advertising database and pull the current ad --->

<cfquery name="qGetCurrentAdLink" datasource="photoeyecom">

Select top 1 link_url from ad_description order by last_viewed desc

</cfquery>

<cflocation url="#qGetCurrentAdLink.link_url#">