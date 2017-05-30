<cfset PortfolioTitle = '#Form.PortfolioName#'>
<cfset PortfolioTitle = REPLACE(#PortfolioTitle#,'Portfolio','Portfolio ')>

<CFQUERY NAME="qInsertNewPortfolio" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYPortfolio  (Custnumber, ID, Title, SubDirectory, ImgQty, BackgroundColor, BgHeaderColor)
           VALUES (#Form.Custnumber#, #Form.Custnumber#, '#PortfolioTitle#', '#Form.PortfolioName#', #Form.ImageQty#, '333333', '000000')
</CFQUERY>

<CFQUERY NAME="qInsertNewDefault" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYDEFAULTPHOTOS  (Custnumber, SubDirectory)
           VALUES (#Form.Custnumber#, '#PortfolioName#')
</CFQUERY>

<cfset Imagenumber=1>

<cfloop index="ImageQtyx" from="1" to="#form.imageqty#">


<CFQUERY NAME="qInsertNewCustomer2" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYINDIVIDUALPHOTOS  (Custnumber, PortfolioName, ImageNumber, ImagePosition)
           VALUES (#Form.Custnumber#, '#Form.PortfolioName#', #ImageNumber#, #ImageNumber#)
</CFQUERY>

<CFQUERY NAME="qInsertNewCustomer2" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYDEFAULTPHOTOS  (Custnumber, SubDirectory)
           VALUES (#Form.Custnumber#, '#Form.PortfolioName#')
</CFQUERY>

<cfset Imagenumber=Imagenumber+1>

</cfloop>
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>photo-eye Photographer's Showcase</title>
</head>


<body bgcolor="#cccc99" link="BLUE" vlink="#000080">

	Inserted New Portfolio!

</body>
</html>
