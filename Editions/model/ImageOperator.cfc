<cfcomponent output="false" displayName="Image Operator" hint="I handle all cfimage operations">
	
	<!--- 
		Only used by ImageManager, which handles all the directory tree and cffile manipulation
		
		use example:
			image_operator = createObject('component','photoeye_editions.model.imageOperator');
			image_path = '#ExpandPath(somepath)#';
			thumbnail_image = image_operator.resize_image(image_path,'thumb');
				=> image object 100x100>
			custom_thumbnail_image = image_operator.resize_image(image_path, ['50','50','lanczos']);
				=> image object 50x50>
	--->
	
	<cffunction name="init" access="public" hint="Constructor. I set the default resize formats">
		<cfscript> 
			variables.resize_formats = StructNew();
			defaultFormats = StructNew();
			defaultFormats.large = ['1000','1000','highestQuality'];
			defaultFormats.medium = ['400', '400', 'highestQuality'];
			defaultFormats.small = ['150', '150', 'highestQuality'];
			defaultFormats.thumb = ['105','105','highestQuality'];
			defaultFormats.artist_portrait = ['400','400','highestQuality'];
			defaultFormats.cover_main = ['360','1000','highestQuality'];
			setResize_formats(defaultFormats);
		</cfscript>
		<cfreturn this />
	</cffunction>
	
	<cffunction name="setResize_formats" access="public" returntype="any" output="false" hint="I take a structure of arrays and add them to my named resize formats, you can overwrite my defaults.">
		<cfargument name="resize_formats" type="Struct" required="false" default="#StructNew()#">
		
		<!--- see my init function for an example of how to define the passed structure --->
				
		<cfscript>
			
			StructAppend(variables.resize_formats, arguments.resize_formats);			

		</cfscript>
		
		<cfreturn true />
	</cffunction>
	
	<cffunction name="resize_image" access="public" returntype="any" output="false" hint="I eat image paths and a named resize type, or array of resize options, and => resized objects">
		<cfargument name="image_path" type="string" required="true" />
		<cfargument name="alias" type="any" required="true" />
		<cfset image_object = " " />

		<cfif IsArray(arguments.alias) >
			<cfset image_options = arguments.alias />
		<cfelseif IsDefined('arguments.alias') AND StructKeyExists(variables.resize_formats, "#arguments.alias#")>
			<cfset image_options = evaluate('variables.resize_formats.#arguments.alias#') />
		<cfelse>
			<cfset image_options = variables.resize_formats.large />
		</cfif>
		
		<cfset image_object = ImageNew('#arguments.image_path#') />
		<cfset ImageSetAntialiasing(image_object,"on")>
		<cfset ImageScaleToFit(image_object, image_options[1], image_options[2], image_options[3]) />

<!---	Old Image Sharpening code, way too crunchy on the production server.
		<cfif image_options[1] LT "200" OR image_options[2] LT "200">
			<cfset ImageSharpen(image_object, 1) />
			<cfset ImageCrop(image_object, 1, 1, '#ImageGetWidth(image_object)-2#','#ImageGetHeight(image_object)-2#') />
		</cfif>
--->

		<cfreturn image_object />
	</cffunction>
	
	<cffunction name="resize_image_by_shortest_side" access="public" returntype="any" output="false" hint="I eat image paths and a named resize type, or array of resize options, and => resized objects">
		<cfargument name="image_path" type="string" required="true" />
		<cfargument name="minimum_dimension" type="any" required="true" />
		<cfset image_object = " " />
		<cfset image_object = ImageNew('#arguments.image_path#') />
		<cfif ImageGetHeight(image_object) GT ImageGetWidth(image_object)>
			<cfset imageScaleToFit(image_object, minimum_dimension,"") />
		<cfelse>
			<cfset imageScaleToFit(image_object, "", minimum_dimension, "highestQuality") />
		</cfif>

		<cfreturn image_object />
	</cffunction>
	
</cfcomponent>