var Revealable = Class.create({
	initialize: function(){
	
		this.portfolio_revealers = $$('.portfolio_revealer');
		this.portfolio_revealees = $$('.portfolio_revealee');
		
		if(this.portfolio_revealers){
			this.i = 0;
			this.portfolio_revealers.each(
				(function(e, index){
					e.observe('click',(
						(function(event){
							event.stop();
							this.portfolio_revealees[index].toggle();
						}).bind(this)
					));
					this.i++;
				}).bind(this));
		}
		
		if($$('.revealable')){
			$$('.revealable').each(function(e){ 
				e.down('.revealer').observe('click',(function(event){
					if(e.down('.revealee').visible()){
						this.removeClassName('open');
					}
					else this.addClassName('open');
					e.down('.revealee').toggle();
				}));
			});
		}
		
	}
});

var peMenu = Class.create({
	initialize: function(){ 
		this.menu = $('peMenu');
		this.menu.setOpacity(0.00001);
		this.trigger = $('header_top');
		this.state = 'off';
		this.links = $$('a[rel=division_link]');
		this.links.each((function(element){ 
			element.observe('mouseover',(function(){
				this.menu.removeClassName(this.menu.className);
				this.menu.addClassName(element.className+'_logo');
			}).bind(this));
		}).bind(this));
		Event.observe(document, 'mousemove', (function(e){ this.getCords(e); }).bindAsEventListener(this));
	},
	getCords: function(e){
		this.mouseX = Event.pointerX(e);
		this.mouseY = Event.pointerY(e);
		if(this.mouseY <= 60){
			this.on();
		}
		if(this.mouseY > 60){
			this.off();
		}
	},
	on: function(){
		switch(this.state){
			case 'off':
				this.state = 'appearing';
				this.appear(0.00001);
				break;
			case 'disappearing':
				this.cancelAll();
				this.fader.cancel();
				this.state = 'appearing';
				this.appear(this.menu.getOpacity());
				break;
			default:
				break;
		}
	},
	off: function(){
		switch(this.state){
			case 'on':
				this.state = 'disappearing';
				this.disapear();
				break;
			case 'appearing':
				this.state = 'disappearing';
				this.disapear();
				break;
			default:
				break;
		}
	},
	appear: function(starting_opacity){
		this.appearer = new Effect.Appear(this.menu, { 
			from: starting_opacity,
			to: 1,
			queue: { 
				position: 'end', 
				scope: 'pe_menu'
			}, 
			afterFinish: (function(){ 
				this.state = 'on';
			}).bind(this) 
		});
	},
	disapear: function(){
		// Effect.Queues.get('pe_menu').each(function(effect){ effect.cancel(); });
		this.fader = new Effect.Fade(this.menu, {
			delay: 2,
			to: 0.00001,
			queue: { 
				position: 'end', 
				scope: 'pe_menu'
			}, 
			afterFinish: (function(){ 
				this.state = 'off';
				this.menu.removeClassName(this.menu.className);
				this.menu.addClassName('default_logo');
			}).bind(this)
		});
	},
	cancelAll: function(){
		Effect.Queues.get('pe_menu').each(function(effect){ effect.cancel(); });
	}
});

document.observe('dom:loaded', function () { r = new Revealable(); });