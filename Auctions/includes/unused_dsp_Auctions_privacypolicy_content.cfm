

<!--- Header --->
<CFSET xShowMenu = 0>
<CFSET xTitle="Privacy Policy">
<CFINCLUDE TEMPLATE="Header.cfm">

<CFPARAM NAME="url.Auction" DEFAULT="0">
<CFIF url.Auction is "0">
	<CFSET xFontFace = "Verdana, Arial, Helvetica, sans-serif">
<CFELSEIF url.Auction is "1">
	<CFSET xFontFace = "''Trebuchet MS'', Verdana, Arial, Helvetica, sans-serif">
</CFIF>

<table align="center" width="580"><tr><td>
  <CFOUTPUT><font face="#xFontFace#" size="2"color="##333333" class="text"></CFOUTPUT> 

<div align="left">
At photo-eye, we respect and value the privacy of your personal information.<br>
<br>
<!---<b>To contact us:</b><br>
photo-eye books & prints.<br>
376 Garcia Street, Suite A<br>
Santa Fe, NM 87501 United States<br>
<br>
E-mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br> 
Telephone: 505-988-5152.<br>
<br>--->
<b>Customer Information</b><br>
We store information volunteered by users through our site's account administration and our mailorder division in Santa Fe, New Mexico. This information is used  primarily for customer orders and to improve the content of our web site. Users may update their personal information at anytime by logging into their online account.<br>
<br>
<b>Security</b><br>
Industry-standard encryption technologies are in place when customers login to their account or finalize their orders.<br>
<br>
<b>Credit Card Information</b><br>
Credit card numbers are stored on our online server in an encrypted format. Periodically this information is purged from the server leaving only the first and last four digits in an encrypted format.<br>
<br>
<b>Information Sharing</b><br>
From time to time we make customer address information available to other selected and approved organizations or businesses, primarily those who have a fine-art photography or arts focus, whose products or services we think our customers might find interesting.  Users who prefer not to have their information shared in this way may opt-out by unchecking the appropriate checkbox in their account administration.<br>
<br>
Similarly, users who do not wish to receive e-mail newsletters, e-mail announcements, or mailorder booklists from us in the future, may let us know by unchecking the appropriate checkboxes in their account administration.<br>
<br>
<b>Cookies</b><br>
Our site uses cookies as part of our shopping cart system. A cookie is a small file that is copied to a user’s hard drive and is accessed each time a user returns to the site. This cookie identifies the user and matches their unique ID with their shopping cart information allowing the user to return to their original shopping cart day after day. Cookies also allow us to collect vital information regarding affiliate programs and helps us keep track of users' visits to certain pages of our site.<br>
<br>
Cookies are also used to store visitors preferences, record session information, record user-specific information on which pages users access or visit, record past activity in order to provide better service when visitors return to our site, customize web page content based on visitors' browser type or other information that the visitor sends.<br>
<br>
<b>Ad Servers</b><br>
We do not partner with or have special relationships with any ad server companies.<br>
<br>
<b>Privacy Policy Changes</b><br>
This privacy policy is subject to change without notification. All changes are posted to this page on our web site. If you are concerned about how your information is used, please check this statement periodically. If you feel that our site is not properly following this stated policy, please <A HREF="contactus.cfm">contact us</A>.<!---at the address or phone number at the top of this page.--->
</td></tr></table>
