<CFPARAM NAME="Season" DEFAULT="Fall">
<CFPARAM NAME="Year" DEFAULT="2007">

<CFSET xTitle="Magazine">
<CFSET xSubPage="1">
<CFSET xPathToRoot="../../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Photo-Eye Booklist">

<cfinclude template="../../templates/Header.cfm">
<DIV ALIGN="CENTER">

	<CFSET xFontColor = "Black">
	
	
  <CFIF Page is "Reviews">
    
		<CFSET xSubTitle = "New Books Reviewed">
	<CFELSEIF Page is "Contact">
		<CFSET xSubtitle = "Contact Us">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
	
		<cfset page="Article">
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR><BR>


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />
 
  <TABLE WIDTH="700">
    <TR> 
      <td colspan="3" align="center"> <p>&nbsp;</p>
        <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>MINNESOTA 
          TO PARIS<br>
          <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>JEN 
          BEKMAN chats it up with Alec Soth, who recently found himself,<br>
          much to his discomfort, at the center of the attention of the fashion 
          world.</strong></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>INTERVIEW 
          BY JEN BEKMAN<br />
          </strong></font></p>
        </td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
      <td width="400" valign="top" align="right"> <p> <cfoutput> 
    
            <br>
            <cfset xImage = "soth.jpg">
            <cfset xPath = "../../booklist/2007_Fall">
            <CFSET xHEIGHT = "320">
            <CFSET xWidth = "320">
            <cfinclude template="../../templates/imagesizer.cfm">
            <CFSET xCoverHeight = imagecr.height>
            <CFSET xCoverWidth = imagecr.width>
            <cfset xTitle2x="Paris Minnesota">
            <cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
            <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP748"> <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP748">
            <img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a> 
            <br>
            <br>
				<cfset xImage = "soth_cover.jpg">
            <cfset xPath = "../../booklist/2007_Fall">
            <CFSET xHEIGHT = "120">
            <CFSET xWidth = "120">
            <cfinclude template="../../templates/imagesizer.cfm">
            <CFSET xCoverHeight = imagecr.height>
            <CFSET xCoverWidth = imagecr.width>
            <cfset xTitle2x="Paris Minnesota">
            <cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
           <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP748"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  border="#xBorder#" style="border-color: #aBorderColor#" height="#xCoverHeight#" width="#xCoverWidth#">
            </a> <br>
            <br>
          </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p>ALEC SOTH IS THE THIRD PHOTOGRAPHER TO 
          produce Magnum Photos&#8217; annual <em>Fashion Magazine</em>, following 
          in the formidable footsteps of Martin Parr and Bruce Gilden. Soth&#8217;s 
          edition, entitled <em>Paris Minnesota</em>, is a study of contrasts&#8212;the 
          pages are populated with high-style Parisians and car-proud Minnesotans 
          alike. The Grand Palais fills up for the Chanel runway show across a 
          gate fold sequence four pages wide. Later in the book, a similar spread 
          is devoted to the ebb and flow of winter snow across a JC Penney parking 
          lot. The launch party in June was a huge one-night-only affair at the 
          Jeu De Paume in Paris. Attendees sipped champagne in galleries hung 
          with nearly 40 large-scale prints of photographs from the magazine. 
          My highly anticipated copy was hand delivered to me by the man himself, 
          who also took some time to chat with me about photography, fashion and 
          the making of the magazine.</p>
        <p><br>
          <strong>Jen Bekman:</strong> Everyone&#8217;s buzzing about Fashion 
          Magazine and yet, I hadn&#8217;t heard of it all before you started 
          working on it a few months ago. Suddenly it&#8217;s everywhere! Is this 
          edition generating more excitement than previous ones? <br>
          <strong>Alec Soth: </strong>No, I don&#8217;t think so. One of the things 
          about Magnum is that it is an international organization. Since the 
          magazine is produced out of Paris it gets much more attention in Europe 
          ... Martin Parr is an absolute superstar in Europe. I&#8217;m always 
          shocked when I meet younger U.S. photographers who don&#8217;t know 
          who he is. <br>
          <strong>JB:</strong> Right, ok, so U.S. attention then! BLOGGER attention... 
          You&#8217;re big on the internet, like being big in Japan but maybe 
          even somewhat more marginal.<br>
          <strong>AS:</strong> Yes, big with nerds.<br>
          <strong>JB:</strong> Do your online activities influence how the project&#8217;s 
          being received?<br>
          <strong>AS:</strong> I really don&#8217;t think it is a big part of 
          it. I mean, the launch of the magazine had 1500 people. These were fancy-pants 
          Parisians. I assure you they aren&#8217;t reading about what I had for 
          breakfast on my blog. (Cheerios) <br>
          <strong>JB:</strong> Surely you have 1,500 rabid fans who read your 
          blog, not<br>
          because they want to know what you had for brekkie.<br>
          <strong>AS:</strong> But I do know that when I posted the info about 
          the magazine on my blog, my mom ordered six copies.<br>
          <strong>JB:</strong> Many people, not just your mom, have bought multiple 
          copies. Yours is the third edition of Fashion Magazine. The first one 
          was done by Martin Parr, the second by Bruce Gilden. Seems like they&#8217;re 
          all destined to become collector&#8217;s<br>
          items, if they aren&#8217;t already.<br>
          <strong>AS:</strong> I don&#8217;t know the status of the previous editions, 
          other than that I truly treasure them. Both are fantastic. Vince Aletti 
          said Gilden&#8217;s was one of the ten best books of last year. <br>
          <strong>JB:</strong> Looking at the three in series, I love seeing the 
          differences in the ways that you&#8217;ve each interpreted the project. 
          There&#8217;s the underlying coherence, but wildly different interpretations 
          from the size of the mags, to the binding, to the paper, the editorial. 
          So many different choices, and in every instance really spot-on design 
          as well.<br>
          <strong>AS: </strong>The designer of all three, Christophe Renard, is 
          really great. He traveled with me on most of the shoots, so he was able 
          to evolve with the project. Each magazine does reflect the author in 
          interesting ways&#8212;all three issues are entirely different. That 
          is part of the charm. But the key, the thing that makes it such a great 
          object, is the ads. The fact that one person produces these ads is so 
          funny and strange and contrary to both art and advertising. The thing 
          that kills me is looking at Martin&#8217;s ads. I mean, he did all of 
          those on a copy stand in a single afternoon. I had to travel all over 
          creation looking for the perfect light. Totally unfair.<br>
          <strong>JB: </strong>How did the advertisers feel about your Where&#8217;s 
          Waldo<br>
          approach to product placement?<br>
          <strong>AS:</strong> We went to Brittany to start shooting the ads. 
          I started taking the pictures and had a complete meltdown. I hated the 
          pictures. I remember saying to the art director: &#8220;You might as 
          well take the picture. I have no idea what I&#8217;m doing.&#8221; So 
          we took a break and went to lunch. I suggested the Where&#8217;s Waldo 
          idea (something I&#8217;d thought about applying to my artwork years 
          ago) and they went for it. So we raced from lunch to the beach in Brittany 
          and took the picture of the watch. We were so excited. But we hadn&#8217;t 
          talked to the advertisers or even the person in charge of advertising 
          at Magnum.<br>
          <strong>JB:</strong> Hah! Troublemaker.<br>
          <strong>AS: </strong>You should have seen the look on his face when 
          I told him the concept. But I said then, and I still believe it now, 
          that this is very good advertising. It engages the viewer. In the show 
          at Jeu de Paume, everyone became like little kids. It was a huge hit.<br>
          <strong>JB:</strong> It&#8217;s definitely something that&#8217;s been 
          widely discussed, whereas otherwise the ads would&#8217;ve likely been 
          more glossed over, so to speak. Later in the book, the blow-ups of the 
          products themselves were printed on different paper and have an entirely 
          different feeling. Was that part of the original concept or something 
          introduced to placate advertisers after the fact?<br>
          <strong>AS:</strong> At first the blow-ups were an experiment to appease 
          the<br>
          advertisers. But we did a test and all sort of fell in love with<br>
          them. It was funny to do a &#8216;pack shot&#8217;, but make it this 
          lowres,<br>
          unsophisticated thing. It was beautiful.<br>
          <strong>JB:</strong> And of course the book is not comprised entirely 
          of advertisements. There are a number of stunning portraits in the magazine&#8212;quite 
          clearly your portraits. It&#8217;s your eye, your composition, etc. 
          For me, it further blurs the already very blurry line of the difference 
          between editorial and fine art photography. What&#8217;s different for 
          you? Aside from the obvious things that have been discussed: process 
          (i.e., assistants vs. working alone) and styling (fashion shoots have<br>
          specific clothing and stylists.)<br>
          <strong>AS: </strong>I don&#8217;t entirely know how to answer the question. 
          Clearly a number of the pictures, especially the Paris pictures, have 
          a slightly different feeling. But I have a hard time separating myself 
          from the experience of making them&#8212;which was so different.<br>
          <strong>JB:</strong> If I were to sequence some of your fashion stuff 
          with some of your personal stuff and show it to someone who doesn&#8217;t 
          have context, that viewer might have a hard time differentiating.<br>
          <strong>AS:</strong> I think that is especially true of the Minnesota 
          photographs. They really look like my other work, even though many of 
          the kids are wearing designer clothes.<br>
          <strong>JB:</strong> In other interviews you talk about &#8220;the space 
          between&#8221; Paris and Minnesota as a defining vision of the magazine. 
          But, I have to tell you, a lot of those kids are really striking, and 
          probably would be in Paris, too.<br>
          <strong>AS:</strong> Right. As I said before, a huge part of my art 
          is the hunt.<br>
          As with most editorial work, that part of the process was stripped away. 
          So the people I photographed aren&#8217;t necessarily the same ones 
          that normally catch my eye. But one of the reasons I like doing this 
          kind of work is that I expand my vision. With this project I started 
          to fall in love with these older Parisian women. Absolutely stunning.<br>
          <strong>JB:</strong> Are most of the Parisians actual fashion people 
          or did you<br>
          cast models too? There are lots of portraits of bold-faced<br>
          names in there.<br>
          <strong>AS:</strong> In the beginning we used a lot of models for those 
          transformation pictures. I really disliked working with models and they 
          were mostly edited out. There are only one or two that we left in the 
          magazine. When we were almost done, we realized that we needed another 
          proper fashion sequence in Paris. They asked me for an opinion. I told 
          them this idea of an older woman (we had already photographed Sonia 
          Rykiel, Fifi, and Farida) and it just fit. The rest of the people are 
          designers and creative types in Paris.<br>
          <strong>JB:</strong> And where do they fall on the continuum of models 
          and Minnesotans? Did you find it hard to get them to relax and let down 
          their guards?<br>
          <strong>AS:</strong> It is a big mix. The truth is that I don&#8217;t 
          love photographing<br>
          anybody who gets photographed a lot. But sometimes magical<br>
          things happen. I love a couple of the designer pictures.<br>
          <strong>JB:</strong> I also wonder how you relate to those people. One 
          of the<br>
          most endearing things about you is how unassuming you are. I wonder 
          if there&#8217;s any kind of weird dynamic around that contrast. You 
          are many really awesome things, but I wouldn&#8217;t count glamorous 
          among them.<br>
          <strong>AS:</strong> Ouch.<br>
          <strong>JB:</strong> You know I don&#8217;t mean that as an insult at 
          all! I&#8217;ve definitely been in situations where I&#8217;ve been 
          concerned about being taken seriously because I&#8217;m not fancy enough.<br>
          <strong>AS:</strong> The great thing about not being of that world was 
          that I<br>
          wasn&#8217;t intimidated. If you don&#8217;t know who Azzedine is, you 
          won&#8217;t be intimidated by him. But, yes, I&#8217;d be lying if I 
          didn&#8217;t say I was a little self-conscious. I mean, the job of the 
          people in the fashion world is to be able to read people by their appearance. 
          So I know that they are reading me just as much as I&#8217;m reading 
          them.<br>
          <strong>JB: </strong>With all that in mind, let&#8217;s talk about the 
          reception at the<br>
          Jeu de Paume. Did you wear your mandals to opening night<br>
          with the Parisians? I saw that you had them on for the<br>
          installation shots.<br>
          <strong>AS:</strong> No, but that brings up a funny story. I was in 
          the airport in Minneapolis waiting for my flight to Paris for the opening. 
          I was wearing my sandals, shorts and a T-shirt. I realized that I was 
          going to be freezing on the plane. So I bought a sweatshirt that said 
          MINNESOTA. On the plane I had the idea of wearing this to the opening. 
          I thought it would be really funny. But the night of the opening was 
          really hot. I didn&#8217;t want to be both vulgar and sweaty.<br>
          <strong>JB:</strong> What did you end up wearing? I think about having 
          to dress for an event with a bunch of Parisians and I get scared. I&#8217;m 
          guessing that you stick with anti-fashion fashion, generally speaking.<br>
          <strong>AS:</strong> Here is the thing. I&#8217;m really uncomfortable 
          being the center of attention. And I&#8217;m uncomfortable using clothes 
          to draw attention to myself. So, as usual, I tried to be neutral. For 
          this opening, neutral meant a black suit, no tie, etc.<br>
          <strong>JB:</strong> So, suit and all, the launch was a smashing success&#8212;one 
          champagne-fueled evening and it was done!<br>
          <strong>AS:</strong> While it was frustrating that it was one night, 
          it also made it special. People knew that was there only chance, so 
          there was a long of energy that night. It was interesting ... a whole 
          different way to create an event.<br>
          <strong>JB:</strong> What&#8217;s next, both for the magazine and the 
          exhibition?<br>
          <strong>AS:</strong> The magazine was produced in such a frenzy that 
          we didn&#8217;t really have time to plan its life after the European 
          launch. So right now we are working on a U.S. launch, exhibitions and 
          so forth. Also, a few of the pictures will work their way into my ongoing 
          series of portraits and favorite miscellaneous pictures.<br>
          <strong>JB:</strong> I&#8217;m sure there are a lot of people stateside 
          who&#8217;d love to see the exhibition in person. What else is on tap 
          for you in the next year? All those people I know who pre-ordered Fashion 
          Magazine seemed to have pre-ordered Dog Days, Bogota too. Is a lot of 
          your energy focused on getting that project done right now?<br>
          <strong>AS:</strong> It is funny timing. I feel like an actor with two 
          movies coming out at the same time. Dog Days, Bogota was in the can 
          years ago, but is finally coming out now. Fashion Magazine happened 
          so quickly&#8212;it is just a coincidence.<br>
          <strong>JB:</strong> You&#8217;ve had a very fashionable year so far&#8212;the 
          W Magazine spread and this whole &lt;i&gt;Fashion Magazine&lt;/i&gt; 
          project have taken you and the 8x10 all over the world shooting expensive 
          clothes, beautiful people and fancy things. Is there more fashion in 
          your future, or have you had enough for the time being?<br>
          <strong>AS:</strong> I&#8217;m done. Fashion is an image-gobbling machine. 
          I don&#8217;t<br>
          want to get sucked up.
        <p>&#8230;
        <p><em>Fashion Magazine: Paris-Minnesota</em>. Photographs by Alec Soth. 
          Interview by Marta Gili. Published by Julien Frydman/Magnum Photos, 
          Paris, 2007. Designed by Christophe Renard. Production by Ga&euml;lle 
          Quentin. Editorial consulting by Sophie Djerlal. Printed by Fot Imprimeurs, 
          France. Softbound. 188 pp., four-color illus., 9&frac12; x 12 $25.00</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE032
		 ">ordering</a> the<br>
          current issue of <i>photo-eye Booklist</i>. </font><br><br>
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP748">Order</a> 
          <em>Fashion Magazine: Paris-Minnesota</em>
        <p> <a href="http://www.photoeye.com/booklist/subscribe.cfm">Subscribe</a> 
          to the <em>photo-eye Booklist. </em> <br>
        </p>
        </p>
      </TD>
    </TR>
    <tr>
      <td valign="top" align="right">&nbsp;</TD>
      <td>&nbsp;</td>
      <td valign="top">&nbsp;</TD>
    </TR>
  </TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




