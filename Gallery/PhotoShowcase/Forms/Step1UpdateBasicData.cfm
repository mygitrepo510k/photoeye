<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup
   SET FirstName = '#Form.FirstName#',
    LastName = '#Form.LastName#',
    Address1 = '#Form.Address1#',
	Address2 = '#Form.Address2#',
	    City = '#Form.City#',
	   State = '#Form.State#',
	 Country = '#Form.Country#',
		 Zip = '#Form.Zip#',
	   Phone = '#Form.Phone#',
 Nationality = '#Form.Nationality#',
	   Email = '#trim(Form.Email)#',
	Password = '#trim(Form.Password)#',
    BirthL = '#Form.BirthL#',
   Birth = '#Form.Birth#',
   Hint = '#Form.Hint#',
 Step1='1'
  WHERE CustNumber = #Form.CustNumber#
</CFQUERY>

<cfif #form.showcasecolor# is "0">
	<cfset Background = "000000">
	<cfset BgHeaderColor = "333333">
<cfelse>
	<cfset Background = "333333">
	<cfset BgHeaderColor = "000000">
</cfif>
	
	
<CFQUERY NAME="qUpdateShowcasePortfolio"  DATASOURCE="photoeyecom">
  UPDATE  GalleryPortfolio 
  SET BackgroundColor= '#Background#',
  BgHeaderColor= '#BgHeaderColor#'
  where Custnumber = '#Form.CustNumber#';
</CFQUERY>

<!---
<CFQUERY NAME="qUpdatePhotographersSetup2Info"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup2
   SET aEduSchool = '#Form.aEduSchool#',
         aEduYear = '#Form.aEduYear#',
       aEduDegree = '#Form.aEduDegree#',
	  aEduTeacher = '#Form.bEduTeacher#',
	   bEduSchool = '#Form.bEduSchool#',
	     bEduYear = '#Form.bEduYear#',
       bEduDegree = '#Form.bEduDegree#',
      bEduTeacher = '#Form.bEduTeacher#',
	   cEduSchool = '#Form.cEduSchool#',
	     cEduYear = '#Form.cEduYear#',
       cEduDegree = '#Form.cEduDegree#',
      cEduTeacher = '#Form.cEduTeacher#'
  WHERE CustNumber = '#form.CustNumber#'
</CFQUERY> --->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Updating...</title>
</head>

<body>
<cfoutput>
<!---All Information has been added! --->
<!--- <cfinclude template="step2chronology.cfm"> --->
<!--- <cfinclude template="dynamictostaticBio.cfm"> --->
<cfinclude template="UpdateSuccessful.cfm">
</cfoutput>
</body>
</html>