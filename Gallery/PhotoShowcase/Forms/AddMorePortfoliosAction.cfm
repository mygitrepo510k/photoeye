<!--- Update Credits ---> 
<CFQUERY NAME="qUpdateCredits"  DATASOURCE="photoeyecom">
  Update GallerySetup SET PortfolioCredits=PortfolioCredits+#trim(form.AddPortfolios)#
  WHERE Custnumber = #URL.Custnumber# ;
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>photo-eye Photographer's Showcase | Multiple Portfolios</title>
</head>

<body bgcolor="White" link="#000080" vlink="#000080">
<div align="center"><br><br><br><br>
<font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="2" Color="Navy"><b>Update Successful!</b></font>
</div>
</form>
</body>
</html>
