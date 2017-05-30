//
/* !UtilityCollection 0.1.8
	written by Daniel Espeset, April 20th 2009
	
	last update: 07.09.2010
	
	Changes
	----------
	
	v 0.1.8
		+ added resize functionality like T8 viewer
	
	Table of Contents
	------------------
	initialize()
	createCookie(str_name, str_value, int_days)
	readCookie(str_name) => value
	eraseCookie(str_name)
	
*/
//
//
//
var UtilityCollection = Class.create({ 
	initialize: function(){
		this.instID = 'UtilityCollection.' + parseInt(Math.random()*1000000);
	},
	//
	// createCookie()
	// sets a cookie, using the format createCookie('cookiename','value',100);
	//
	createCookie: function(name,value,days) {
		if (days) {
			var date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			var expires = "; expires="+date.toGMTString();
		}
		else var expires = "";
		document.cookie = name+"="+value+expires+"; path=/";
	},
	//
	// readCookie()
	// returns the value of a cookie, or null if cookie is not set
	//
	readCookie: function(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for(var i=0;i < ca.length;i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1,c.length);
			if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
		}
		return null;
	},
	//
	// eraseCookie()
	// erases cookie
	//
	eraseCookie: function(name) {
		this.createCookie(name,"",-1);
	},
	//
	// readHash()
	// reads the location # and returns the according number
	//
	readHash: function(){
		var x = parseInt(window.location.hash.replace('#',''));
		if(x) return x;
		else return false;
	},
	//
	// updateHash()
	// updates the # in the location bar to the current image number
	//
	updateHash: function(x){
		var currentURL = window.location.href.split('#');
		window.location = currentURL[0]+'#'+x;
	}
}); 
//
/* !MasterImage 0.1
 	written by Daniel Espeset, April 18th 2009
 	
    Table of Contents
    -----------------
    
    MasterImage Class Declaration
    default values
    
    - initialize()
    - jump()
    - next()
    - previous()
    - change()
    - preload()

*/
//
var MasterImage = Class.create({
	current: 0,
	images: [],
	loading: false,
	imageHeight: 0,
	imageWidth: 0,
	//
	//	initialize(extended element, extended element, array of extended elements, int);
	//	sets variables and fires startup methods.
	//
	initialize: function(containerE, imageE, imagesE, startingImageI){
		this.instID = 'MasterImage.' + parseInt(Math.random()*1000000);
		if(startingImageI) this.current = startingImageI;
/* 		alert("okay: "+this.current); */
		this.container = containerE;
		this.image = imageE;
		imagesE.each((function(e,i){
			this.images[i] = e.innerHTML;
			// Prevents mobile Safari from turning our image src into telephone numbers, like a jerk.
			if(e.innerHTML.match(/<a href="tel:[^>]*">[0-9\/]*<\/a>/)){
				this.images[i] = this.images[i].replace(/<a href="tel:[^>]*">/,'').replace(/<\/a>/,'');
			}
		}).bind(this));
		this.lastImage = this.images.length-1;
		this.imageHeight = this.image.getHeight();
		this.imageWidth = this.image.getWidth();
		this.preload();
/* 		alert(this.images[02]); */
		this.change();
	},
	//
	//	jump(int);
	//  jumps to the specified index in the images array
	jump: function(destination){
		this.current = destination;
		this.change();
	},
	//
	//	next();
	//	advances to the next image in the images array, or back to the beginning
	//
	next: function(){
		this.current = (this.current < this.lastImage) ? this.current+1 : 0;
		this.change();
	},
	//
	//	previous();
	//	moves backwards one step in the images array, or around to the last image.
	//
	previous: function(){
		this.current = (this.current != 0) ? this.current-1 : this.lastImage;
		this.change();
	},
	//
	//  change();
	//	changes the image.src to the value in images[current], returns true or false and sets loading var if not already loaded.
	//
	change: function(){
		this.onChange();
		var preloader = new Image();

		preloader.onload = ((function(){
			this.image.src = preloader.src;
			this.image.writeAttribute({ height: preloader.height }).store("nativeHeight",preloader.height);
			if(this.loading) this.loading = false;
			this.imageHeight = preloader.height;
			this.imageWidth = preloader.width;
			this.onLoaded();
			this.preload();
		}).bind(this));

		preloader.src = this.images[this.current];

		if(!preloader.complete) { 
			this.loading = true;
		}
		else this.loading = false;

		return this.loading;
	},
	//
	//	preload();
	//	preloads the images immediately before and after the currently displayed image
	//
	preload: function(){
		var preloadPrev, preloadNext, prevSrc, nextSrc;
		preloadPrev = new Image();
		preloadNext = new Image();
		prevSrc = (this.current > 0) ? this.current-1 : this.lastImage;
		nextSrc = (this.current < this.lastImage) ? this.current+1 : 0;
		preloadPrev.src = this.images[prevSrc];
		preloadNext.src = this.images[nextSrc];
	},
	//
	// onLoaded();
	// a custom onLoad event, fires when the current image has fully loaded
	//
	onLoaded: function(){
		return true;
	},
	//
	// onChange();
	//
	//
	onChange: function(){
		return true;
	}
});
//
/* !EnlargeViewer 0.1
 	written by Daniel Espeset, April 18th 2009
 	
    Table of Contents
    -----------------
    
	extends the MasterImage class with view controls
    
    - initialize($super, passed variables)
    - onChange()
    - onLoaded()
    - showImage()
    - showLoading()
    
*/
//
var EnlargeViewer = Class.create(MasterImage,{
	effectsDelay: .3,
	initialize: function($super, containerE, imageE, imagesE, startingImageI, loaderE, hoverControllerE){
		this.instID = 'EnlargeViewer.' + parseInt(Math.random()*1000000);
		this.loader = loaderE;
		this.hoverController = hoverControllerE;
		$super(containerE, imageE, imagesE, startingImageI);
	},
	//
	// onChange();
	// MasterImage event handler, fires on image change
	//
	onChange: function(){
		this.image.setOpacity(0.00001);
		if(this.loading){ 
			this.showLoading();
		}
		this.hoverController.hide();
		this.isActive = true;
	},
	//
	// onLoaded();
	// MasterImage event handler, fires on image loaded
	//
	onLoaded: function(){
		this.showImage();
		this.autoSize();

		// delay execution for FF4 RC
		var _t = this;
		setTimeout(function(){ 
			_t.autoSize(); 
			_t.container.setStyle({ width: _t.image.getWidth()+'px' });
			_t.hoverController.clonePosition(_t.image).show();
		
		}, 5);

	},
	//
	// showImage();
	//
	//
	showImage: function(){
		this.loader.hide();
		this.image.appear({ duration: this.effectsDelay, afterFinish: (function(){ this.isActive = false; }).bind(this) });
	},
	//
	// showLoading();
	//
	//
	showLoading: function(){
		this.loader.clonePosition(this.image).show();
	},
	//
	// alignVertically();
	//
	//
	alignVertically: function(element, offset, minMargin){
		var screenHeight = document.viewport.getHeight();
		var elementHeight = element.getHeight();
		var newMargin = ((screenHeight-offset)-elementHeight)*.5;
		newMargin = (newMargin > minMargin) ? newMargin : minMargin; 
		element.setStyle({top: newMargin+'px',position: 'relative'});
	},
	//
	// autoSize();
	//
	//
	autoSize: function(){
		var resizeTo = (document.viewport.getHeight()-($('controlsContainer').getHeight()*2.5));
		var nativeHeight = this.image.retrieve('nativeHeight');
		var newAttr = {};
		if(resizeTo <= nativeHeight && resizeTo >= 100){ 
			newAttr = (Prototype.Browser.IE) ? { height: resizeTo } : { height: resizeTo, width: 'auto'};
		}
		else if(resizeTo >= nativeHeight){ 
			newAttr = (Prototype.Browser.IE) ? { height: nativeHeight } : { height: nativeHeight, width: 'auto'};
		}
		else newAttr = (Prototype.Browser.IE) ? { height: '100' } : { height: '100', width: 'auto'};
		
		this.image.writeAttribute(newAttr);
		this.container.writeAttribute({ width: this.image.getWidth()+'px' }).setStyle({ width: this.image.getWidth()+'px' });
		this.alignVertically(this.container, $('controlsContainer').getHeight(), 20);
		this.hoverController.clonePosition
	}
});

var EnlargeController = Class.create({
	slideTime: 3000,
	options: { 
		lessInfoText: "less info",
		moreInfoText: "more info"
	},
	initialize: function(){
		
		this.instID = 'EnlargeController.' + parseInt(Math.random()*1000000);
		
		this.container = $('imageContainer');
		this.detailBin = $$('#detailBin span');
		this.imageBin = $$('#imageBin span');
		this.captionOverlay = $('captionOverlay');
		this.captionUnderlay = $('captionUnderlay');
		var image = $$('#imageContainer div img')[0];
		var images = $$('#images span');
		var imageIDs_in_order = new Array();
		this.imageBin.each(function(e){ 
			imageIDs_in_order.push(e.innerHTML)
		});
		var firstImage = imageIDs_in_order.indexOf($('firstImageID').innerHTML);
		if (!firstImage) firstImage = 0;
		var loader = $('loader');
		var hoverController = $('navContainer');
		
		this.controls = { 
			container: $('controlsContainer'),
			previous: $('navLeftA'),
			next: $('navRightA'),
			counter: $('imageCounter'),
			hoverPrevious: $('navLeft'), 
			hoverNext: $('navRight'),
			captionToggle: $('captionToggle'),
			slideshowToggle: $('slideshowToggle'),
			slideshowSpeed: $('slideshowSpeed'),
			slideshowNum: $('slideshowNum'),
			slideshowText: $('slideshowText')
		};
		
		this.updatedImages = new Array(this.imageBin.length);
		this.updatedImages.each(function(i){ 
			i = false;
		});
		
		this.mainImage = new EnlargeViewer(this.container, image, images, firstImage, loader, hoverController);
		
		this.utilities = new UtilityCollection();
		
		this.jumpToHash();
		this.update();
		
		this.container.show();
		this.controls.container.show();
		
		var cookievalue = this.utilities.readCookie('slideTime');
		if(cookievalue) this.slideTime = cookievalue*1000;
		this.controls.slideshowNum.update(this.slideTime/1000);
				
		this.controls.previous.observe('click',(function(){ 
			this.previous();
		}).bind(this));
				
		this.controls.hoverPrevious.observe('click',(function(e){
			e.stop();
			this.previous();
		}).bind(this)).observe('mouseover',(function(){
			this.controls.previous.addClassName('on').removeClassName('off');
		}).bind(this)).observe('mouseout',(function(){
			this.controls.previous.addClassName('off').removeClassName('on');
		}).bind(this));
		
		this.controls.next.observe('click',(function(){ 
			if(this.slideShow) this.toggleSlideshow();
			this.next();
		}).bind(this));
		
		this.controls.hoverNext.observe('click',(function(e){
			e.stop();
			if(this.slideShow) this.toggleSlideshow();
			this.next();
		}).bind(this)).observe('mouseover',(function(){
			this.controls.next.addClassName('on').removeClassName('off');
		}).bind(this)).observe('mouseout',(function(){
			this.controls.next.addClassName('off').removeClassName('on');
		}).bind(this));
		
		this.controls.captionToggle.observe('click',(function(){ 
			if(this.slideShow) this.toggleSlideshow();
			var action = (this.captionOverlay.visible()) ? 'hide' : 'show';
			this.overlayCaption(action);
		}).bind(this));
			
		this.controls.slideshowToggle.observe('click',(function(){
			this.toggleSlideshow();
		}).bind(this));
		
		this.controls.slideshowText.observe('click', (function(){ 
			this.toggleSlideshow();
		}).bind(this));
		
		Event.observe(document.onresize ? document : window, "resize", (function(){ this.mainImage.autoSize(); this.overlayCaption('update'); }).bindAsEventListener(this));

		
		new Control.Slider('delayHandle', 'delayTrack', {
			range: $R(1, 20),
			values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
			sliderValue: this.slideTime/1000,
			onChange: (function(v){ 
				this.slideTime = v*1000;
				this.toggleSlideshow();
				this.toggleSlideshow();
 				this.utilities.createCookie('slideTime',v,100);
			}).bind(this),
			onSlide: (function(v){
				this.controls.slideshowNum.update(v);
			}).bind(this)
		});
		
		this.hashWatch = setInterval((function(){ 
			this.jumpToHash();
		}).bind(this),1000);
		
		// For IE we have to jump to the image again, so that it will center properly.
		// UPDATE: Let's just always do this, chrome started having a problem as well.
		this.jump(this.mainImage.current);
			
	},
	next: function(){
		if(this.mainImage.isActive) return false;
		this.mainImage.next();
		this.update();
	},
	previous: function(){
		if(this.slideShow) this.toggleSlideshow();
		if(this.mainImage.isActive) return false;
		this.mainImage.previous();
		this.update();
	},
	jump: function(newImage){
		if(this.slideShow) this.toggleSlideshow();
		this.mainImage.jump(newImage);
		this.update();
	},
	jumpToHash: function(){
		var currentHash = this.utilities.readHash();
		if(currentHash && currentHash != this.mainImage.current+1) this.jump(currentHash-1);
	},
	update: function(){
		this.AjaxImage(this.mainImage.current);
		// /[$-/:-?{-~!"^_`\[\]]/ Updated 05.22.10, changed .replace(/%%%[^%]*/,' ') to .replace(/%%%.*/,' ') because an escaped space (%20) was causing markup to appear on the page. DE 
		var caption = this.detailBin[this.mainImage.current].innerHTML.replace(/%%%.*/,' '); // only show the title and year below the image, %%% is the delimiter
		this.overlayCaption('hide');
		this.controls.counter.update(this.mainImage.current+1);
		this.utilities.updateHash(this.mainImage.current+1);
		this.captionUnderlay.update(caption);
		this.captionText = this.detailBin[this.mainImage.current].innerHTML.replace('%%%',' '); // show everything under "more info"
		this.hasMoreInfo = (this.captionText.length > caption.length+9) ? true : false;
		if(!this.hasMoreInfo) this.controls.captionToggle.hide();
		else this.controls.captionToggle.show();
	},
	//
	// toggleSlideshow()
	// plays / pauses the slideshow.  Unfortunately, the name of the object instance must be hardcoded into the interval.
	//
	toggleSlideshow: function(){
		if(this.slideShow){
			this.controls.slideshowToggle.update('play');
			this.controls.slideshowSpeed.hide();
			this.controls.slideshowText.show();
			this.slideShow = false;
			clearInterval(this.slideController);
		}
		else {
			this.controls.slideshowToggle.update('stop');
/* 			this.slideshowSpeedInput.value = this.slideTime / 1000; */
			this.controls.slideshowSpeed.show();
			this.controls.slideshowText.hide();
			this.slideShow = true;
			this.slideController = setInterval("viewer.next()", this.slideTime);
		}
	},
	overlayCaption: function(action){
		switch(action){
			case "show":
				this.overlayCaption('update');
				this.captionOverlay.appear({ 
					duration: .2, 
					from: .0001, 
					to: 0.8,
					afterFinish: (function(){
						this.controls.captionToggle.update(this.options.lessInfoText);
					}).bind(this)
				});
				break;
			case "hide":
				this.captionOverlay.hide();
				this.controls.captionToggle.update(this.options.moreInfoText);
				break;
			case "update":
				var newWidth = (this.mainImage.image.getWidth()-80);
				this.captionOverlay.update(this.captionText).clonePosition(this.mainImage.image).setStyle({ height: 'auto', width: newWidth+'px' });
				break;
		}
	},
	AjaxImage: function(img){
	    if(!this.updatedImages[img]){
			new Ajax.Request('ajx_get_image.cfm',{ 
				method: 'get',
				parameters: { 
					i: this.imageBin[img].innerHTML
				}
			});
			this.updatedImages[img] = true;
		}
	}
});