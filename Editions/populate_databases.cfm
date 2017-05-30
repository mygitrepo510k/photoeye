	<cfquery name="getit" datasource="photoeyecom">
			SELECT AUTOID AS stock_id, PRICE1 AS price, NUMBER AS passthrough_number, NUMBER_BINDING AS binding_name
			FROM stock
			WHERE NUMBER_ROOT = 'PE035'
	</cfquery>
	<cfdump var="#getit#" />
<!--- 

<cfquery name="populate" dataSource="photoeye_editions">
	INSERT INTO inventory (catalog, title2x, subject, ocrx, pages, illustrat)
	VALUES ('ZC246','Faces Vol.1','Hiroshi Watanabe','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','NP','numerous illustrations')
</cfquery> 

<cfquery name="populate" datasource="photoeye_editions">
	INSERT INTO editions_publications (catalog_number)
	VALUES ('ZC246')
</cfquery>

<cfquery name="populate" dataSource="photoeye_editions">
	INSERT INTO inventory (catalog, title2x, subject, ocrx, pages, illustrat)
	VALUES ('ZD308','Bright, Bright Day','Andrey Tarkovsky','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','128pp','65 colour illustrations and 13 duotones.')
</cfquery> 

<cfquery name="add_columns" dataSource="photoeyecom">
	ALTER TABLE editions_artists
	ADD representation nvarchar(4000)
</cfquery> 

<cfquery name="add_columns" dataSource="photoeyecom">
	ALTER TABLE editions_publications
	ADD pricing nvarchar(4000)
</cfquery>

<cfquery name="add_columns" dataSource="photoeyecom">
	ALTER TABLE editions_publications
	ADD tagline nvarchar(300)
</cfquery> 

<cfquery name="DESTROYER" dataSource="photoeyecom">
	DELETE FROM editions_publications
</cfquery> 

--->						
<cfquery name="dumpable" dataSource="photoeyecom">
	SELECT * FROM editions_publications
</cfquery>

<cfquery name="dumpable3" dataSource="photoeyecom">
	SELECT * FROM editions_artists
</cfquery>

<cfquery name="dumpable2" dataSource="photoeyecom">
	SELECT TOP 15 * FROM stock
	WHERE NUMBER_ROOT = 'PE034'
</cfquery>


<cfdump var="#dumpable#" />
<cfdump var="#dumpable3#" />
<cfdump var="#dumpable2#" />
