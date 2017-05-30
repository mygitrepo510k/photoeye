var thumbScroller = Class.create({
	current_left: 0,
	options: {
		thumb_width: 120, // total calculated width of thumbnail element -- padding, margins, etc.
		container_width: 360,
		container_height: 'auto',
		speed: 20,
		offset_speed: 4
	},
	initialize: function(thumb_collection, target_container){
		this.thumb_collection = thumb_collection;
		this.target_container = target_container;
		this.target_container.update('<div id="thumb_scroller_container"><div id="thumb_scroller"></div></div><div id="zone_container"><div id="zone_left"></div><div id="zone_right"></div></div>');
		this.buildScroller();
		this.zone_container.observe('mouseover', (function(event){
			if(event.findElement('#zone_left')){
				if(!this.scrolling) this.scrolling = setInterval('s.scrollLeft()', this.options.speed);
			}
			else { 
				if(event.findElement('#zone_right')){
					if(!this.scrolling) this.scrolling = setInterval('s.scrollRight()', this.options.speed);
				}
				else { 
					if(this.scrolling) { 
						this.stopScrolling();
					}
				}
			}
			
		}).bind(this)).observe('mouseout', (function(event){
			this.stopScrolling();
		}).bind(this));

	},
	buildScroller: function(){
		this.thumb_container = $('thumb_scroller_container');
		this.zone_container = $('zone_container');
		this.zone_left = $('zone_left');
		this.zone_right = $('zone_right');
		this.thumb_scroller = $('thumb_scroller');
		this.total_width = this.options.thumb_width*this.thumb_collection.length;
		this.thumb_scroller.setStyle({ width: this.total_width+'px' });
		this.thumb_collection.each((function(e){ 
			this.thumb_scroller.insert(
				"<a href='"+
				e+
				"' rel='lightbox[publication]' class='thumb'><img src='"+
				e.replace('_large','_thumb')+
				"' /></a>"
			);
		}).bind(this));
//		this.zone_container.clonePosition(this.thumb_container);
		var width_style = this.options.container_width+'px';
		var height_style = this.options.container_height;
		this.thumb_container.setStyle({position: 'relative', overflow: 'hidden',width: width_style, height: height_style});
		
	},
	scrollLeft: function(){
		this.current_left += this.options.offset_speed;
		if(this.current_left <= 0){
			this.thumb_scroller.setStyle({ left: this.current_left+'px'});
		}
		else { this.current_left = 0; this.stopScrolling(); }
	},
	scrollRight: function(){
		this.current_left -= this.options.offset_speed;
		if(this.current_left >= (0-this.total_width)+this.options.container_width){
			this.thumb_scroller.setStyle({ left: this.current_left+'px'});
		}
		else { 
			this.current_left = (0-this.total_width)+this.options.container_width;
			this.stopScrolling();
		}
	},
	stopScrolling: function(){
		clearInterval(this.scrolling);
		this.scrolling = false;
	}
});