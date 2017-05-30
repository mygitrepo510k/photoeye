<CFPARAM NAME="Season" DEFAULT="Spring">
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
      <td colspan="3" align="center">
<p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>ABOUT 
          OUR COVER</strong></font></p>
        <p><strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Having 
          grown up in the South, where a white winter was </font></strong><strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          something only imagined, photographer LISA M. ROBINSON accepted a fellowship 
          and found herself knee-deep in a new reality. This beautiful new book 
          is the result.</font></strong></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>INTERVIEW 
          BY PATRICK AMSELLEM<br />
          </strong></font></p>
        </td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
      <td width="400" valign="top" align="right"> <p> <cfoutput> <br>
<!---            <cfset xImage = "Snowbound_2.jpg">
            <cfset xPath = "../../booklist/2007_Winter">
            <CFSET xHEIGHT = "320">
            <CFSET xWidth = "320">
            <cfinclude template="../../templates/imagesizer.cfm">
            <CFSET xCoverHeight = imagecr.height>
            <CFSET xCoverWidth = imagecr.width>--->
            <cfset xTitle2x="Snowbound">
            <cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
            <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZD188">
            <img src="Snowbound_2.jpg"  alt="'#xTITLE2X#'"  border="#xBorder#" style="border-color: #aBorderColor#" height="258" width="320"></a> 
            <br>
            <br>
<!---            <cfset xImage = "Snowbound.jpg">
            <cfset xPath = "../../booklist/2007_Winter">
            <CFSET xHEIGHT = "120">
            <CFSET xWidth = "120">
            <cfinclude template="../../templates/imagesizer.cfm">
            <CFSET xCoverHeight = imagecr.height>
            <CFSET xCoverWidth = imagecr.width>--->
            <cfset xTitle2x="Snowbound">
            <cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
            <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZD188"><img src="Snowbound.jpg"  alt="'#xTITLE2X#'"  border="#xBorder#" style="border-color: #aBorderColor#" height="120" width="148"> 
            </a> <br>
            <br>
          </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p> FOR THE PAST FOUR WINTERS, Lisa Robinson 
          has been photographing in the snow. She grew up in, and is comfortable 
          in, the South. But the mental landscape that the spare, frozen white 
          physical landscape suggests is one that has intrigued her enough to 
          keep going back, even though she hates the cold. Patrick Amsellem interviewed 
          the artist for <em>photo-eye</em>.</p>
        <p><br>
          <strong>Patrick Amsellem:</strong>There are so many things that come 
          to mind when I look at the images in <em>Snowbound</em>: the importance 
          of the trace, the mystery of layers and, perhaps the strongest impression, 
          the contrast of a kind of static, silent beauty with an underlying sense 
          of forceful tension. Water is such a powerful element and even in its 
          solid state of matter the potential of change is looming. What attracted 
          you to these landscapes to begin with?<br>
          <strong><font color="#0066CC">Lisa Robinson:</font></strong><font color="#80FF80"> 
          </font>One of the first images I made that struck a chord I had not 
          heard before was <em>Running Fence</em>. I was driving down the back 
          roads of Pennsylvania one winter afternoon when the surrounding flat 
          fields of snow were suddenly pierced by a bright orange fence that disappeared 
          into the horizon. Approaching the quiet scene, I was lured by the opening 
          in the fence, mesmerized by the ever-so-slight separation of earth and 
          sky. There were stories here, of human efforts to control and define, 
          of suggested life beneath the snow, of the mysterious unknowns beyond 
          the horizon. I had walked into a Japanese ink drawing splashed with 
          color, and I just stood there in awe of its simple complexity. Here, 
          on the side of a snowy highway in December, I experienced a connection 
          between a waking and dreaming world, a place where time seemed suspended. 
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The resulting image continued to work 
          on me, and I asked myself why. I didn&#8217;t know the answer, but I 
          sought understanding. Perhaps I was first drawn to the snow because 
          it was so unfamiliar to me. I grew up in the South, so winter as a time 
          of snow and cold was an imagined space that existed on classroom bulletin 
          boards. Experiencing these landscapes for the first time, now as a photographer, 
          was revelatory. That was the beginning. From there, I wanted to go deeper. 
          I am less interested in documentation than in evocation. These spaces 
          accessed an emotional and cerebral response in me that I wanted to understand.<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The tension you refer to is so important 
          to me. I hate the cold. I much prefer a tropical climate. Yet something 
          visual and conceptual compelled me into these icy landscapes. These 
          were places I was not meant to be: walking on ice that creaks with flowing 
          water below, trespassing onto private property, photographing in a heavy 
          blizzard. I found that the physical challenge of photographing in these 
          conditions was only quieted by the mind. The stillness of the image 
          is areflection of that inner space I found. And yet, simultaneously, 
          the wind whipped around me relentlessly and the cold still numbed my 
          toes.<br>
          <strong>PA: </strong>You touch upon a feature of your work that I really 
          appreciate: the subtle fusing of form and content. Your formal solutions 
          are tight, elegant and beautiful, often with recurring shapes&#8212;circles, 
          poles, ropes&#8212;that anchor the compositions. Now and again, as in 
          <em>Crush</em>, you use the all-over to create dramatic, more abstract 
          images. At the same time, as you allude to, the palimpsest quality of 
          the pictures stretches much further than just the physical, tangible 
          layers in the landscape so as to suggest almost meditative and even 
          existential qualities. Could you talk more about this particular connection, 
          this sense of evocation? And how do you arrive at your titles?<br>
          <strong><font color="#0066CC">LR:</font></strong> I have always been 
          drawn to work that functions on multiple levels. Literature has taught 
          me much about the power of a concept to take form in a specific way 
          while still being enormously open. Ultimately, it is a very human impulse 
          that I am listening to, giving voice to, trying to comprehend. The landscapes 
          I enter are, certainly, very real. But I believe that what I see in 
          the landscape is a reflection of the thoughts in my head, the questions 
          I am engaging. The tundra is my canvas, my blank page. Winter is an 
          idea that I enter, as much as a landscape I explore. So many writings 
          about winter touch upon the thought of the world at sleep, of dormant 
          life. There is this underlying sense that Spring is synonymous with 
          life and that Winter is the fallow period leading back to it. I believe 
          in greater contradiction, greater ambiguity. All things are whole. I 
          am seeking indications of this belief in the landscape. I enjoy the 
          ways in which these images can comment on a very contemporary world 
          at the same time that they resonate with deeper implications. <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The titles come from this same source, 
          in some ways. Music and poetry possess the evocative powers I hope my 
          images to convey. Oftentimes I will look at an image I have made and 
          try to distill its essence for me, in my head. The very idea can then 
          be articulated in a word or phrase that captures that spirit. It is 
          as much an intellectual challenge as a poetic one, since I want to remain 
          faithful to ideas that are often slippery, even changeable. Many of 
          my titles embrace the ambiguity that defies simple categorization. They 
          help me comprehend these images without closing them up.<br>
          <strong>PA: </strong>&#8220;It is a sparse and revealing white,&#8221; 
          the poet Mark Strandwrites in the introduction to <em>Snowbound</em>. 
          His two poems, &#8220;White&#8221; and &#8220;Snowfall,&#8221; create 
          a beginning and an end to your book. Did Strand, former painter and 
          United States poet laureate, write these pieces specifically for <em>Snowbound</em>? 
          How did your collaboration come about?<br>
          <strong><font color="#0066CC">LR:</font></strong> Several winters ago, 
          I began reading haiku. I was drawn to the complexity of such a spare 
          and limited form, especially those poems that referenced aspects of 
          winter. These images share a kinship with poetry, using a visual language 
          that is both specific and metaphorical. So when I read Mark Strand&#8217;s 
          poem &#8220;A Piece of the Storm,&#8221; I was mesmerized. It is a poem 
          about life and death and time and nature, manifested in the ephemeral 
          and the eternal snowflake.<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I wrote him a letter, accompanied by some 
          of my images, and asked if he would be willing to write an introduction 
          for the book. I was stunned by his generous and sincere response; he 
          simply called me the morning he received my letter and offered to write 
          something. We had several more phone conversations before he asked me 
          if I might consider using a poem that he had written years ago, a poem 
          which he felt spoke to my work. He read me “White” on the phone. It 
          was perfect. He sent me the poem in a collection, where I also discovered 
          “Snowfall.” It felt like the natural conclusion, that quiet dark whisper 
          of a close. It is a privilege to have someone with such insight and 
          eloquence to offer his perspective to this work. The images are cradled 
          in the palms of poetry.<br>
          <strong>PA:</strong> Indeed, poetry frames the photographs and articulates 
          a certain mood, both emotional and existential. Word and image work 
          together here, almost seamlessly. In your own introduction you talk 
          about <em>Snowbound</em> as a journey, and in a previous conversation 
          you have also hinted at the project in terms of a passage, a &#8220;heroic 
          journey.&#8221; Even though the images don&#8217;t constitute a narrative 
          as such, how do you think about this idea of a sequence or progression? 
          For practical reasons, the book format also requires an order in which 
          the images will be read. How did you make these decisions? And how was 
          your collaboration with the publisher, Kehrer, structured?<br>
          <strong><font color="#0066CC">LR:</font></strong> Mark Strand&#8217;s 
          poem &#8220;White&#8221; describes the existential space that <em>Snowbound 
          </em>explores. The process of making this work and understanding it 
          has enabled me to confront the pain of loss and embrace it as a part 
          of life. My introduction sets a tone for <em>Snowbound</em>, revealing 
          the sense of this work as a journey. The sequencing of the images is 
          intended to reflect this evolution as well&#8212;from initiation, to 
          challenges, to enlightenment, to a return (yes, the heroic journey). 
          I do not wish to bash people over the head with these ideas&#8212; they 
          have developed exceedingly naturally, revealing themselves over time, 
          formulating the structure and significance of the work to me as I have 
          sought to understand it as a whole. My sequencing is an extension of 
          this logic&#8212;it is not formal, or geographic, or typological, but 
          conceptual.<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Once I understood the broader swath of 
          this work, I could manifest it through the book form. The book is not 
          merely a catalogue of images, but a coherent work itself. I have given 
          great thought to its design and flow. The decision to print one image 
          per spread as a full bleed is one that enables the viewer to enter into 
          the expansive space of this work, and to discover his or her own connections. 
          The beginning image is echoed in the final one. The evolution of the 
          work has led back to this point, continuing the cycle, but there has 
          been a change. I thought of Joyce&#8217;s <em>Ulysses</em>, and the 
          return to Molly Bloom&#8217;s bed. The experience of the journey lies 
          within the space of this day. There is ambiguity in time, in space, 
          in place. And yet, all things are connected. <br>
          <strong>RW:</strong> But the dissatisfaction of others, particularly 
          with the narrative limitations of photography, has led them to add sound 
          or moving image sequences. You seem determined&#8212; and happy&#8212;to 
          stay within the boundaries.</p>
        <p><em><br>
          Snowbound. </em>Photographs by Lisa M. Robinson. Introduction by Mark 
          Strand. Designed by Lisa M. Robinson and Petra Wagner. Kehrer Verlag, 
          Heidelberg, 2007. Trade edition of 1700. Limited edition of 75 printed 
          by Cloverleaf Press, Austin. Photo-illustrated paper over boards. 112 
          pp., 50 color illustrations, 11&frac34; &times; 9&frac34; &nbsp;$60.00/$750.00</p>
        <p><br>
          <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ZD188&CFID=5471729&CFTOKEN=67441906">Order</a> 
          <em>Snowbound</em> </p>
        <p> <a href="http://www.photoeye.com/booklist/subscribe.cfm">Subscribe</a> 
          to the <em>photo-eye Booklist.</em><br>
        </p>
        <p><br>
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




