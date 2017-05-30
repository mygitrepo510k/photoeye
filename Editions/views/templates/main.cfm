<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<cfset current_event = event.getValue('event') />
<!--- !Kludge for root problem --->
<cfif current_event EQ "editions" OR current_event EQ "index.cfm">
	<cflocation url="Index.cfm/page.index" addToken="no"/>
</cfif>
<cfoutput>
	<head>
		<title>#event.getValue('page_title','photo-eye Editions')#</title>
	    <link href="#application.css_path#main_fluid.css?v=0.4" rel="stylesheet" type="text/css">
   	    <link href="#application.css_path#lightbox.css?v=0.1" rel="stylesheet" type="text/css">
	    <script src="#application.root_path#js/prototype.js?v=1.6.3"></script>
	    <script src="#application.root_path#js/scriptaculous.js?v=0.1"></script>
	    <script src="#application.root_path#js/lightbox.js?v=2.1"></script>
 	    <script src="#application.root_path#js/scroller.js?v=1.1"></script>
 	<style>
 		.ie_clear { display: none; }
 		.two_column .image_menu .first_tab .tab	{ float: right; }
 	</style>
 	
 	<!--[if IE 7]>
 	<style>
 		.two_column { display: block; }
 		.two_column .ie_clear {
 			clear: both;
 		}
		.two_column .left { display: block; 
			float: left; }
		.two_column .right { display: block; 
			float: left; }
		.two_column .image_menu .first_tab { display: block; }	
 		.two_column .image_menu .first_tab .tab	{ float: left; }
 		.trow { display: block }
 	</style>
	<![endif]-->
	</head>
	<body>
	<div id="contain_all">
		<div id="menu">
			<div class="padded_inner">
				<div class="fluid_line">
					<div class="left">
						<a href="#event.linkTo('page.index')#">
							<div id="logo">
								
							</div>
						</a>
					</div>
					<div class="right">
						<div class="option <cfif current_event CONTAINS 'publication.'>on<cfelse>off</cfif>">
							<p><a href="#event.linkTo('publication.index')#">publications</a></p>
						</div>
						<div class="option <cfif current_event CONTAINS 'artist.'>on<cfelse>off</cfif>">
							<p><a href="#event.linkTo('artist.index')#">artists</a></p>
						</div>
						<div class="option <cfif current_event CONTAINS 'information.about_us'>on<cfelse>off</cfif>">
							<p><a href="#event.linkTo('information.about_us')#">about us</a></p>
						</div>
						<div class="option <cfif current_event CONTAINS 'information.contact'>on<cfelse>off</cfif>">
							<p><a href="#event.linkTo('information.contact')#">contact</a></p>
						</div>
						<div class="option off">
							<p class="last"><a href="http://www.photoeye.com/">photo-eye</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="padded_inner">
				<cfif event.ValueExists('error_message')>
					#helpers.gui.insertMessageWindow('error', event.getValue('error_message'))#
				</cfif>
				<cfif viewCollection.Exists('error')>
					<cfif StructKeyExists(SESSION,'logged_in')>
						#helpers.gui.insertMessageWindow('error',viewCollection.getView('error'))#
					<cfelse>
						#helpers.gui.insertMessageWindow('error','There was an error loading the page, our website administrators have been notified.')#								#helpers.mailer.errorFound(viewCollection.getView('error'))#
					</cfif>
				</cfif>
				<cfif event.ValueExists('notice_message')>
					#helpers.gui.insertMessageWindow('notice', event.getValue('notice_message'))#
				</cfif>
				#viewCollection.getView("body")#
				<div class="ie_clear">&nbsp;</div>
			</div>
		</div>
		<div id="footer">
			<div class="padded_inner">
				<div class="top_rule">
				</div>
				<div class="left">
					#helpers.gui.insertAdminControls(event.getValue('buttons',StructNew()))#
				</div>
				<div class="right">
					<cfif StructKeyExists(SESSION, 'logged_in')>
						[<a href="#event.linkTo('user.xe_logout')#">logout</a>] photo-eye Editions #application.version_number#
					<cfelse> 
						Unless otherwise noted, all content is &copy; photo-eye Editions #dateFormat(now(),'yyyy')#, all rights reserved
					</cfif>
				</div>
			</div>
		</div>
	</div>
	</body>
</cfoutput>
</html>