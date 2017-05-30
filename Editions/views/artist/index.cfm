<cfset artists = event.getValue('artists') />
<cfoutput>
  <div style="padding:0 50px">
    <h1>Artists</h1>
  	<cfloop array="#artists#" index="i">
  		<div> 
  			<a style="color:##666;" href="#event.linkTo('artist.show','id')##i.id#">#i.name#</a>
  		</div>
  	</cfloop>
  </div>
</cfoutput>
