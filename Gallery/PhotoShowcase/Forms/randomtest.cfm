<CFQUERY NAME="qGetShowcaseSetupInfoMax"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>


<cfoutput>
<cfset RecordCount = #qGetShowcaseSetupInfoMax.RecordCount#>

<cfset Randomrecordno1=RANDRANGE(5,RecordCount)>

<!---First Image --->
<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
SELECT *
FROM GallerySetup WHERE RecordNo = '#RandomRecordNo1#';
</cfquery>

<img src="../../#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/Portfolio1/images_small/image1.jpg">

<!--- Set Random Record Numbers--->
<cfloop index="Nodupe" from="1" to="#qGetShowcaseSetupInfoMax.RecordCount#" step="1">
	<!--- Use 5 until we clean up the database, then use 1--->
	<cfset Randomrecordno2=RANDRANGE(5,RecordCount)>
	<cfif RandomRecordno1 is not RandomRecordno2>
		<cfbreak>
	</cfif>
</cfloop>

<cfloop index="Nodupe" from="1" to="#qGetShowcaseSetupInfoMax.RecordCount#" step="1">
	<cfset Randomrecordno3=RANDRANGE(5,RecordCount)>
	<cfif (RandomRecordno3 is not RandomRecordno1)>
		<cfif RandomRecordno3 is not RandomRecordno2>
			<cfbreak>
		</cfif>
	</cfif>
</cfloop>

<cfloop index="Nodupe" from="1" to="#qGetShowcaseSetupInfoMax.RecordCount#" step="1">
	<cfset Randomrecordno4=RANDRANGE(5,RecordCount)>
	<cfif (RandomRecordno4 is not RandomRecordno1)>
		<cfif RandomRecordno4 is not RandomRecordno2>
			<cfif RandomRecordno4 is not RandomRecordno3>
				<cfbreak>
			</cfif>
		</cfif>
	</cfif>
</cfloop>

<cfloop index="Nodupe" from="1" to="#qGetShowcaseSetupInfoMax.RecordCount#" step="1">
	<cfset Randomrecordno5=RANDRANGE(5,RecordCount)>
	<cfif (RandomRecordno5 is not RandomRecordno1)>
		<cfif RandomRecordno5 is not RandomRecordno2>
			<cfif RandomRecordno5 is not RandomRecordno3>
				<cfif RandomRecordno5 is not RandomRecordno4>
					<cfbreak>
				</cfif>
			</cfif>
		</cfif>
	</cfif>
</cfloop>

<cfloop index="Nodupe" from="1" to="#qGetShowcaseSetupInfoMax.RecordCount#" step="1">
	<cfset Randomrecordno6=RANDRANGE(6,RecordCount)>
	<cfif (RandomRecordno6 is not RandomRecordno1)>
		<cfif RandomRecordno6 is not RandomRecordno2>
			<cfif RandomRecordno6 is not RandomRecordno3>
				<cfif RandomRecordno6 is not RandomRecordno4>
					<cfif RandomRecordno6 is not RandomRecordno5>
						<cfbreak>
					</cfif>
				</cfif>
			</cfif>
		</cfif>
	</cfif>
</cfloop>


<!---Next Image--->
<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
SELECT *
FROM GallerySetup WHERE RecordNo = '#RandomRecordNo2#';
</cfquery>

<img src="../../#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/Portfolio1/images_small/image1.jpg">

<!---Next Image--->
<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
SELECT *
FROM GallerySetup WHERE RecordNo = '#RandomRecordNo3#';
</cfquery>

<img src="../../#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/Portfolio1/images_small/image1.jpg">

<br><br>

<!---Next Image--->
<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
SELECT *
FROM GallerySetup WHERE RecordNo = '#RandomRecordNo4#';
</cfquery>

<img src="../../#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/Portfolio1/images_small/image1.jpg">

<!---Next Image--->
<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
SELECT *
FROM GallerySetup WHERE RecordNo = '#RandomRecordNo5#';
</cfquery>

<img src="../../#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/Portfolio1/images_small/image1.jpg">

<!---Next Image--->
<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
SELECT *
FROM GallerySetup WHERE RecordNo = '#RandomRecordNo6#';
</cfquery>

<img src="../../#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/Portfolio1/images_small/image1.jpg">


</cfoutput>
</body>
</html>
