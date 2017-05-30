<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<cfform>
   <cftextarea name="StoryText"
   			richtext="true"
			skin="office2003"
			basepath="/Editor/"
			stylesXML="/editor/fckstyles.xml"
			templatesXML="/Editor/fcktemplates.xml"
			toolbar="Default"
			cols="40"
			rows="10"
			wrap="hard">
		</cftextarea>	
</cfform>

<br />
<img src="image1.jpg" />

<cfimage source="image1.jpg" name="MyImage"/>
<cfset IPTCMetaData = ImageGetIPTCMetaData(MyImage)/>
iptc Metadata
<cfdump var="#IPTCMetaData#"/>
And then compared it with the output of this code:

<cfimage source="image1.jpg" name="MyImage"/>
<cfset exifData = ImageGetExifMetaData(MyImage)/>
Exif Metadata
<cfdump var="#exifData#"/>

<cfimage action="resize" height="25%" width="25%" destination="smallerimage1.jpg" source="image1.jpg" name="MyImage" overwrite="true"/>

<img src ="smallerimage1.jpg" />

<cfimage source="smallerimage1.jpg" name="MyImage2"/>
<cfset IPTCMetaData2 = ImageGetIPTCMetaData(MyImage2)/>
iptc Metadata
<cfdump var="#IPTCMetaData2#"/>
And then compared it with the output of this code:

<cfimage source="smallerimage1.jpg" name="MyImage2"/>
<cfset exifData2 = ImageGetExifMetaData(MyImage2)/>
Exif Metadata
<cfdump var="#exifData2#"/>

</body>
</html>
