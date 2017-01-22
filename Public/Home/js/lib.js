;(function(e){e.fn.sticky=function(t){function i(){return typeof r.zIndex=="number"?!0:!1}function o(){return 0<e(r.stopper).length||typeof r.stopper=="number"?!0:!1}var n={topSpacing:0,zIndex:"",stopper:".sticky-stopper"},r=e.extend({},n,t),s=i(),u=o();return this.each(function(){function h(){var r=c.scrollTop();if(u&&typeof l=="string")var h=e(l).offset().top,p=h-n-i;else if(u&&typeof l=="number")var p=l;if(a<r){t.after(f).css({position:"fixed",top:i}),s&&t.css({zIndex:o});if(u&&p<r){var d=p-r+i;t.css({top:d})}}else t.css({position:"relative",top:""}),f.remove()}var t=e(this),n=t.outerHeight(),i=r.topSpacing,o=r.zIndex,a=t.offset().top-i,f=t.clone().css("visibility","hidden").addClass("sticky-placeholder"),l=r.stopper,c=e(window);c.bind("scroll",h)})}})(jQuery)
!function(t,e,s,i,a){var o=t("<div>")[0],n=/url\(["']?(.*?)["']?\)/,r=[],h={top:0,left:0,bottom:1,right:1,center:.5};if(!("backgroundSize"in o.style)||t.debugBGS){t.cssHooks.backgroundSize={set:function(e,s){var i,a,o,n=!t.data(e,"bgsImg");t.data(e,"bgsValue",s),n?(r.push(e),t.refreshBackgroundDimensions(e,!0),a=t("<div>").css({position:"absolute",zIndex:-1,top:0,right:0,left:0,bottom:0,overflow:"hidden"}),o=t("<img>").css({position:"absolute"}).appendTo(a),a.prependTo(e),t.data(e,"bgsImg",o[0]),i=(t.css(e,"backgroundPosition")||t.css(e,"backgroundPositionX")+" "+t.css(e,"backgroundPositionY")).split(" "),t.data(e,"bgsPos",[h[i[0]]||parseFloat(i[0])/100,h[i[1]]||parseFloat(i[1])/100]),"auto"==t.css(e,"zIndex")&&(e.style.zIndex=0),"static"==t.css(e,"position")&&(e.style.position="relative"),t.refreshBackgroundImage(e)):t.refreshBackground(e)},get:function(e){return t.data(e,"bgsValue")||""}},t.cssHooks.backgroundImage={set:function(e,s){return t.data(e,"bgsImg")?t.refreshBackgroundImage(e,s):s}},t.refreshBackgroundDimensions=function(e,s){var i=t(e),a={width:i.innerWidth(),height:i.innerHeight()},o=t.data(e,"bgsDim"),n=!o||a.width!=o.width||a.height!=o.height;t.data(e,"bgsDim",a),n&&!s&&t.refreshBackground(e)},t.refreshBackgroundImage=function(e,s){var i=t.data(e,"bgsImg"),a=(n.exec(s||t.css(e,"backgroundImage"))||[])[1],o=i&&i.src,r=a!=o;r&&(i.style.height=i.style.width="auto",i.onload=function(){var s={width:i.width,height:i.height};(1!=s.width||1!=s.height)&&(t.data(e,"bgsImgDim",s),t.data(e,"bgsConstrain",!1),t.refreshBackground(e),i.style.visibility="visible",i.onload=null)},i.style.visibility="hidden",i.src=a,(i.readyState||i.complete)&&(i.src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==",i.src=a),e.style.backgroundImage="none")},t.refreshBackground=function(e){var s,a,o=t.data(e,"bgsValue"),n=t.data(e,"bgsDim"),r=t.data(e,"bgsImgDim"),h=t(t.data(e,"bgsImg")),d=t.data(e,"bgsPos"),g=t.data(e,"bgsConstrain"),c=n.width/n.height,u=r.width/r.height;"contain"==o?u>c?(t.data(e,"bgsConstrain",s="width"),a=i.floor((n.height-n.width/u)*d[1]),h.css({top:a}),s!=g&&h.css({width:"100%",height:"auto",left:0})):(t.data(e,"bgsConstrain",s="height"),a=i.floor((n.width-n.height*u)*d[0]),h.css({left:a}),s!=g&&h.css({height:"100%",width:"auto",top:0})):"cover"==o&&(u>c?(t.data(e,"bgsConstrain",s="height"),a=i.floor((n.height*u-n.width)*d[0]),h.css({left:-a}),s!=g&&h.css({height:"100%",width:"auto",top:0})):(t.data(e,"bgsConstrain",s="width"),a=i.floor((n.width/u-n.height)*d[1]),h.css({top:-a}),s!=g&&h.css({width:"100%",height:"auto",left:0})))};var d,g,c,u=t.event,l={_:0},f=0;d=u.special.throttledresize={setup:function(){t(this).on("resize",d.handler)},teardown:function(){t(this).off("resize",d.handler)},handler:function(e,s){var i=this,a=arguments;g=!0,c||(t(l).animate(l,{duration:1/0,step:function(){f++,(f>d.threshold&&g||s)&&(e.type="throttledresize",u.dispatch.apply(i,a),g=!1,f=0),f>9&&(t(l).stop(),c=!1,f=0)}}),c=!0)},threshold:1},t(e).on("throttledresize",function(){t(r).each(function(){t.refreshBackgroundDimensions(this)})})}}(jQuery,window,document,Math);
!function(t){t.fn.tabs=function(i){var n={active:0,tit:"li",curClass:"current",trigger:"click"},e=t.extend(n,i);return this.each(function(){function i(t){a.removeClass(e.curClass).eq(t).addClass(e.curClass),r.hide().eq(t).show()}var n=t(this),c=n.attr("tab-tit"),r=t("[tab-con="+c+"]"),a=n.find(e.tit);a.bind(e.trigger,function(t){i(a.index(this)),t.preventDefault()}).bind("click",function(t){t.preventDefault()}),i(e.active)})}}(jQuery);



/*
slick.js
Version: 1.5.9
Author: Ken Wheeler
Website: http://kenwheeler.github.io
 */
!function(a){"use strict";"function"==typeof define&&define.amd?define(["jquery"],a):"undefined"!=typeof exports?module.exports=a(require("jquery")):a(jQuery)}(function(a){"use strict";var b=window.Slick||{};b=function(){function c(c,d){var f,e=this;e.defaults={accessibility:!0,adaptiveHeight:!1,appendArrows:a(c),appendDots:a(c),arrows:!0,asNavFor:null,prevArrow:'<button type="button" data-role="none" class="slick-prev" aria-label="Previous" tabindex="0" role="button">Previous</button>',nextArrow:'<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button">Next</button>',autoplay:!1,autoplaySpeed:3e3,centerMode:!1,centerPadding:"50px",cssEase:"ease",customPaging:function(a,b){return'<button type="button" data-role="none" role="button" aria-required="false" tabindex="0">'+(b+1)+"</button>"},dots:!1,dotsClass:"slick-dots",draggable:!0,easing:"linear",edgeFriction:.35,fade:!1,focusOnSelect:!1,infinite:!0,initialSlide:0,lazyLoad:"ondemand",mobileFirst:!1,pauseOnHover:!0,pauseOnDotsHover:!1,respondTo:"window",responsive:null,rows:1,rtl:!1,slide:"",slidesPerRow:1,slidesToShow:1,slidesToScroll:1,speed:500,swipe:!0,swipeToSlide:!1,touchMove:!0,touchThreshold:5,useCSS:!0,useTransform:!1,variableWidth:!1,vertical:!1,verticalSwiping:!1,waitForAnimate:!0,zIndex:1e3},e.initials={animating:!1,dragging:!1,autoPlayTimer:null,currentDirection:0,currentLeft:null,currentSlide:0,direction:1,$dots:null,listWidth:null,listHeight:null,loadIndex:0,$nextArrow:null,$prevArrow:null,slideCount:null,slideWidth:null,$slideTrack:null,$slides:null,sliding:!1,slideOffset:0,swipeLeft:null,$list:null,touchObject:{},transformsEnabled:!1,unslicked:!1},a.extend(e,e.initials),e.activeBreakpoint=null,e.animType=null,e.animProp=null,e.breakpoints=[],e.breakpointSettings=[],e.cssTransitions=!1,e.hidden="hidden",e.paused=!1,e.positionProp=null,e.respondTo=null,e.rowCount=1,e.shouldClick=!0,e.$slider=a(c),e.$slidesCache=null,e.transformType=null,e.transitionType=null,e.visibilityChange="visibilitychange",e.windowWidth=0,e.windowTimer=null,f=a(c).data("slick")||{},e.options=a.extend({},e.defaults,f,d),e.currentSlide=e.options.initialSlide,e.originalSettings=e.options,"undefined"!=typeof document.mozHidden?(e.hidden="mozHidden",e.visibilityChange="mozvisibilitychange"):"undefined"!=typeof document.webkitHidden&&(e.hidden="webkitHidden",e.visibilityChange="webkitvisibilitychange"),e.autoPlay=a.proxy(e.autoPlay,e),e.autoPlayClear=a.proxy(e.autoPlayClear,e),e.changeSlide=a.proxy(e.changeSlide,e),e.clickHandler=a.proxy(e.clickHandler,e),e.selectHandler=a.proxy(e.selectHandler,e),e.setPosition=a.proxy(e.setPosition,e),e.swipeHandler=a.proxy(e.swipeHandler,e),e.dragHandler=a.proxy(e.dragHandler,e),e.keyHandler=a.proxy(e.keyHandler,e),e.autoPlayIterator=a.proxy(e.autoPlayIterator,e),e.instanceUid=b++,e.htmlExpr=/^(?:\s*(<[\w\W]+>)[^>]*)$/,e.registerBreakpoints(),e.init(!0),e.checkResponsive(!0)}var b=0;return c}(),b.prototype.addSlide=b.prototype.slickAdd=function(b,c,d){var e=this;if("boolean"==typeof c)d=c,c=null;else if(0>c||c>=e.slideCount)return!1;e.unload(),"number"==typeof c?0===c&&0===e.$slides.length?a(b).appendTo(e.$slideTrack):d?a(b).insertBefore(e.$slides.eq(c)):a(b).insertAfter(e.$slides.eq(c)):d===!0?a(b).prependTo(e.$slideTrack):a(b).appendTo(e.$slideTrack),e.$slides=e.$slideTrack.children(this.options.slide),e.$slideTrack.children(this.options.slide).detach(),e.$slideTrack.append(e.$slides),e.$slides.each(function(b,c){a(c).attr("data-slick-index",b)}),e.$slidesCache=e.$slides,e.reinit()},b.prototype.animateHeight=function(){var a=this;if(1===a.options.slidesToShow&&a.options.adaptiveHeight===!0&&a.options.vertical===!1){var b=a.$slides.eq(a.currentSlide).outerHeight(!0);a.$list.animate({height:b},a.options.speed)}},b.prototype.animateSlide=function(b,c){var d={},e=this;e.animateHeight(),e.options.rtl===!0&&e.options.vertical===!1&&(b=-b),e.transformsEnabled===!1?e.options.vertical===!1?e.$slideTrack.animate({left:b},e.options.speed,e.options.easing,c):e.$slideTrack.animate({top:b},e.options.speed,e.options.easing,c):e.cssTransitions===!1?(e.options.rtl===!0&&(e.currentLeft=-e.currentLeft),a({animStart:e.currentLeft}).animate({animStart:b},{duration:e.options.speed,easing:e.options.easing,step:function(a){a=Math.ceil(a),e.options.vertical===!1?(d[e.animType]="translate("+a+"px, 0px)",e.$slideTrack.css(d)):(d[e.animType]="translate(0px,"+a+"px)",e.$slideTrack.css(d))},complete:function(){c&&c.call()}})):(e.applyTransition(),b=Math.ceil(b),e.options.vertical===!1?d[e.animType]="translate3d("+b+"px, 0px, 0px)":d[e.animType]="translate3d(0px,"+b+"px, 0px)",e.$slideTrack.css(d),c&&setTimeout(function(){e.disableTransition(),c.call()},e.options.speed))},b.prototype.asNavFor=function(b){var c=this,d=c.options.asNavFor;d&&null!==d&&(d=a(d).not(c.$slider)),null!==d&&"object"==typeof d&&d.each(function(){var c=a(this).slick("getSlick");c.unslicked||c.slideHandler(b,!0)})},b.prototype.applyTransition=function(a){var b=this,c={};b.options.fade===!1?c[b.transitionType]=b.transformType+" "+b.options.speed+"ms "+b.options.cssEase:c[b.transitionType]="opacity "+b.options.speed+"ms "+b.options.cssEase,b.options.fade===!1?b.$slideTrack.css(c):b.$slides.eq(a).css(c)},b.prototype.autoPlay=function(){var a=this;a.autoPlayTimer&&clearInterval(a.autoPlayTimer),a.slideCount>a.options.slidesToShow&&a.paused!==!0&&(a.autoPlayTimer=setInterval(a.autoPlayIterator,a.options.autoplaySpeed))},b.prototype.autoPlayClear=function(){var a=this;a.autoPlayTimer&&clearInterval(a.autoPlayTimer)},b.prototype.autoPlayIterator=function(){var a=this;a.options.infinite===!1?1===a.direction?(a.currentSlide+1===a.slideCount-1&&(a.direction=0),a.slideHandler(a.currentSlide+a.options.slidesToScroll)):(a.currentSlide-1===0&&(a.direction=1),a.slideHandler(a.currentSlide-a.options.slidesToScroll)):a.slideHandler(a.currentSlide+a.options.slidesToScroll)},b.prototype.buildArrows=function(){var b=this;b.options.arrows===!0&&(b.$prevArrow=a(b.options.prevArrow).addClass("slick-arrow"),b.$nextArrow=a(b.options.nextArrow).addClass("slick-arrow"),b.slideCount>b.options.slidesToShow?(b.$prevArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"),b.$nextArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"),b.htmlExpr.test(b.options.prevArrow)&&b.$prevArrow.prependTo(b.options.appendArrows),b.htmlExpr.test(b.options.nextArrow)&&b.$nextArrow.appendTo(b.options.appendArrows),b.options.infinite!==!0&&b.$prevArrow.addClass("slick-disabled").attr("aria-disabled","true")):b.$prevArrow.add(b.$nextArrow).addClass("slick-hidden").attr({"aria-disabled":"true",tabindex:"-1"}))},b.prototype.buildDots=function(){var c,d,b=this;if(b.options.dots===!0&&b.slideCount>b.options.slidesToShow){for(d='<ul class="'+b.options.dotsClass+'">',c=0;c<=b.getDotCount();c+=1)d+="<li>"+b.options.customPaging.call(this,b,c)+"</li>";d+="</ul>",b.$dots=a(d).appendTo(b.options.appendDots),b.$dots.find("li").first().addClass("slick-active").attr("aria-hidden","false")}},b.prototype.buildOut=function(){var b=this;b.$slides=b.$slider.children(b.options.slide+":not(.slick-cloned)").addClass("slick-slide"),b.slideCount=b.$slides.length,b.$slides.each(function(b,c){a(c).attr("data-slick-index",b).data("originalStyling",a(c).attr("style")||"")}),b.$slider.addClass("slick-slider"),b.$slideTrack=0===b.slideCount?a('<div class="slick-track"/>').appendTo(b.$slider):b.$slides.wrapAll('<div class="slick-track"/>').parent(),b.$list=b.$slideTrack.wrap('<div aria-live="polite" class="slick-list"/>').parent(),b.$slideTrack.css("opacity",0),(b.options.centerMode===!0||b.options.swipeToSlide===!0)&&(b.options.slidesToScroll=1),a("img[data-lazy]",b.$slider).not("[src]").addClass("slick-loading"),b.setupInfinite(),b.buildArrows(),b.buildDots(),b.updateDots(),b.setSlideClasses("number"==typeof b.currentSlide?b.currentSlide:0),b.options.draggable===!0&&b.$list.addClass("draggable")},b.prototype.buildRows=function(){var b,c,d,e,f,g,h,a=this;if(e=document.createDocumentFragment(),g=a.$slider.children(),a.options.rows>1){for(h=a.options.slidesPerRow*a.options.rows,f=Math.ceil(g.length/h),b=0;f>b;b++){var i=document.createElement("div");for(c=0;c<a.options.rows;c++){var j=document.createElement("div");for(d=0;d<a.options.slidesPerRow;d++){var k=b*h+(c*a.options.slidesPerRow+d);g.get(k)&&j.appendChild(g.get(k))}i.appendChild(j)}e.appendChild(i)}a.$slider.html(e),a.$slider.children().children().children().css({width:100/a.options.slidesPerRow+"%",display:"inline-block"})}},b.prototype.checkResponsive=function(b,c){var e,f,g,d=this,h=!1,i=d.$slider.width(),j=window.innerWidth||a(window).width();if("window"===d.respondTo?g=j:"slider"===d.respondTo?g=i:"min"===d.respondTo&&(g=Math.min(j,i)),d.options.responsive&&d.options.responsive.length&&null!==d.options.responsive){f=null;for(e in d.breakpoints)d.breakpoints.hasOwnProperty(e)&&(d.originalSettings.mobileFirst===!1?g<d.breakpoints[e]&&(f=d.breakpoints[e]):g>d.breakpoints[e]&&(f=d.breakpoints[e]));null!==f?null!==d.activeBreakpoint?(f!==d.activeBreakpoint||c)&&(d.activeBreakpoint=f,"unslick"===d.breakpointSettings[f]?d.unslick(f):(d.options=a.extend({},d.originalSettings,d.breakpointSettings[f]),b===!0&&(d.currentSlide=d.options.initialSlide),d.refresh(b)),h=f):(d.activeBreakpoint=f,"unslick"===d.breakpointSettings[f]?d.unslick(f):(d.options=a.extend({},d.originalSettings,d.breakpointSettings[f]),b===!0&&(d.currentSlide=d.options.initialSlide),d.refresh(b)),h=f):null!==d.activeBreakpoint&&(d.activeBreakpoint=null,d.options=d.originalSettings,b===!0&&(d.currentSlide=d.options.initialSlide),d.refresh(b),h=f),b||h===!1||d.$slider.trigger("breakpoint",[d,h])}},b.prototype.changeSlide=function(b,c){var f,g,h,d=this,e=a(b.target);switch(e.is("a")&&b.preventDefault(),e.is("li")||(e=e.closest("li")),h=d.slideCount%d.options.slidesToScroll!==0,f=h?0:(d.slideCount-d.currentSlide)%d.options.slidesToScroll,b.data.message){case"previous":g=0===f?d.options.slidesToScroll:d.options.slidesToShow-f,d.slideCount>d.options.slidesToShow&&d.slideHandler(d.currentSlide-g,!1,c);break;case"next":g=0===f?d.options.slidesToScroll:f,d.slideCount>d.options.slidesToShow&&d.slideHandler(d.currentSlide+g,!1,c);break;case"index":var i=0===b.data.index?0:b.data.index||e.index()*d.options.slidesToScroll;d.slideHandler(d.checkNavigable(i),!1,c),e.children().trigger("focus");break;default:return}},b.prototype.checkNavigable=function(a){var c,d,b=this;if(c=b.getNavigableIndexes(),d=0,a>c[c.length-1])a=c[c.length-1];else for(var e in c){if(a<c[e]){a=d;break}d=c[e]}return a},b.prototype.cleanUpEvents=function(){var b=this;b.options.dots&&null!==b.$dots&&(a("li",b.$dots).off("click.slick",b.changeSlide),b.options.pauseOnDotsHover===!0&&b.options.autoplay===!0&&a("li",b.$dots).off("mouseenter.slick",a.proxy(b.setPaused,b,!0)).off("mouseleave.slick",a.proxy(b.setPaused,b,!1))),b.options.arrows===!0&&b.slideCount>b.options.slidesToShow&&(b.$prevArrow&&b.$prevArrow.off("click.slick",b.changeSlide),b.$nextArrow&&b.$nextArrow.off("click.slick",b.changeSlide)),b.$list.off("touchstart.slick mousedown.slick",b.swipeHandler),b.$list.off("touchmove.slick mousemove.slick",b.swipeHandler),b.$list.off("touchend.slick mouseup.slick",b.swipeHandler),b.$list.off("touchcancel.slick mouseleave.slick",b.swipeHandler),b.$list.off("click.slick",b.clickHandler),a(document).off(b.visibilityChange,b.visibility),b.$list.off("mouseenter.slick",a.proxy(b.setPaused,b,!0)),b.$list.off("mouseleave.slick",a.proxy(b.setPaused,b,!1)),b.options.accessibility===!0&&b.$list.off("keydown.slick",b.keyHandler),b.options.focusOnSelect===!0&&a(b.$slideTrack).children().off("click.slick",b.selectHandler),a(window).off("orientationchange.slick.slick-"+b.instanceUid,b.orientationChange),a(window).off("resize.slick.slick-"+b.instanceUid,b.resize),a("[draggable!=true]",b.$slideTrack).off("dragstart",b.preventDefault),a(window).off("load.slick.slick-"+b.instanceUid,b.setPosition),a(document).off("ready.slick.slick-"+b.instanceUid,b.setPosition)},b.prototype.cleanUpRows=function(){var b,a=this;a.options.rows>1&&(b=a.$slides.children().children(),b.removeAttr("style"),a.$slider.html(b))},b.prototype.clickHandler=function(a){var b=this;b.shouldClick===!1&&(a.stopImmediatePropagation(),a.stopPropagation(),a.preventDefault())},b.prototype.destroy=function(b){var c=this;c.autoPlayClear(),c.touchObject={},c.cleanUpEvents(),a(".slick-cloned",c.$slider).detach(),c.$dots&&c.$dots.remove(),c.$prevArrow&&c.$prevArrow.length&&(c.$prevArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display",""),c.htmlExpr.test(c.options.prevArrow)&&c.$prevArrow.remove()),c.$nextArrow&&c.$nextArrow.length&&(c.$nextArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display",""),c.htmlExpr.test(c.options.nextArrow)&&c.$nextArrow.remove()),c.$slides&&(c.$slides.removeClass("slick-slide slick-active slick-center slick-visible slick-current").removeAttr("aria-hidden").removeAttr("data-slick-index").each(function(){a(this).attr("style",a(this).data("originalStyling"))}),c.$slideTrack.children(this.options.slide).detach(),c.$slideTrack.detach(),c.$list.detach(),c.$slider.append(c.$slides)),c.cleanUpRows(),c.$slider.removeClass("slick-slider"),c.$slider.removeClass("slick-initialized"),c.unslicked=!0,b||c.$slider.trigger("destroy",[c])},b.prototype.disableTransition=function(a){var b=this,c={};c[b.transitionType]="",b.options.fade===!1?b.$slideTrack.css(c):b.$slides.eq(a).css(c)},b.prototype.fadeSlide=function(a,b){var c=this;c.cssTransitions===!1?(c.$slides.eq(a).css({zIndex:c.options.zIndex}),c.$slides.eq(a).animate({opacity:1},c.options.speed,c.options.easing,b)):(c.applyTransition(a),c.$slides.eq(a).css({opacity:1,zIndex:c.options.zIndex}),b&&setTimeout(function(){c.disableTransition(a),b.call()},c.options.speed))},b.prototype.fadeSlideOut=function(a){var b=this;b.cssTransitions===!1?b.$slides.eq(a).animate({opacity:0,zIndex:b.options.zIndex-2},b.options.speed,b.options.easing):(b.applyTransition(a),b.$slides.eq(a).css({opacity:0,zIndex:b.options.zIndex-2}))},b.prototype.filterSlides=b.prototype.slickFilter=function(a){var b=this;null!==a&&(b.$slidesCache=b.$slides,b.unload(),b.$slideTrack.children(this.options.slide).detach(),b.$slidesCache.filter(a).appendTo(b.$slideTrack),b.reinit())},b.prototype.getCurrent=b.prototype.slickCurrentSlide=function(){var a=this;return a.currentSlide},b.prototype.getDotCount=function(){var a=this,b=0,c=0,d=0;if(a.options.infinite===!0)for(;b<a.slideCount;)++d,b=c+a.options.slidesToScroll,c+=a.options.slidesToScroll<=a.options.slidesToShow?a.options.slidesToScroll:a.options.slidesToShow;else if(a.options.centerMode===!0)d=a.slideCount;else for(;b<a.slideCount;)++d,b=c+a.options.slidesToScroll,c+=a.options.slidesToScroll<=a.options.slidesToShow?a.options.slidesToScroll:a.options.slidesToShow;return d-1},b.prototype.getLeft=function(a){var c,d,f,b=this,e=0;return b.slideOffset=0,d=b.$slides.first().outerHeight(!0),b.options.infinite===!0?(b.slideCount>b.options.slidesToShow&&(b.slideOffset=b.slideWidth*b.options.slidesToShow*-1,e=d*b.options.slidesToShow*-1),b.slideCount%b.options.slidesToScroll!==0&&a+b.options.slidesToScroll>b.slideCount&&b.slideCount>b.options.slidesToShow&&(a>b.slideCount?(b.slideOffset=(b.options.slidesToShow-(a-b.slideCount))*b.slideWidth*-1,e=(b.options.slidesToShow-(a-b.slideCount))*d*-1):(b.slideOffset=b.slideCount%b.options.slidesToScroll*b.slideWidth*-1,e=b.slideCount%b.options.slidesToScroll*d*-1))):a+b.options.slidesToShow>b.slideCount&&(b.slideOffset=(a+b.options.slidesToShow-b.slideCount)*b.slideWidth,e=(a+b.options.slidesToShow-b.slideCount)*d),b.slideCount<=b.options.slidesToShow&&(b.slideOffset=0,e=0),b.options.centerMode===!0&&b.options.infinite===!0?b.slideOffset+=b.slideWidth*Math.floor(b.options.slidesToShow/2)-b.slideWidth:b.options.centerMode===!0&&(b.slideOffset=0,b.slideOffset+=b.slideWidth*Math.floor(b.options.slidesToShow/2)),c=b.options.vertical===!1?a*b.slideWidth*-1+b.slideOffset:a*d*-1+e,b.options.variableWidth===!0&&(f=b.slideCount<=b.options.slidesToShow||b.options.infinite===!1?b.$slideTrack.children(".slick-slide").eq(a):b.$slideTrack.children(".slick-slide").eq(a+b.options.slidesToShow),c=b.options.rtl===!0?f[0]?-1*(b.$slideTrack.width()-f[0].offsetLeft-f.width()):0:f[0]?-1*f[0].offsetLeft:0,b.options.centerMode===!0&&(f=b.slideCount<=b.options.slidesToShow||b.options.infinite===!1?b.$slideTrack.children(".slick-slide").eq(a):b.$slideTrack.children(".slick-slide").eq(a+b.options.slidesToShow+1),c=b.options.rtl===!0?f[0]?-1*(b.$slideTrack.width()-f[0].offsetLeft-f.width()):0:f[0]?-1*f[0].offsetLeft:0,c+=(b.$list.width()-f.outerWidth())/2)),c},b.prototype.getOption=b.prototype.slickGetOption=function(a){var b=this;return b.options[a]},b.prototype.getNavigableIndexes=function(){var e,a=this,b=0,c=0,d=[];for(a.options.infinite===!1?e=a.slideCount:(b=-1*a.options.slidesToScroll,c=-1*a.options.slidesToScroll,e=2*a.slideCount);e>b;)d.push(b),b=c+a.options.slidesToScroll,c+=a.options.slidesToScroll<=a.options.slidesToShow?a.options.slidesToScroll:a.options.slidesToShow;return d},b.prototype.getSlick=function(){return this},b.prototype.getSlideCount=function(){var c,d,e,b=this;return e=b.options.centerMode===!0?b.slideWidth*Math.floor(b.options.slidesToShow/2):0,b.options.swipeToSlide===!0?(b.$slideTrack.find(".slick-slide").each(function(c,f){return f.offsetLeft-e+a(f).outerWidth()/2>-1*b.swipeLeft?(d=f,!1):void 0}),c=Math.abs(a(d).attr("data-slick-index")-b.currentSlide)||1):b.options.slidesToScroll},b.prototype.goTo=b.prototype.slickGoTo=function(a,b){var c=this;c.changeSlide({data:{message:"index",index:parseInt(a)}},b)},b.prototype.init=function(b){var c=this;a(c.$slider).hasClass("slick-initialized")||(a(c.$slider).addClass("slick-initialized"),c.buildRows(),c.buildOut(),c.setProps(),c.startLoad(),c.loadSlider(),c.initializeEvents(),c.updateArrows(),c.updateDots()),b&&c.$slider.trigger("init",[c]),c.options.accessibility===!0&&c.initADA()},b.prototype.initArrowEvents=function(){var a=this;a.options.arrows===!0&&a.slideCount>a.options.slidesToShow&&(a.$prevArrow.on("click.slick",{message:"previous"},a.changeSlide),a.$nextArrow.on("click.slick",{message:"next"},a.changeSlide))},b.prototype.initDotEvents=function(){var b=this;b.options.dots===!0&&b.slideCount>b.options.slidesToShow&&a("li",b.$dots).on("click.slick",{message:"index"},b.changeSlide),b.options.dots===!0&&b.options.pauseOnDotsHover===!0&&b.options.autoplay===!0&&a("li",b.$dots).on("mouseenter.slick",a.proxy(b.setPaused,b,!0)).on("mouseleave.slick",a.proxy(b.setPaused,b,!1))},b.prototype.initializeEvents=function(){var b=this;b.initArrowEvents(),b.initDotEvents(),b.$list.on("touchstart.slick mousedown.slick",{action:"start"},b.swipeHandler),b.$list.on("touchmove.slick mousemove.slick",{action:"move"},b.swipeHandler),b.$list.on("touchend.slick mouseup.slick",{action:"end"},b.swipeHandler),b.$list.on("touchcancel.slick mouseleave.slick",{action:"end"},b.swipeHandler),b.$list.on("click.slick",b.clickHandler),a(document).on(b.visibilityChange,a.proxy(b.visibility,b)),b.$list.on("mouseenter.slick",a.proxy(b.setPaused,b,!0)),b.$list.on("mouseleave.slick",a.proxy(b.setPaused,b,!1)),b.options.accessibility===!0&&b.$list.on("keydown.slick",b.keyHandler),b.options.focusOnSelect===!0&&a(b.$slideTrack).children().on("click.slick",b.selectHandler),a(window).on("orientationchange.slick.slick-"+b.instanceUid,a.proxy(b.orientationChange,b)),a(window).on("resize.slick.slick-"+b.instanceUid,a.proxy(b.resize,b)),a("[draggable!=true]",b.$slideTrack).on("dragstart",b.preventDefault),a(window).on("load.slick.slick-"+b.instanceUid,b.setPosition),a(document).on("ready.slick.slick-"+b.instanceUid,b.setPosition)},b.prototype.initUI=function(){var a=this;a.options.arrows===!0&&a.slideCount>a.options.slidesToShow&&(a.$prevArrow.show(),a.$nextArrow.show()),a.options.dots===!0&&a.slideCount>a.options.slidesToShow&&a.$dots.show(),a.options.autoplay===!0&&a.autoPlay()},b.prototype.keyHandler=function(a){var b=this;a.target.tagName.match("TEXTAREA|INPUT|SELECT")||(37===a.keyCode&&b.options.accessibility===!0?b.changeSlide({data:{message:"previous"}}):39===a.keyCode&&b.options.accessibility===!0&&b.changeSlide({data:{message:"next"}}))},b.prototype.lazyLoad=function(){function g(b){a("img[data-lazy]",b).each(function(){var b=a(this),c=a(this).attr("data-lazy"),d=document.createElement("img");d.onload=function(){b.animate({opacity:0},100,function(){b.attr("src",c).animate({opacity:1},200,function(){b.removeAttr("data-lazy").removeClass("slick-loading")})})},d.src=c})}var c,d,e,f,b=this;b.options.centerMode===!0?b.options.infinite===!0?(e=b.currentSlide+(b.options.slidesToShow/2+1),f=e+b.options.slidesToShow+2):(e=Math.max(0,b.currentSlide-(b.options.slidesToShow/2+1)),f=2+(b.options.slidesToShow/2+1)+b.currentSlide):(e=b.options.infinite?b.options.slidesToShow+b.currentSlide:b.currentSlide,f=e+b.options.slidesToShow,b.options.fade===!0&&(e>0&&e--,f<=b.slideCount&&f++)),c=b.$slider.find(".slick-slide").slice(e,f),g(c),b.slideCount<=b.options.slidesToShow?(d=b.$slider.find(".slick-slide"),g(d)):b.currentSlide>=b.slideCount-b.options.slidesToShow?(d=b.$slider.find(".slick-cloned").slice(0,b.options.slidesToShow),g(d)):0===b.currentSlide&&(d=b.$slider.find(".slick-cloned").slice(-1*b.options.slidesToShow),g(d))},b.prototype.loadSlider=function(){var a=this;a.setPosition(),a.$slideTrack.css({opacity:1}),a.$slider.removeClass("slick-loading"),a.initUI(),"progressive"===a.options.lazyLoad&&a.progressiveLazyLoad()},b.prototype.next=b.prototype.slickNext=function(){var a=this;a.changeSlide({data:{message:"next"}})},b.prototype.orientationChange=function(){var a=this;a.checkResponsive(),a.setPosition()},b.prototype.pause=b.prototype.slickPause=function(){var a=this;a.autoPlayClear(),a.paused=!0},b.prototype.play=b.prototype.slickPlay=function(){var a=this;a.paused=!1,a.autoPlay()},b.prototype.postSlide=function(a){var b=this;b.$slider.trigger("afterChange",[b,a]),b.animating=!1,b.setPosition(),b.swipeLeft=null,b.options.autoplay===!0&&b.paused===!1&&b.autoPlay(),b.options.accessibility===!0&&b.initADA()},b.prototype.prev=b.prototype.slickPrev=function(){var a=this;a.changeSlide({data:{message:"previous"}})},b.prototype.preventDefault=function(a){a.preventDefault()},b.prototype.progressiveLazyLoad=function(){var c,d,b=this;c=a("img[data-lazy]",b.$slider).length,c>0&&(d=a("img[data-lazy]",b.$slider).first(),d.attr("src",null),d.attr("src",d.attr("data-lazy")).removeClass("slick-loading").load(function(){d.removeAttr("data-lazy"),b.progressiveLazyLoad(),b.options.adaptiveHeight===!0&&b.setPosition()}).error(function(){d.removeAttr("data-lazy"),b.progressiveLazyLoad()}))},b.prototype.refresh=function(b){var d,e,c=this;e=c.slideCount-c.options.slidesToShow,c.options.infinite||(c.slideCount<=c.options.slidesToShow?c.currentSlide=0:c.currentSlide>e&&(c.currentSlide=e)),d=c.currentSlide,c.destroy(!0),a.extend(c,c.initials,{currentSlide:d}),c.init(),b||c.changeSlide({data:{message:"index",index:d}},!1)},b.prototype.registerBreakpoints=function(){var c,d,e,b=this,f=b.options.responsive||null;if("array"===a.type(f)&&f.length){b.respondTo=b.options.respondTo||"window";for(c in f)if(e=b.breakpoints.length-1,d=f[c].breakpoint,f.hasOwnProperty(c)){for(;e>=0;)b.breakpoints[e]&&b.breakpoints[e]===d&&b.breakpoints.splice(e,1),e--;b.breakpoints.push(d),b.breakpointSettings[d]=f[c].settings}b.breakpoints.sort(function(a,c){return b.options.mobileFirst?a-c:c-a})}},b.prototype.reinit=function(){var b=this;b.$slides=b.$slideTrack.children(b.options.slide).addClass("slick-slide"),b.slideCount=b.$slides.length,b.currentSlide>=b.slideCount&&0!==b.currentSlide&&(b.currentSlide=b.currentSlide-b.options.slidesToScroll),b.slideCount<=b.options.slidesToShow&&(b.currentSlide=0),b.registerBreakpoints(),b.setProps(),b.setupInfinite(),b.buildArrows(),b.updateArrows(),b.initArrowEvents(),b.buildDots(),b.updateDots(),b.initDotEvents(),b.checkResponsive(!1,!0),b.options.focusOnSelect===!0&&a(b.$slideTrack).children().on("click.slick",b.selectHandler),b.setSlideClasses(0),b.setPosition(),b.$slider.trigger("reInit",[b]),b.options.autoplay===!0&&b.focusHandler()},b.prototype.resize=function(){var b=this;a(window).width()!==b.windowWidth&&(clearTimeout(b.windowDelay),b.windowDelay=window.setTimeout(function(){b.windowWidth=a(window).width(),b.checkResponsive(),b.unslicked||b.setPosition()},50))},b.prototype.removeSlide=b.prototype.slickRemove=function(a,b,c){var d=this;return"boolean"==typeof a?(b=a,a=b===!0?0:d.slideCount-1):a=b===!0?--a:a,d.slideCount<1||0>a||a>d.slideCount-1?!1:(d.unload(),c===!0?d.$slideTrack.children().remove():d.$slideTrack.children(this.options.slide).eq(a).remove(),d.$slides=d.$slideTrack.children(this.options.slide),d.$slideTrack.children(this.options.slide).detach(),d.$slideTrack.append(d.$slides),d.$slidesCache=d.$slides,void d.reinit())},b.prototype.setCSS=function(a){var d,e,b=this,c={};b.options.rtl===!0&&(a=-a),d="left"==b.positionProp?Math.ceil(a)+"px":"0px",e="top"==b.positionProp?Math.ceil(a)+"px":"0px",c[b.positionProp]=a,b.transformsEnabled===!1?b.$slideTrack.css(c):(c={},b.cssTransitions===!1?(c[b.animType]="translate("+d+", "+e+")",b.$slideTrack.css(c)):(c[b.animType]="translate3d("+d+", "+e+", 0px)",b.$slideTrack.css(c)))},b.prototype.setDimensions=function(){var a=this;a.options.vertical===!1?a.options.centerMode===!0&&a.$list.css({padding:"0px "+a.options.centerPadding}):(a.$list.height(a.$slides.first().outerHeight(!0)*a.options.slidesToShow),a.options.centerMode===!0&&a.$list.css({padding:a.options.centerPadding+" 0px"})),a.listWidth=a.$list.width(),a.listHeight=a.$list.height(),a.options.vertical===!1&&a.options.variableWidth===!1?(a.slideWidth=Math.ceil(a.listWidth/a.options.slidesToShow),a.$slideTrack.width(Math.ceil(a.slideWidth*a.$slideTrack.children(".slick-slide").length))):a.options.variableWidth===!0?a.$slideTrack.width(5e3*a.slideCount):(a.slideWidth=Math.ceil(a.listWidth),a.$slideTrack.height(Math.ceil(a.$slides.first().outerHeight(!0)*a.$slideTrack.children(".slick-slide").length)));var b=a.$slides.first().outerWidth(!0)-a.$slides.first().width();a.options.variableWidth===!1&&a.$slideTrack.children(".slick-slide").width(a.slideWidth-b)},b.prototype.setFade=function(){var c,b=this;b.$slides.each(function(d,e){c=b.slideWidth*d*-1,b.options.rtl===!0?a(e).css({position:"relative",right:c,top:0,zIndex:b.options.zIndex-2,opacity:0}):a(e).css({position:"relative",left:c,top:0,zIndex:b.options.zIndex-2,opacity:0})}),b.$slides.eq(b.currentSlide).css({zIndex:b.options.zIndex-1,opacity:1})},b.prototype.setHeight=function(){var a=this;if(1===a.options.slidesToShow&&a.options.adaptiveHeight===!0&&a.options.vertical===!1){var b=a.$slides.eq(a.currentSlide).outerHeight(!0);a.$list.css("height",b)}},b.prototype.setOption=b.prototype.slickSetOption=function(b,c,d){var f,g,e=this;if("responsive"===b&&"array"===a.type(c))for(g in c)if("array"!==a.type(e.options.responsive))e.options.responsive=[c[g]];else{for(f=e.options.responsive.length-1;f>=0;)e.options.responsive[f].breakpoint===c[g].breakpoint&&e.options.responsive.splice(f,1),f--;e.options.responsive.push(c[g])}else e.options[b]=c;d===!0&&(e.unload(),e.reinit())},b.prototype.setPosition=function(){var a=this;a.setDimensions(),a.setHeight(),a.options.fade===!1?a.setCSS(a.getLeft(a.currentSlide)):a.setFade(),a.$slider.trigger("setPosition",[a])},b.prototype.setProps=function(){var a=this,b=document.body.style;a.positionProp=a.options.vertical===!0?"top":"left","top"===a.positionProp?a.$slider.addClass("slick-vertical"):a.$slider.removeClass("slick-vertical"),(void 0!==b.WebkitTransition||void 0!==b.MozTransition||void 0!==b.msTransition)&&a.options.useCSS===!0&&(a.cssTransitions=!0),a.options.fade&&("number"==typeof a.options.zIndex?a.options.zIndex<3&&(a.options.zIndex=3):a.options.zIndex=a.defaults.zIndex),void 0!==b.OTransform&&(a.animType="OTransform",a.transformType="-o-transform",a.transitionType="OTransition",void 0===b.perspectiveProperty&&void 0===b.webkitPerspective&&(a.animType=!1)),void 0!==b.MozTransform&&(a.animType="MozTransform",a.transformType="-moz-transform",a.transitionType="MozTransition",void 0===b.perspectiveProperty&&void 0===b.MozPerspective&&(a.animType=!1)),void 0!==b.webkitTransform&&(a.animType="webkitTransform",a.transformType="-webkit-transform",a.transitionType="webkitTransition",void 0===b.perspectiveProperty&&void 0===b.webkitPerspective&&(a.animType=!1)),void 0!==b.msTransform&&(a.animType="msTransform",a.transformType="-ms-transform",a.transitionType="msTransition",void 0===b.msTransform&&(a.animType=!1)),void 0!==b.transform&&a.animType!==!1&&(a.animType="transform",a.transformType="transform",a.transitionType="transition"),a.transformsEnabled=a.options.useTransform&&null!==a.animType&&a.animType!==!1},b.prototype.setSlideClasses=function(a){var c,d,e,f,b=this;d=b.$slider.find(".slick-slide").removeClass("slick-active slick-center slick-current").attr("aria-hidden","true"),b.$slides.eq(a).addClass("slick-current"),b.options.centerMode===!0?(c=Math.floor(b.options.slidesToShow/2),b.options.infinite===!0&&(a>=c&&a<=b.slideCount-1-c?b.$slides.slice(a-c,a+c+1).addClass("slick-active").attr("aria-hidden","false"):(e=b.options.slidesToShow+a,d.slice(e-c+1,e+c+2).addClass("slick-active").attr("aria-hidden","false")),0===a?d.eq(d.length-1-b.options.slidesToShow).addClass("slick-center"):a===b.slideCount-1&&d.eq(b.options.slidesToShow).addClass("slick-center")),b.$slides.eq(a).addClass("slick-center")):a>=0&&a<=b.slideCount-b.options.slidesToShow?b.$slides.slice(a,a+b.options.slidesToShow).addClass("slick-active").attr("aria-hidden","false"):d.length<=b.options.slidesToShow?d.addClass("slick-active").attr("aria-hidden","false"):(f=b.slideCount%b.options.slidesToShow,e=b.options.infinite===!0?b.options.slidesToShow+a:a,b.options.slidesToShow==b.options.slidesToScroll&&b.slideCount-a<b.options.slidesToShow?d.slice(e-(b.options.slidesToShow-f),e+f).addClass("slick-active").attr("aria-hidden","false"):d.slice(e,e+b.options.slidesToShow).addClass("slick-active").attr("aria-hidden","false")),"ondemand"===b.options.lazyLoad&&b.lazyLoad()},b.prototype.setupInfinite=function(){var c,d,e,b=this;if(b.options.fade===!0&&(b.options.centerMode=!1),b.options.infinite===!0&&b.options.fade===!1&&(d=null,b.slideCount>b.options.slidesToShow)){for(e=b.options.centerMode===!0?b.options.slidesToShow+1:b.options.slidesToShow,c=b.slideCount;c>b.slideCount-e;c-=1)d=c-1,a(b.$slides[d]).clone(!0).attr("id","").attr("data-slick-index",d-b.slideCount).prependTo(b.$slideTrack).addClass("slick-cloned");for(c=0;e>c;c+=1)d=c,a(b.$slides[d]).clone(!0).attr("id","").attr("data-slick-index",d+b.slideCount).appendTo(b.$slideTrack).addClass("slick-cloned");b.$slideTrack.find(".slick-cloned").find("[id]").each(function(){a(this).attr("id","")})}},b.prototype.setPaused=function(a){var b=this;b.options.autoplay===!0&&b.options.pauseOnHover===!0&&(b.paused=a,a?b.autoPlayClear():b.autoPlay())},b.prototype.selectHandler=function(b){var c=this,d=a(b.target).is(".slick-slide")?a(b.target):a(b.target).parents(".slick-slide"),e=parseInt(d.attr("data-slick-index"));return e||(e=0),c.slideCount<=c.options.slidesToShow?(c.setSlideClasses(e),void c.asNavFor(e)):void c.slideHandler(e)},b.prototype.slideHandler=function(a,b,c){var d,e,f,g,h=null,i=this;return b=b||!1,i.animating===!0&&i.options.waitForAnimate===!0||i.options.fade===!0&&i.currentSlide===a||i.slideCount<=i.options.slidesToShow?void 0:(b===!1&&i.asNavFor(a),d=a,h=i.getLeft(d),g=i.getLeft(i.currentSlide),i.currentLeft=null===i.swipeLeft?g:i.swipeLeft,i.options.infinite===!1&&i.options.centerMode===!1&&(0>a||a>i.getDotCount()*i.options.slidesToScroll)?void(i.options.fade===!1&&(d=i.currentSlide,c!==!0?i.animateSlide(g,function(){i.postSlide(d);
}):i.postSlide(d))):i.options.infinite===!1&&i.options.centerMode===!0&&(0>a||a>i.slideCount-i.options.slidesToScroll)?void(i.options.fade===!1&&(d=i.currentSlide,c!==!0?i.animateSlide(g,function(){i.postSlide(d)}):i.postSlide(d))):(i.options.autoplay===!0&&clearInterval(i.autoPlayTimer),e=0>d?i.slideCount%i.options.slidesToScroll!==0?i.slideCount-i.slideCount%i.options.slidesToScroll:i.slideCount+d:d>=i.slideCount?i.slideCount%i.options.slidesToScroll!==0?0:d-i.slideCount:d,i.animating=!0,i.$slider.trigger("beforeChange",[i,i.currentSlide,e]),f=i.currentSlide,i.currentSlide=e,i.setSlideClasses(i.currentSlide),i.updateDots(),i.updateArrows(),i.options.fade===!0?(c!==!0?(i.fadeSlideOut(f),i.fadeSlide(e,function(){i.postSlide(e)})):i.postSlide(e),void i.animateHeight()):void(c!==!0?i.animateSlide(h,function(){i.postSlide(e)}):i.postSlide(e))))},b.prototype.startLoad=function(){var a=this;a.options.arrows===!0&&a.slideCount>a.options.slidesToShow&&(a.$prevArrow.hide(),a.$nextArrow.hide()),a.options.dots===!0&&a.slideCount>a.options.slidesToShow&&a.$dots.hide(),a.$slider.addClass("slick-loading")},b.prototype.swipeDirection=function(){var a,b,c,d,e=this;return a=e.touchObject.startX-e.touchObject.curX,b=e.touchObject.startY-e.touchObject.curY,c=Math.atan2(b,a),d=Math.round(180*c/Math.PI),0>d&&(d=360-Math.abs(d)),45>=d&&d>=0?e.options.rtl===!1?"left":"right":360>=d&&d>=315?e.options.rtl===!1?"left":"right":d>=135&&225>=d?e.options.rtl===!1?"right":"left":e.options.verticalSwiping===!0?d>=35&&135>=d?"left":"right":"vertical"},b.prototype.swipeEnd=function(a){var c,b=this;if(b.dragging=!1,b.shouldClick=b.touchObject.swipeLength>10?!1:!0,void 0===b.touchObject.curX)return!1;if(b.touchObject.edgeHit===!0&&b.$slider.trigger("edge",[b,b.swipeDirection()]),b.touchObject.swipeLength>=b.touchObject.minSwipe)switch(b.swipeDirection()){case"left":c=b.options.swipeToSlide?b.checkNavigable(b.currentSlide+b.getSlideCount()):b.currentSlide+b.getSlideCount(),b.slideHandler(c),b.currentDirection=0,b.touchObject={},b.$slider.trigger("swipe",[b,"left"]);break;case"right":c=b.options.swipeToSlide?b.checkNavigable(b.currentSlide-b.getSlideCount()):b.currentSlide-b.getSlideCount(),b.slideHandler(c),b.currentDirection=1,b.touchObject={},b.$slider.trigger("swipe",[b,"right"])}else b.touchObject.startX!==b.touchObject.curX&&(b.slideHandler(b.currentSlide),b.touchObject={})},b.prototype.swipeHandler=function(a){var b=this;if(!(b.options.swipe===!1||"ontouchend"in document&&b.options.swipe===!1||b.options.draggable===!1&&-1!==a.type.indexOf("mouse")))switch(b.touchObject.fingerCount=a.originalEvent&&void 0!==a.originalEvent.touches?a.originalEvent.touches.length:1,b.touchObject.minSwipe=b.listWidth/b.options.touchThreshold,b.options.verticalSwiping===!0&&(b.touchObject.minSwipe=b.listHeight/b.options.touchThreshold),a.data.action){case"start":b.swipeStart(a);break;case"move":b.swipeMove(a);break;case"end":b.swipeEnd(a)}},b.prototype.swipeMove=function(a){var d,e,f,g,h,b=this;return h=void 0!==a.originalEvent?a.originalEvent.touches:null,!b.dragging||h&&1!==h.length?!1:(d=b.getLeft(b.currentSlide),b.touchObject.curX=void 0!==h?h[0].pageX:a.clientX,b.touchObject.curY=void 0!==h?h[0].pageY:a.clientY,b.touchObject.swipeLength=Math.round(Math.sqrt(Math.pow(b.touchObject.curX-b.touchObject.startX,2))),b.options.verticalSwiping===!0&&(b.touchObject.swipeLength=Math.round(Math.sqrt(Math.pow(b.touchObject.curY-b.touchObject.startY,2)))),e=b.swipeDirection(),"vertical"!==e?(void 0!==a.originalEvent&&b.touchObject.swipeLength>4&&a.preventDefault(),g=(b.options.rtl===!1?1:-1)*(b.touchObject.curX>b.touchObject.startX?1:-1),b.options.verticalSwiping===!0&&(g=b.touchObject.curY>b.touchObject.startY?1:-1),f=b.touchObject.swipeLength,b.touchObject.edgeHit=!1,b.options.infinite===!1&&(0===b.currentSlide&&"right"===e||b.currentSlide>=b.getDotCount()&&"left"===e)&&(f=b.touchObject.swipeLength*b.options.edgeFriction,b.touchObject.edgeHit=!0),b.options.vertical===!1?b.swipeLeft=d+f*g:b.swipeLeft=d+f*(b.$list.height()/b.listWidth)*g,b.options.verticalSwiping===!0&&(b.swipeLeft=d+f*g),b.options.fade===!0||b.options.touchMove===!1?!1:b.animating===!0?(b.swipeLeft=null,!1):void b.setCSS(b.swipeLeft)):void 0)},b.prototype.swipeStart=function(a){var c,b=this;return 1!==b.touchObject.fingerCount||b.slideCount<=b.options.slidesToShow?(b.touchObject={},!1):(void 0!==a.originalEvent&&void 0!==a.originalEvent.touches&&(c=a.originalEvent.touches[0]),b.touchObject.startX=b.touchObject.curX=void 0!==c?c.pageX:a.clientX,b.touchObject.startY=b.touchObject.curY=void 0!==c?c.pageY:a.clientY,void(b.dragging=!0))},b.prototype.unfilterSlides=b.prototype.slickUnfilter=function(){var a=this;null!==a.$slidesCache&&(a.unload(),a.$slideTrack.children(this.options.slide).detach(),a.$slidesCache.appendTo(a.$slideTrack),a.reinit())},b.prototype.unload=function(){var b=this;a(".slick-cloned",b.$slider).remove(),b.$dots&&b.$dots.remove(),b.$prevArrow&&b.htmlExpr.test(b.options.prevArrow)&&b.$prevArrow.remove(),b.$nextArrow&&b.htmlExpr.test(b.options.nextArrow)&&b.$nextArrow.remove(),b.$slides.removeClass("slick-slide slick-active slick-visible slick-current").attr("aria-hidden","true").css("width","")},b.prototype.unslick=function(a){var b=this;b.$slider.trigger("unslick",[b,a]),b.destroy()},b.prototype.updateArrows=function(){var b,a=this;b=Math.floor(a.options.slidesToShow/2),a.options.arrows===!0&&a.slideCount>a.options.slidesToShow&&!a.options.infinite&&(a.$prevArrow.removeClass("slick-disabled").attr("aria-disabled","false"),a.$nextArrow.removeClass("slick-disabled").attr("aria-disabled","false"),0===a.currentSlide?(a.$prevArrow.addClass("slick-disabled").attr("aria-disabled","true"),a.$nextArrow.removeClass("slick-disabled").attr("aria-disabled","false")):a.currentSlide>=a.slideCount-a.options.slidesToShow&&a.options.centerMode===!1?(a.$nextArrow.addClass("slick-disabled").attr("aria-disabled","true"),a.$prevArrow.removeClass("slick-disabled").attr("aria-disabled","false")):a.currentSlide>=a.slideCount-1&&a.options.centerMode===!0&&(a.$nextArrow.addClass("slick-disabled").attr("aria-disabled","true"),a.$prevArrow.removeClass("slick-disabled").attr("aria-disabled","false")))},b.prototype.updateDots=function(){var a=this;null!==a.$dots&&(a.$dots.find("li").removeClass("slick-active").attr("aria-hidden","true"),a.$dots.find("li").eq(Math.floor(a.currentSlide/a.options.slidesToScroll)).addClass("slick-active").attr("aria-hidden","false"))},b.prototype.visibility=function(){var a=this;document[a.hidden]?(a.paused=!0,a.autoPlayClear()):a.options.autoplay===!0&&(a.paused=!1,a.autoPlay())},b.prototype.initADA=function(){var b=this;b.$slides.add(b.$slideTrack.find(".slick-cloned")).attr({"aria-hidden":"true",tabindex:"-1"}).find("a, input, button, select").attr({tabindex:"-1"}),b.$slideTrack.attr("role","listbox"),b.$slides.not(b.$slideTrack.find(".slick-cloned")).each(function(c){a(this).attr({role:"option","aria-describedby":"slick-slide"+b.instanceUid+c})}),null!==b.$dots&&b.$dots.attr("role","tablist").find("li").each(function(c){a(this).attr({role:"presentation","aria-selected":"false","aria-controls":"navigation"+b.instanceUid+c,id:"slick-slide"+b.instanceUid+c})}).first().attr("aria-selected","true").end().find("button").attr("role","button").end().closest("div").attr("role","toolbar"),b.activateADA()},b.prototype.activateADA=function(){var a=this;a.$slideTrack.find(".slick-active").attr({"aria-hidden":"false"}).find("a, input, button, select").attr({tabindex:"0"})},b.prototype.focusHandler=function(){var b=this;b.$slider.on("focus.slick blur.slick","*",function(c){c.stopImmediatePropagation();var d=a(this);setTimeout(function(){b.isPlay&&(d.is(":focus")?(b.autoPlayClear(),b.paused=!0):(b.paused=!1,b.autoPlay()))},0)})},a.fn.slick=function(){var f,g,a=this,c=arguments[0],d=Array.prototype.slice.call(arguments,1),e=a.length;for(f=0;e>f;f++)if("object"==typeof c||"undefined"==typeof c?a[f].slick=new b(a[f],c):g=a[f].slick[c].apply(a[f].slick,d),"undefined"!=typeof g)return g;return a}});

/*
 * jQuery FlexSlider v2.6.2
 * Copyright 2012 WooThemes
 * Contributing Author: Tyler Smith
 */!function($){var e=!0;$.flexslider=function(t,a){var n=$(t);n.vars=$.extend({},$.flexslider.defaults,a);var i=n.vars.namespace,s=window.navigator&&window.navigator.msPointerEnabled&&window.MSGesture,r=("ontouchstart"in window||s||window.DocumentTouch&&document instanceof DocumentTouch)&&n.vars.touch,o="click touchend MSPointerUp keyup",l="",c,d="vertical"===n.vars.direction,u=n.vars.reverse,v=n.vars.itemWidth>0,p="fade"===n.vars.animation,m=""!==n.vars.asNavFor,f={};$.data(t,"flexslider",n),f={init:function(){n.animating=!1,n.currentSlide=parseInt(n.vars.startAt?n.vars.startAt:0,10),isNaN(n.currentSlide)&&(n.currentSlide=0),n.animatingTo=n.currentSlide,n.atEnd=0===n.currentSlide||n.currentSlide===n.last,n.containerSelector=n.vars.selector.substr(0,n.vars.selector.search(" ")),n.slides=$(n.vars.selector,n),n.container=$(n.containerSelector,n),n.count=n.slides.length,n.syncExists=$(n.vars.sync).length>0,"slide"===n.vars.animation&&(n.vars.animation="swing"),n.prop=d?"top":"marginLeft",n.args={},n.manualPause=!1,n.stopped=!1,n.started=!1,n.startTimeout=null,n.transitions=!n.vars.video&&!p&&n.vars.useCSS&&function(){var e=document.createElement("div"),t=["perspectiveProperty","WebkitPerspective","MozPerspective","OPerspective","msPerspective"];for(var a in t)if(void 0!==e.style[t[a]])return n.pfx=t[a].replace("Perspective","").toLowerCase(),n.prop="-"+n.pfx+"-transform",!0;return!1}(),n.ensureAnimationEnd="",""!==n.vars.controlsContainer&&(n.controlsContainer=$(n.vars.controlsContainer).length>0&&$(n.vars.controlsContainer)),""!==n.vars.manualControls&&(n.manualControls=$(n.vars.manualControls).length>0&&$(n.vars.manualControls)),""!==n.vars.customDirectionNav&&(n.customDirectionNav=2===$(n.vars.customDirectionNav).length&&$(n.vars.customDirectionNav)),n.vars.randomize&&(n.slides.sort(function(){return Math.round(Math.random())-.5}),n.container.empty().append(n.slides)),n.doMath(),n.setup("init"),n.vars.controlNav&&f.controlNav.setup(),n.vars.directionNav&&f.directionNav.setup(),n.vars.keyboard&&(1===$(n.containerSelector).length||n.vars.multipleKeyboard)&&$(document).bind("keyup",function(e){var t=e.keyCode;if(!n.animating&&(39===t||37===t)){var a=39===t?n.getTarget("next"):37===t?n.getTarget("prev"):!1;n.flexAnimate(a,n.vars.pauseOnAction)}}),n.vars.mousewheel&&n.bind("mousewheel",function(e,t,a,i){e.preventDefault();var s=0>t?n.getTarget("next"):n.getTarget("prev");n.flexAnimate(s,n.vars.pauseOnAction)}),n.vars.pausePlay&&f.pausePlay.setup(),n.vars.slideshow&&n.vars.pauseInvisible&&f.pauseInvisible.init(),n.vars.slideshow&&(n.vars.pauseOnHover&&n.hover(function(){n.manualPlay||n.manualPause||n.pause()},function(){n.manualPause||n.manualPlay||n.stopped||n.play()}),n.vars.pauseInvisible&&f.pauseInvisible.isHidden()||(n.vars.initDelay>0?n.startTimeout=setTimeout(n.play,n.vars.initDelay):n.play())),m&&f.asNav.setup(),r&&n.vars.touch&&f.touch(),(!p||p&&n.vars.smoothHeight)&&$(window).bind("resize orientationchange focus",f.resize),n.find("img").attr("draggable","false"),setTimeout(function(){n.vars.start(n)},200)},asNav:{setup:function(){n.asNav=!0,n.animatingTo=Math.floor(n.currentSlide/n.move),n.currentItem=n.currentSlide,n.slides.removeClass(i+"active-slide").eq(n.currentItem).addClass(i+"active-slide"),s?(t._slider=n,n.slides.each(function(){var e=this;e._gesture=new MSGesture,e._gesture.target=e,e.addEventListener("MSPointerDown",function(e){e.preventDefault(),e.currentTarget._gesture&&e.currentTarget._gesture.addPointer(e.pointerId)},!1),e.addEventListener("MSGestureTap",function(e){e.preventDefault();var t=$(this),a=t.index();$(n.vars.asNavFor).data("flexslider").animating||t.hasClass("active")||(n.direction=n.currentItem<a?"next":"prev",n.flexAnimate(a,n.vars.pauseOnAction,!1,!0,!0))})})):n.slides.on(o,function(e){e.preventDefault();var t=$(this),a=t.index(),s=t.offset().left-$(n).scrollLeft();0>=s&&t.hasClass(i+"active-slide")?n.flexAnimate(n.getTarget("prev"),!0):$(n.vars.asNavFor).data("flexslider").animating||t.hasClass(i+"active-slide")||(n.direction=n.currentItem<a?"next":"prev",n.flexAnimate(a,n.vars.pauseOnAction,!1,!0,!0))})}},controlNav:{setup:function(){n.manualControls?f.controlNav.setupManual():f.controlNav.setupPaging()},setupPaging:function(){var e="thumbnails"===n.vars.controlNav?"control-thumbs":"control-paging",t=1,a,s;if(n.controlNavScaffold=$('<ol class="'+i+"control-nav "+i+e+'"></ol>'),n.pagingCount>1)for(var r=0;r<n.pagingCount;r++){s=n.slides.eq(r),void 0===s.attr("data-thumb-alt")&&s.attr("data-thumb-alt","");var c=""!==s.attr("data-thumb-alt")?c=' alt="'+s.attr("data-thumb-alt")+'"':"";if(a="thumbnails"===n.vars.controlNav?'<img src="'+s.attr("data-thumb")+'"'+c+"/>":'<a href="#">'+t+"</a>","thumbnails"===n.vars.controlNav&&!0===n.vars.thumbCaptions){var d=s.attr("data-thumbcaption");""!==d&&void 0!==d&&(a+='<span class="'+i+'caption">'+d+"</span>")}n.controlNavScaffold.append("<li>"+a+"</li>"),t++}n.controlsContainer?$(n.controlsContainer).append(n.controlNavScaffold):n.append(n.controlNavScaffold),f.controlNav.set(),f.controlNav.active(),n.controlNavScaffold.delegate("a, img",o,function(e){if(e.preventDefault(),""===l||l===e.type){var t=$(this),a=n.controlNav.index(t);t.hasClass(i+"active")||(n.direction=a>n.currentSlide?"next":"prev",n.flexAnimate(a,n.vars.pauseOnAction))}""===l&&(l=e.type),f.setToClearWatchedEvent()})},setupManual:function(){n.controlNav=n.manualControls,f.controlNav.active(),n.controlNav.bind(o,function(e){if(e.preventDefault(),""===l||l===e.type){var t=$(this),a=n.controlNav.index(t);t.hasClass(i+"active")||(a>n.currentSlide?n.direction="next":n.direction="prev",n.flexAnimate(a,n.vars.pauseOnAction))}""===l&&(l=e.type),f.setToClearWatchedEvent()})},set:function(){var e="thumbnails"===n.vars.controlNav?"img":"a";n.controlNav=$("."+i+"control-nav li "+e,n.controlsContainer?n.controlsContainer:n)},active:function(){n.controlNav.removeClass(i+"active").eq(n.animatingTo).addClass(i+"active")},update:function(e,t){n.pagingCount>1&&"add"===e?n.controlNavScaffold.append($('<li><a href="#">'+n.count+"</a></li>")):1===n.pagingCount?n.controlNavScaffold.find("li").remove():n.controlNav.eq(t).closest("li").remove(),f.controlNav.set(),n.pagingCount>1&&n.pagingCount!==n.controlNav.length?n.update(t,e):f.controlNav.active()}},directionNav:{setup:function(){var e=$('<ul class="'+i+'direction-nav"><li class="'+i+'nav-prev"><a class="'+i+'prev" href="#">'+n.vars.prevText+'</a></li><li class="'+i+'nav-next"><a class="'+i+'next" href="#">'+n.vars.nextText+"</a></li></ul>");n.customDirectionNav?n.directionNav=n.customDirectionNav:n.controlsContainer?($(n.controlsContainer).append(e),n.directionNav=$("."+i+"direction-nav li a",n.controlsContainer)):(n.append(e),n.directionNav=$("."+i+"direction-nav li a",n)),f.directionNav.update(),n.directionNav.bind(o,function(e){e.preventDefault();var t;""!==l&&l!==e.type||(t=$(this).hasClass(i+"next")?n.getTarget("next"):n.getTarget("prev"),n.flexAnimate(t,n.vars.pauseOnAction)),""===l&&(l=e.type),f.setToClearWatchedEvent()})},update:function(){var e=i+"disabled";1===n.pagingCount?n.directionNav.addClass(e).attr("tabindex","-1"):n.vars.animationLoop?n.directionNav.removeClass(e).removeAttr("tabindex"):0===n.animatingTo?n.directionNav.removeClass(e).filter("."+i+"prev").addClass(e).attr("tabindex","-1"):n.animatingTo===n.last?n.directionNav.removeClass(e).filter("."+i+"next").addClass(e).attr("tabindex","-1"):n.directionNav.removeClass(e).removeAttr("tabindex")}},pausePlay:{setup:function(){var e=$('<div class="'+i+'pauseplay"><a href="#"></a></div>');n.controlsContainer?(n.controlsContainer.append(e),n.pausePlay=$("."+i+"pauseplay a",n.controlsContainer)):(n.append(e),n.pausePlay=$("."+i+"pauseplay a",n)),f.pausePlay.update(n.vars.slideshow?i+"pause":i+"play"),n.pausePlay.bind(o,function(e){e.preventDefault(),""!==l&&l!==e.type||($(this).hasClass(i+"pause")?(n.manualPause=!0,n.manualPlay=!1,n.pause()):(n.manualPause=!1,n.manualPlay=!0,n.play())),""===l&&(l=e.type),f.setToClearWatchedEvent()})},update:function(e){"play"===e?n.pausePlay.removeClass(i+"pause").addClass(i+"play").html(n.vars.playText):n.pausePlay.removeClass(i+"play").addClass(i+"pause").html(n.vars.pauseText)}},touch:function(){function e(e){e.stopPropagation(),n.animating?e.preventDefault():(n.pause(),t._gesture.addPointer(e.pointerId),w=0,c=d?n.h:n.w,f=Number(new Date),l=v&&u&&n.animatingTo===n.last?0:v&&u?n.limit-(n.itemW+n.vars.itemMargin)*n.move*n.animatingTo:v&&n.currentSlide===n.last?n.limit:v?(n.itemW+n.vars.itemMargin)*n.move*n.currentSlide:u?(n.last-n.currentSlide+n.cloneOffset)*c:(n.currentSlide+n.cloneOffset)*c)}function a(e){e.stopPropagation();var a=e.target._slider;if(a){var n=-e.translationX,i=-e.translationY;return w+=d?i:n,m=w,y=d?Math.abs(w)<Math.abs(-n):Math.abs(w)<Math.abs(-i),e.detail===e.MSGESTURE_FLAG_INERTIA?void setImmediate(function(){t._gesture.stop()}):void((!y||Number(new Date)-f>500)&&(e.preventDefault(),!p&&a.transitions&&(a.vars.animationLoop||(m=w/(0===a.currentSlide&&0>w||a.currentSlide===a.last&&w>0?Math.abs(w)/c+2:1)),a.setProps(l+m,"setTouch"))))}}function i(e){e.stopPropagation();var t=e.target._slider;if(t){if(t.animatingTo===t.currentSlide&&!y&&null!==m){var a=u?-m:m,n=a>0?t.getTarget("next"):t.getTarget("prev");t.canAdvance(n)&&(Number(new Date)-f<550&&Math.abs(a)>50||Math.abs(a)>c/2)?t.flexAnimate(n,t.vars.pauseOnAction):p||t.flexAnimate(t.currentSlide,t.vars.pauseOnAction,!0)}r=null,o=null,m=null,l=null,w=0}}var r,o,l,c,m,f,g,h,S,y=!1,b=0,x=0,w=0;s?(t.style.msTouchAction="none",t._gesture=new MSGesture,t._gesture.target=t,t.addEventListener("MSPointerDown",e,!1),t._slider=n,t.addEventListener("MSGestureChange",a,!1),t.addEventListener("MSGestureEnd",i,!1)):(g=function(e){n.animating?e.preventDefault():(window.navigator.msPointerEnabled||1===e.touches.length)&&(n.pause(),c=d?n.h:n.w,f=Number(new Date),b=e.touches[0].pageX,x=e.touches[0].pageY,l=v&&u&&n.animatingTo===n.last?0:v&&u?n.limit-(n.itemW+n.vars.itemMargin)*n.move*n.animatingTo:v&&n.currentSlide===n.last?n.limit:v?(n.itemW+n.vars.itemMargin)*n.move*n.currentSlide:u?(n.last-n.currentSlide+n.cloneOffset)*c:(n.currentSlide+n.cloneOffset)*c,r=d?x:b,o=d?b:x,t.addEventListener("touchmove",h,!1),t.addEventListener("touchend",S,!1))},h=function(e){b=e.touches[0].pageX,x=e.touches[0].pageY,m=d?r-x:r-b,y=d?Math.abs(m)<Math.abs(b-o):Math.abs(m)<Math.abs(x-o);var t=500;(!y||Number(new Date)-f>t)&&(e.preventDefault(),!p&&n.transitions&&(n.vars.animationLoop||(m/=0===n.currentSlide&&0>m||n.currentSlide===n.last&&m>0?Math.abs(m)/c+2:1),n.setProps(l+m,"setTouch")))},S=function(e){if(t.removeEventListener("touchmove",h,!1),n.animatingTo===n.currentSlide&&!y&&null!==m){var a=u?-m:m,i=a>0?n.getTarget("next"):n.getTarget("prev");n.canAdvance(i)&&(Number(new Date)-f<550&&Math.abs(a)>50||Math.abs(a)>c/2)?n.flexAnimate(i,n.vars.pauseOnAction):p||n.flexAnimate(n.currentSlide,n.vars.pauseOnAction,!0)}t.removeEventListener("touchend",S,!1),r=null,o=null,m=null,l=null},t.addEventListener("touchstart",g,!1))},resize:function(){!n.animating&&n.is(":visible")&&(v||n.doMath(),p?f.smoothHeight():v?(n.slides.width(n.computedW),n.update(n.pagingCount),n.setProps()):d?(n.viewport.height(n.h),n.setProps(n.h,"setTotal")):(n.vars.smoothHeight&&f.smoothHeight(),n.newSlides.width(n.computedW),n.setProps(n.computedW,"setTotal")))},smoothHeight:function(e){if(!d||p){var t=p?n:n.viewport;e?t.animate({height:n.slides.eq(n.animatingTo).innerHeight()},e).css("overflow","visible"):t.innerHeight(n.slides.eq(n.animatingTo).innerHeight())}},sync:function(e){var t=$(n.vars.sync).data("flexslider"),a=n.animatingTo;switch(e){case"animate":t.flexAnimate(a,n.vars.pauseOnAction,!1,!0);break;case"play":t.playing||t.asNav||t.play();break;case"pause":t.pause()}},uniqueID:function(e){return e.filter("[id]").add(e.find("[id]")).each(function(){var e=$(this);e.attr("id",e.attr("id")+"_clone")}),e},pauseInvisible:{visProp:null,init:function(){var e=f.pauseInvisible.getHiddenProp();if(e){var t=e.replace(/[H|h]idden/,"")+"visibilitychange";document.addEventListener(t,function(){f.pauseInvisible.isHidden()?n.startTimeout?clearTimeout(n.startTimeout):n.pause():n.started?n.play():n.vars.initDelay>0?setTimeout(n.play,n.vars.initDelay):n.play()})}},isHidden:function(){var e=f.pauseInvisible.getHiddenProp();return e?document[e]:!1},getHiddenProp:function(){var e=["webkit","moz","ms","o"];if("hidden"in document)return"hidden";for(var t=0;t<e.length;t++)if(e[t]+"Hidden"in document)return e[t]+"Hidden";return null}},setToClearWatchedEvent:function(){clearTimeout(c),c=setTimeout(function(){l=""},3e3)}},n.flexAnimate=function(e,t,a,s,o){if(n.vars.animationLoop||e===n.currentSlide||(n.direction=e>n.currentSlide?"next":"prev"),m&&1===n.pagingCount&&(n.direction=n.currentItem<e?"next":"prev"),!n.animating&&(n.canAdvance(e,o)||a)&&n.is(":visible")){if(m&&s){var l=$(n.vars.asNavFor).data("flexslider");if(n.atEnd=0===e||e===n.count-1,l.flexAnimate(e,!0,!1,!0,o),n.direction=n.currentItem<e?"next":"prev",l.direction=n.direction,Math.ceil((e+1)/n.visible)-1===n.currentSlide||0===e)return n.currentItem=e,n.slides.removeClass(i+"active-slide").eq(e).addClass(i+"active-slide"),!1;n.currentItem=e,n.slides.removeClass(i+"active-slide").eq(e).addClass(i+"active-slide"),e=Math.floor(e/n.visible)}if(n.animating=!0,n.animatingTo=e,t&&n.pause(),n.vars.before(n),n.syncExists&&!o&&f.sync("animate"),n.vars.controlNav&&f.controlNav.active(),v||n.slides.removeClass(i+"active-slide").eq(e).addClass(i+"active-slide"),n.atEnd=0===e||e===n.last,n.vars.directionNav&&f.directionNav.update(),e===n.last&&(n.vars.end(n),n.vars.animationLoop||n.pause()),p)r?(n.slides.eq(n.currentSlide).css({opacity:0,zIndex:1,display:"none"}),n.slides.eq(e).css({opacity:1,zIndex:2,display:"block"}),n.wrapup(c)):(n.slides.eq(n.currentSlide).css({zIndex:1,display:"none"}).animate({opacity:0},n.vars.animationSpeed,n.vars.easing),n.slides.eq(e).css({zIndex:2,display:"block"}).animate({opacity:1},n.vars.animationSpeed,n.vars.easing,n.wrapup));else{var c=d?n.slides.filter(":first").height():n.computedW,g,h,S;v?(g=n.vars.itemMargin,S=(n.itemW+g)*n.move*n.animatingTo,h=S>n.limit&&1!==n.visible?n.limit:S):h=0===n.currentSlide&&e===n.count-1&&n.vars.animationLoop&&"next"!==n.direction?u?(n.count+n.cloneOffset)*c:0:n.currentSlide===n.last&&0===e&&n.vars.animationLoop&&"prev"!==n.direction?u?0:(n.count+1)*c:u?(n.count-1-e+n.cloneOffset)*c:(e+n.cloneOffset)*c,n.setProps(h,"",n.vars.animationSpeed),n.transitions?(n.vars.animationLoop&&n.atEnd||(n.animating=!1,n.currentSlide=n.animatingTo),n.container.unbind("webkitTransitionEnd transitionend"),n.container.bind("webkitTransitionEnd transitionend",function(){clearTimeout(n.ensureAnimationEnd),n.wrapup(c)}),clearTimeout(n.ensureAnimationEnd),n.ensureAnimationEnd=setTimeout(function(){n.wrapup(c)},n.vars.animationSpeed+100)):n.container.animate(n.args,n.vars.animationSpeed,n.vars.easing,function(){n.wrapup(c)})}n.vars.smoothHeight&&f.smoothHeight(n.vars.animationSpeed)}},n.wrapup=function(e){p||v||(0===n.currentSlide&&n.animatingTo===n.last&&n.vars.animationLoop?n.setProps(e,"jumpEnd"):n.currentSlide===n.last&&0===n.animatingTo&&n.vars.animationLoop&&n.setProps(e,"jumpStart")),n.animating=!1,n.currentSlide=n.animatingTo,n.vars.after(n)},n.animateSlides=function(){!n.animating&&e&&n.flexAnimate(n.getTarget("next"))},n.pause=function(){clearInterval(n.animatedSlides),n.animatedSlides=null,n.playing=!1,n.vars.pausePlay&&f.pausePlay.update("play"),n.syncExists&&f.sync("pause")},n.play=function(){n.playing&&clearInterval(n.animatedSlides),n.animatedSlides=n.animatedSlides||setInterval(n.animateSlides,n.vars.slideshowSpeed),n.started=n.playing=!0,n.vars.pausePlay&&f.pausePlay.update("pause"),n.syncExists&&f.sync("play")},n.stop=function(){n.pause(),n.stopped=!0},n.canAdvance=function(e,t){var a=m?n.pagingCount-1:n.last;return t?!0:m&&n.currentItem===n.count-1&&0===e&&"prev"===n.direction?!0:m&&0===n.currentItem&&e===n.pagingCount-1&&"next"!==n.direction?!1:e!==n.currentSlide||m?n.vars.animationLoop?!0:n.atEnd&&0===n.currentSlide&&e===a&&"next"!==n.direction?!1:!n.atEnd||n.currentSlide!==a||0!==e||"next"!==n.direction:!1},n.getTarget=function(e){return n.direction=e,"next"===e?n.currentSlide===n.last?0:n.currentSlide+1:0===n.currentSlide?n.last:n.currentSlide-1},n.setProps=function(e,t,a){var i=function(){var a=e?e:(n.itemW+n.vars.itemMargin)*n.move*n.animatingTo,i=function(){if(v)return"setTouch"===t?e:u&&n.animatingTo===n.last?0:u?n.limit-(n.itemW+n.vars.itemMargin)*n.move*n.animatingTo:n.animatingTo===n.last?n.limit:a;switch(t){case"setTotal":return u?(n.count-1-n.currentSlide+n.cloneOffset)*e:(n.currentSlide+n.cloneOffset)*e;case"setTouch":return u?e:e;case"jumpEnd":return u?e:n.count*e;case"jumpStart":return u?n.count*e:e;default:return e}}();return-1*i+"px"}();n.transitions&&(i=d?"translate3d(0,"+i+",0)":"translate3d("+i+",0,0)",a=void 0!==a?a/1e3+"s":"0s",n.container.css("-"+n.pfx+"-transition-duration",a),n.container.css("transition-duration",a)),n.args[n.prop]=i,(n.transitions||void 0===a)&&n.container.css(n.args),n.container.css("transform",i)},n.setup=function(e){if(p)n.slides.css({width:"100%","float":"left",marginRight:"-100%",position:"relative"}),"init"===e&&(r?n.slides.css({opacity:0,display:"none",webkitTransition:"opacity "+n.vars.animationSpeed/1e3+"s ease",zIndex:1}).eq(n.currentSlide).css({opacity:1,zIndex:2,display:"block"}):0==n.vars.fadeFirstSlide?n.slides.css({opacity:0,display:"none",zIndex:1}).eq(n.currentSlide).css({zIndex:2,display:"block"}).css({opacity:1}):n.slides.css({opacity:0,display:"none",zIndex:1}).eq(n.currentSlide).css({zIndex:2,display:"block"}).animate({opacity:1},n.vars.animationSpeed,n.vars.easing)),n.vars.smoothHeight&&f.smoothHeight();else{var t,a;"init"===e&&(n.viewport=$('<div class="'+i+'viewport"></div>').css({overflow:"hidden",position:"relative"}).appendTo(n).append(n.container),n.cloneCount=0,n.cloneOffset=0,u&&(a=$.makeArray(n.slides).reverse(),n.slides=$(a),n.container.empty().append(n.slides))),n.vars.animationLoop&&!v&&(n.cloneCount=2,n.cloneOffset=1,"init"!==e&&n.container.find(".clone").remove(),n.container.append(f.uniqueID(n.slides.first().clone().addClass("clone")).attr("aria-hidden","true")).prepend(f.uniqueID(n.slides.last().clone().addClass("clone")).attr("aria-hidden","true"))),n.newSlides=$(n.vars.selector,n),t=u?n.count-1-n.currentSlide+n.cloneOffset:n.currentSlide+n.cloneOffset,d&&!v?(n.container.height(200*(n.count+n.cloneCount)+"%").css("position","absolute").width("100%"),setTimeout(function(){n.newSlides.css({display:"block"}),n.doMath(),n.viewport.height(n.h),n.setProps(t*n.h,"init")},"init"===e?100:0)):(n.container.width(200*(n.count+n.cloneCount)+"%"),n.setProps(t*n.computedW,"init"),setTimeout(function(){n.doMath(),n.newSlides.css({width:n.computedW,marginRight:n.computedM,"float":"left",display:"block"}),n.vars.smoothHeight&&f.smoothHeight()},"init"===e?100:0))}v||n.slides.removeClass(i+"active-slide").eq(n.currentSlide).addClass(i+"active-slide"),n.vars.init(n)},n.doMath=function(){var e=n.slides.first(),t=n.vars.itemMargin,a=n.vars.minItems,i=n.vars.maxItems;n.w=void 0===n.viewport?n.width():n.viewport.width(),n.h=e.height(),n.boxPadding=e.outerWidth()-e.width(),v?(n.itemT=n.vars.itemWidth+t,n.itemM=t,n.minW=a?a*n.itemT:n.w,n.maxW=i?i*n.itemT-t:n.w,n.itemW=n.minW>n.w?(n.w-t*(a-1))/a:n.maxW<n.w?(n.w-t*(i-1))/i:n.vars.itemWidth>n.w?n.w:n.vars.itemWidth,n.visible=Math.floor(n.w/n.itemW),n.move=n.vars.move>0&&n.vars.move<n.visible?n.vars.move:n.visible,n.pagingCount=Math.ceil((n.count-n.visible)/n.move+1),n.last=n.pagingCount-1,n.limit=1===n.pagingCount?0:n.vars.itemWidth>n.w?n.itemW*(n.count-1)+t*(n.count-1):(n.itemW+t)*n.count-n.w-t):(n.itemW=n.w,n.itemM=t,n.pagingCount=n.count,n.last=n.count-1),n.computedW=n.itemW-n.boxPadding,n.computedM=n.itemM},n.update=function(e,t){n.doMath(),v||(e<n.currentSlide?n.currentSlide+=1:e<=n.currentSlide&&0!==e&&(n.currentSlide-=1),n.animatingTo=n.currentSlide),n.vars.controlNav&&!n.manualControls&&("add"===t&&!v||n.pagingCount>n.controlNav.length?f.controlNav.update("add"):("remove"===t&&!v||n.pagingCount<n.controlNav.length)&&(v&&n.currentSlide>n.last&&(n.currentSlide-=1,n.animatingTo-=1),f.controlNav.update("remove",n.last))),n.vars.directionNav&&f.directionNav.update()},n.addSlide=function(e,t){var a=$(e);n.count+=1,n.last=n.count-1,d&&u?void 0!==t?n.slides.eq(n.count-t).after(a):n.container.prepend(a):void 0!==t?n.slides.eq(t).before(a):n.container.append(a),n.update(t,"add"),n.slides=$(n.vars.selector+":not(.clone)",n),n.setup(),n.vars.added(n)},n.removeSlide=function(e){var t=isNaN(e)?n.slides.index($(e)):e;n.count-=1,n.last=n.count-1,isNaN(e)?$(e,n.slides).remove():d&&u?n.slides.eq(n.last).remove():n.slides.eq(e).remove(),n.doMath(),n.update(t,"remove"),n.slides=$(n.vars.selector+":not(.clone)",n),n.setup(),n.vars.removed(n)},f.init()},$(window).blur(function(t){e=!1}).focus(function(t){e=!0}),$.flexslider.defaults={namespace:"flex-",selector:".slides > li",animation:"fade",easing:"swing",direction:"horizontal",reverse:!1,animationLoop:!0,smoothHeight:!1,startAt:0,slideshow:!0,slideshowSpeed:7e3,animationSpeed:600,initDelay:0,randomize:!1,fadeFirstSlide:!0,thumbCaptions:!1,pauseOnAction:!0,pauseOnHover:!1,pauseInvisible:!0,useCSS:!0,touch:!0,video:!1,controlNav:!0,directionNav:!0,prevText:"Previous",nextText:"Next",keyboard:!0,multipleKeyboard:!1,mousewheel:!1,pausePlay:!1,pauseText:"Pause",playText:"Play",controlsContainer:"",manualControls:"",customDirectionNav:"",sync:"",asNavFor:"",itemWidth:0,itemMargin:0,minItems:1,maxItems:0,move:0,allowOneSlide:!0,start:function(){},before:function(){},after:function(){},end:function(){},added:function(){},removed:function(){},init:function(){}},$.fn.flexslider=function(e){if(void 0===e&&(e={}),"object"==typeof e)return this.each(function(){var t=$(this),a=e.selector?e.selector:".slides > li",n=t.find(a);1===n.length&&e.allowOneSlide===!1||0===n.length?(n.fadeIn(400),e.start&&e.start(t)):void 0===t.data("flexslider")&&new $.flexslider(this,e)});var t=$(this).data("flexslider");switch(e){case"play":t.play();break;case"pause":t.pause();break;case"stop":t.stop();break;case"next":t.flexAnimate(t.getTarget("next"),!0);break;case"prev":case"previous":t.flexAnimate(t.getTarget("prev"),!0);break;default:"number"==typeof e&&t.flexAnimate(e,!0)}}}(jQuery);

/*!
 * Datepicker v0.3.1
 * https://github.com/fengyuanchen/datepicker
 *
 * Copyright (c) 2014-2016 Fengyuan Chen
 * Released under the MIT license
 *
 * Date: 2016-01-11T04:07:25.661Z
 */
!function(t){"function"==typeof define&&define.amd?define("datepicker",["jquery"],t):t("object"==typeof exports?require("jquery"):jQuery)}(function(t){"use strict";function e(t){return j.call(t).slice(8,-1).toLowerCase()}function i(t){return"string"==typeof t}function s(t){return"number"==typeof t&&!isNaN(t)}function a(t){return"undefined"==typeof t}function n(t){return"date"===e(t)}function r(t,e){var i=[];return Array.from?Array.from(t).slice(e||0):(s(e)&&i.push(e),i.slice.apply(t,i))}function h(t,e){var i=r(arguments,2);return function(){return t.apply(e,i.concat(r(arguments)))}}function o(t){return t%4===0&&t%100!==0||t%400===0}function l(t,e){return[31,o(t)?29:28,31,30,31,30,31,31,30,31,30,31][e]}function d(t){var e,i,s=String(t).toLowerCase(),a=s.match(x);if(!a||0===a.length)throw new Error("Invalid date format.");for(t={source:s,parts:a},e=a.length,i=0;e>i;i++)switch(a[i]){case"dd":case"d":t.hasDay=!0;break;case"mm":case"m":t.hasMonth=!0;break;case"yyyy":case"yy":t.hasYear=!0}return t}function u(e,i){i=t.isPlainObject(i)?i:{},i.language&&(i=t.extend({},u.LANGUAGES[i.language],i)),this.$element=t(e),this.options=t.extend({},u.DEFAULTS,i),this.isBuilt=!1,this.isShown=!1,this.isInput=!1,this.isInline=!1,this.initialValue="",this.initialDate=null,this.startDate=null,this.endDate=null,this.init()}var c=t(window),f=window.document,p=t(f),w=window.Number,m="datepicker",y="click."+m,g="keyup."+m,v="focus."+m,D="resize."+m,k="show."+m,b="hide."+m,$="pick."+m,x=/(y|m|d)+/g,C=/\d+/g,F=/^\d{2,4}$/,S=m+"-inline",M=m+"-dropdown",I=m+"-top-left",V=m+"-top-right",T=m+"-bottom-left",Y=m+"-bottom-right",A=[I,V,T,Y].join(" "),N=m+"-hide",P=Math.min,j=Object.prototype.toString;u.prototype={constructor:u,init:function(){var e=this.options,i=this.$element,s=e.startDate,a=e.endDate,n=e.date;this.$trigger=t(e.trigger||i),this.isInput=i.is("input")||i.is("textarea"),this.isInline=e.inline&&(e.container||!this.isInput),this.format=d(e.format),this.initialValue=this.getValue(),n=this.parseDate(n||this.initialValue),s&&(s=this.parseDate(s),n.getTime()<s.getTime()&&(n=new Date(s)),this.startDate=s),a&&(a=this.parseDate(a),s&&a.getTime()<s.getTime()&&(a=new Date(s)),n.getTime()>a.getTime()&&(n=new Date(a)),this.endDate=a),this.date=n,this.viewDate=new Date(n),this.initialDate=new Date(this.date),this.bind(),(e.autoshow||this.isInline)&&this.show(),e.autopick&&this.pick()},build:function(){var e,i=this.options,s=this.$element;this.isBuilt||(this.isBuilt=!0,this.$picker=e=t(i.template),this.$week=e.find('[data-view="week"]'),this.$yearsPicker=e.find('[data-view="years picker"]'),this.$yearsPrev=e.find('[data-view="years prev"]'),this.$yearsNext=e.find('[data-view="years next"]'),this.$yearsCurrent=e.find('[data-view="years current"]'),this.$years=e.find('[data-view="years"]'),this.$monthsPicker=e.find('[data-view="months picker"]'),this.$yearPrev=e.find('[data-view="year prev"]'),this.$yearNext=e.find('[data-view="year next"]'),this.$yearCurrent=e.find('[data-view="year current"]'),this.$months=e.find('[data-view="months"]'),this.$daysPicker=e.find('[data-view="days picker"]'),this.$monthPrev=e.find('[data-view="month prev"]'),this.$monthNext=e.find('[data-view="month next"]'),this.$monthCurrent=e.find('[data-view="month current"]'),this.$days=e.find('[data-view="days"]'),this.isInline?t(i.container||s).append(e.addClass(S)):(t(f.body).append(e.addClass(M)),e.addClass(N)),this.fillWeek())},unbuild:function(){this.isBuilt&&(this.isBuilt=!1,this.$picker.remove())},bind:function(){var e=this.options,i=this.$element;t.isFunction(e.show)&&i.on(k,e.show),t.isFunction(e.hide)&&i.on(b,e.hide),t.isFunction(e.pick)&&i.on($,e.pick),this.isInput&&(i.on(g,t.proxy(this.keyup,this)),e.trigger||i.on(v,t.proxy(this.show,this))),this.$trigger.on(y,t.proxy(this.show,this))},unbind:function(){var e=this.options,i=this.$element;t.isFunction(e.show)&&i.off(k,e.show),t.isFunction(e.hide)&&i.off(b,e.hide),t.isFunction(e.pick)&&i.off($,e.pick),this.isInput&&(i.off(g,this.keyup),e.trigger||i.off(v,this.show)),this.$trigger.off(y,this.show)},showView:function(t){var e=this.$yearsPicker,i=this.$monthsPicker,s=this.$daysPicker,a=this.format;if(a.hasYear||a.hasMonth||a.hasDay)switch(w(t)){case 2:case"years":i.addClass(N),s.addClass(N),a.hasYear?(this.fillYears(),e.removeClass(N)):this.showView(0);break;case 1:case"months":e.addClass(N),s.addClass(N),a.hasMonth?(this.fillMonths(),i.removeClass(N)):this.showView(2);break;default:e.addClass(N),i.addClass(N),a.hasDay?(this.fillDays(),s.removeClass(N)):this.showView(1)}},hideView:function(){this.options.autohide&&this.hide()},place:function(){var t=this.options,e=this.$element,i=this.$picker,s=p.outerWidth(),a=p.outerHeight(),n=e.outerWidth(),r=e.outerHeight(),h=i.width(),o=i.height(),l=e.offset(),d=l.left,u=l.top,c=parseFloat(t.offset)||10,f=I;u>o&&u+r+o>a?(u-=o+c,f=T):u+=r+c,d+h>s&&(d=d+n-h,f=f.replace("left","right")),i.removeClass(A).addClass(f).css({top:u,left:d,zIndex:parseInt(t.zIndex,10)})},trigger:function(e,i){var s=t.Event(e,i);return this.$element.trigger(s),s},createItem:function(e){var i=this.options,s=i.itemTag,a={text:"",view:"",muted:!1,picked:!1,disabled:!1};return t.extend(a,e),"<"+s+" "+(a.disabled?'class="'+i.disabledClass+'"':a.picked?'class="'+i.pickedClass+'"':a.muted?'class="'+i.mutedClass+'"':"")+(a.view?' data-view="'+a.view+'"':"")+">"+a.text+"</"+s+">"},fillAll:function(){this.fillYears(),this.fillMonths(),this.fillDays()},fillWeek:function(){var e,i=this.options,s=parseInt(i.weekStart,10)%7,a=i.daysMin,n="";for(a=t.merge(a.slice(s),a.slice(0,s)),e=0;6>=e;e++)n+=this.createItem({text:a[e]});this.$week.html(n)},fillYears:function(){var e,i=this.options,s=i.disabledClass||"",a=i.yearSuffix||"",n=t.isFunction(i.filter)&&i.filter,r=this.startDate,h=this.endDate,o=this.viewDate,l=o.getFullYear(),d=o.getMonth(),u=o.getDate(),c=this.date,f=c.getFullYear(),p=!1,w=!1,m=!1,y=!1,g=!1,v="",D=-5,k=6;for(e=D;k>=e;e++)c=new Date(l+e,d,u),g=e===D||e===k,y=l+e===f,m=!1,r&&(m=c.getFullYear()<r.getFullYear(),e===D&&(p=m)),!m&&h&&(m=c.getFullYear()>h.getFullYear(),e===k&&(w=m)),!m&&n&&(m=n.call(this.$element,c)===!1),v+=this.createItem({text:l+e,view:m?"year disabled":y?"year picked":"year",muted:g,picked:y,disabled:m});this.$yearsPrev.toggleClass(s,p),this.$yearsNext.toggleClass(s,w),this.$yearsCurrent.toggleClass(s,!0).html(l+D+a+" - "+(l+k)+a),this.$years.html(v)},fillMonths:function(){var e,i=this.options,s=i.disabledClass||"",a=i.monthsShort,n=t.isFunction(i.filter)&&i.filter,r=this.startDate,h=this.endDate,o=this.viewDate,l=o.getFullYear(),d=o.getDate(),u=this.date,c=u.getFullYear(),f=u.getMonth(),p=!1,w=!1,m=!1,y=!1,g="";for(e=0;11>=e;e++)u=new Date(l,e,d),y=l===c&&e===f,m=!1,r&&(p=u.getFullYear()===r.getFullYear(),m=p&&u.getMonth()<r.getMonth()),!m&&h&&(w=u.getFullYear()===h.getFullYear(),m=w&&u.getMonth()>h.getMonth()),!m&&n&&(m=n.call(this.$element,u)===!1),g+=this.createItem({index:e,text:a[e],view:m?"month disabled":y?"month picked":"month",picked:y,disabled:m});this.$yearPrev.toggleClass(s,p),this.$yearNext.toggleClass(s,w),this.$yearCurrent.toggleClass(s,p&&w).html(l+i.yearSuffix||""),this.$months.html(g)},fillDays:function(){var e,i,s,a=this.options,n=a.disabledClass||"",r=a.yearSuffix||"",h=a.monthsShort,o=parseInt(a.weekStart,10)%7,d=t.isFunction(a.filter)&&a.filter,u=this.startDate,c=this.endDate,f=this.viewDate,p=f.getFullYear(),w=f.getMonth(),m=p,y=w,g=p,v=w,D=this.date,k=D.getFullYear(),b=D.getMonth(),$=D.getDate(),x=!1,C=!1,F=!1,S=!1,M=[],I=[],V=[],T=42;for(0===w?(m-=1,y=11):y-=1,e=l(m,y),D=new Date(p,w,1),s=D.getDay()-o,0>=s&&(s+=7),u&&(x=D.getTime()<=u.getTime()),i=e-(s-1);e>=i;i++)D=new Date(m,y,i),F=!1,u&&(F=D.getTime()<u.getTime()),!F&&d&&(F=d.call(this.$element,D)===!1),M.push(this.createItem({text:i,view:"day prev",muted:!0,disabled:F}));for(11===w?(g+=1,v=0):v+=1,e=l(p,w),s=T-(M.length+e),D=new Date(p,w,e),c&&(C=D.getTime()>=c.getTime()),i=1;s>=i;i++)D=new Date(g,v,i),F=!1,c&&(F=D.getTime()>c.getTime()),!F&&d&&(F=d.call(this.$element,D)===!1),I.push(this.createItem({text:i,view:"day next",muted:!0,disabled:F}));for(i=1;e>=i;i++)D=new Date(p,w,i),S=p===k&&w===b&&i===$,F=!1,u&&(F=D.getTime()<u.getTime()),!F&&c&&(F=D.getTime()>c.getTime()),!F&&d&&(F=d.call(this.$element,D)===!1),V.push(this.createItem({text:i,view:F?"day disabled":S?"day picked":"day",picked:S,disabled:F}));this.$monthPrev.toggleClass(n,x),this.$monthNext.toggleClass(n,C),this.$monthCurrent.toggleClass(n,x&&C).html(a.yearFirst?p+r+" "+h[w]:h[w]+" "+p+r),this.$days.html(M.join("")+V.join(" ")+I.join(""))},click:function(e){var i,s,a,n,r,h,o=t(e.target),l=this.viewDate;if(e.stopPropagation(),e.preventDefault(),!o.hasClass("disabled"))switch(i=l.getFullYear(),s=l.getMonth(),a=l.getDate(),h=o.data("view")){case"years prev":case"years next":i="years prev"===h?i-10:i+10,r=o.text(),n=F.test(r),n&&(i=parseInt(r,10),this.date=new Date(i,s,P(a,28))),this.viewDate=new Date(i,s,P(a,28)),this.fillYears(),n&&(this.showView(1),this.pick("year"));break;case"year prev":case"year next":i="year prev"===h?i-1:i+1,this.viewDate=new Date(i,s,P(a,28)),this.fillMonths();break;case"year current":this.format.hasYear&&this.showView(2);break;case"year picked":this.format.hasMonth?this.showView(1):this.hideView();break;case"year":i=parseInt(o.text(),10),this.date=new Date(i,s,P(a,28)),this.viewDate=new Date(i,s,P(a,28)),this.format.hasMonth?this.showView(1):this.hideView(),this.pick("year");break;case"month prev":case"month next":s="month prev"===h?s-1:"month next"===h?s+1:s,this.viewDate=new Date(i,s,P(a,28)),this.fillDays();break;case"month current":this.format.hasMonth&&this.showView(1);break;case"month picked":this.format.hasDay?this.showView(0):this.hideView();break;case"month":s=t.inArray(o.text(),this.options.monthsShort),this.date=new Date(i,s,P(a,28)),this.viewDate=new Date(i,s,P(a,28)),this.format.hasDay?this.showView(0):this.hideView(),this.pick("month");break;case"day prev":case"day next":case"day":s="day prev"===h?s-1:"day next"===h?s+1:s,a=parseInt(o.text(),10),this.date=new Date(i,s,a),this.viewDate=new Date(i,s,a),this.fillDays(),"day"===h&&this.hideView(),this.pick("day");break;case"day picked":this.hideView(),this.pick("day")}},clickDoc:function(t){for(var e,i=t.target,s=this.$trigger[0];i!==f;){if(i===s){e=!0;break}i=i.parentNode}e||this.hide()},keyup:function(){this.update()},getValue:function(){var t=this.$element,e="";return this.isInput?e=t.val():this.isInline?this.options.container&&(e=t.text()):e=t.text(),e},setValue:function(t){var e=this.$element;t=i(t)?t:"",this.isInput?e.val(t):this.isInline?this.options.container&&e.text(t):e.text(t)},show:function(){this.isBuilt||this.build(),this.isShown||this.trigger(k).isDefaultPrevented()||(this.isShown=!0,this.$picker.removeClass(N).on(y,t.proxy(this.click,this)),this.showView(this.options.startView),this.isInline||(c.on(D,this._place=h(this.place,this)),p.on(y,this._clickDoc=h(this.clickDoc,this)),this.place()))},hide:function(){this.isShown&&(this.trigger(b).isDefaultPrevented()||(this.isShown=!1,this.$picker.addClass(N).off(y,this.click),this.isInline||(c.off(D,this._place),p.off(y,this._clickDoc))))},update:function(){this.setDate(this.getValue(),!0)},pick:function(t){var e=this.$element,i=this.date;this.trigger($,{view:t||"",date:i}).isDefaultPrevented()||(this.setValue(i=this.formatDate(this.date)),this.isInput&&e.trigger("change"))},reset:function(){this.setDate(this.initialDate,!0),this.setValue(this.initialValue),this.isShown&&this.showView(this.options.startView)},getMonthName:function(e,i){var n=this.options,r=n.months;return t.isNumeric(e)?e=w(e):a(i)&&(i=e),i===!0&&(r=n.monthsShort),r[s(e)?e:this.date.getMonth()]},getDayName:function(e,i,n){var r=this.options,h=r.days;return t.isNumeric(e)?e=w(e):(a(n)&&(n=i),a(i)&&(i=e)),h=n===!0?r.daysMin:i===!0?r.daysShort:h,h[s(e)?e:this.date.getDay()]},getDate:function(t){var e=this.date;return t?this.formatDate(e):new Date(e)},setDate:function(e,s){var a=this.options.filter;if(n(e)||i(e)){if(e=this.parseDate(e),t.isFunction(a)&&a.call(this.$element,e)===!1)return;this.date=e,this.viewDate=new Date(e),s||this.pick(),this.isBuilt&&this.fillAll()}},setStartDate:function(t){(n(t)||i(t))&&(this.startDate=this.parseDate(t),this.isBuilt&&this.fillAll())},setEndDate:function(t){(n(t)||i(t))&&(this.endDate=this.parseDate(t),this.isBuilt&&this.fillAll())},parseDate:function(t){var e,s,a,r,h,o,l=this.format,d=[];if(n(t))return new Date(t.getFullYear(),t.getMonth(),t.getDate());if(i(t)&&(d=t.match(C)||[]),t=new Date,s=t.getFullYear(),a=t.getDate(),r=t.getMonth(),e=l.parts.length,d.length===e)for(o=0;e>o;o++)switch(h=parseInt(d[o],10)||1,l.parts[o]){case"dd":case"d":a=h;break;case"mm":case"m":r=h-1;break;case"yy":s=2e3+h;break;case"yyyy":s=h}return new Date(s,r,a)},formatDate:function(t){var e,i,s,a,r,h=this.format,o="";if(n(t))for(o=h.source,i=t.getFullYear(),a={d:t.getDate(),m:t.getMonth()+1,yy:i.toString().substring(2),yyyy:i},a.dd=(a.d<10?"0":"")+a.d,a.mm=(a.m<10?"0":"")+a.m,e=h.parts.length,r=0;e>r;r++)s=h.parts[r],o=o.replace(s,a[s]);return o},destroy:function(){this.unbind(),this.unbuild(),this.$element.removeData(m)}},u.LANGUAGES={},u.DEFAULTS={autoshow:!1,autohide:!1,autopick:!1,inline:!1,container:null,trigger:null,language:"",format:"mm/dd/yyyy",date:null,startDate:null,endDate:null,startView:0,weekStart:0,yearFirst:!1,yearSuffix:"",days:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],daysShort:["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],daysMin:["Su","Mo","Tu","We","Th","Fr","Sa"],months:["January","February","March","April","May","June","July","August","September","October","November","December"],monthsShort:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],itemTag:"li",mutedClass:"muted",pickedClass:"picked",disabledClass:"disabled",template:'<div class="datepicker-container"><div class="datepicker-panel" data-view="years picker"><ul><li data-view="years prev">&lsaquo;</li><li data-view="years current"></li><li data-view="years next">&rsaquo;</li></ul><ul data-view="years"></ul></div><div class="datepicker-panel" data-view="months picker"><ul><li data-view="year prev">&lsaquo;</li><li data-view="year current"></li><li data-view="year next">&rsaquo;</li></ul><ul data-view="months"></ul></div><div class="datepicker-panel" data-view="days picker"><ul><li data-view="month prev">&lsaquo;</li><li data-view="month current"></li><li data-view="month next">&rsaquo;</li></ul><ul data-view="week"></ul><ul data-view="days"></ul></div></div>',offset:10,zIndex:1e3,filter:null,show:null,hide:null,pick:null},u.setDefaults=function(e){t.extend(u.DEFAULTS,t.isPlainObject(e)&&e)},u.other=t.fn.datepicker,t.fn.datepicker=function(e){var s,n=r(arguments,1);return this.each(function(){var a,r,h=t(this),o=h.data(m);if(!o){if(/destroy/.test(e))return;a=t.extend({},h.data(),t.isPlainObject(e)&&e),h.data(m,o=new u(this,a))}i(e)&&t.isFunction(r=o[e])&&(s=r.apply(o,n))}),a(s)?this:s},t.fn.datepicker.Constructor=u,t.fn.datepicker.languages=u.LANGUAGES,t.fn.datepicker.setDefaults=u.setDefaults,t.fn.datepicker.noConflict=function(){return t.fn.datepicker=u.other,this}});



(function (factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as anonymous module.
    define('datepicker.zh-CN', ['jquery'], factory);
  } else if (typeof exports === 'object') {
    // Node / CommonJS
    factory(require('jquery'));
  } else {
    // Browser globals.
    factory(jQuery);
  }
})(function ($) {

  'use strict';

  $.fn.datepicker.languages['zh-CN'] = {
    format: 'yyyy年mm月dd日',
    days: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
    daysShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
    daysMin: ['日', '一', '二', '三', '四', '五', '六'],
    months: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
    monthsShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
    weekStart: 1,
    yearFirst: true,
    yearSuffix: '年'
  };
});

// 数字滚动js
!function(a){function b(a,b){return a.toFixed(b.decimals)}a.fn.countTo=function(b){return b=b||{},a(this).each(function(){function k(){i+=e,h++,l(i),"function"==typeof c.onUpdate&&c.onUpdate.call(f,i),h>=d&&(g.removeData("countTo"),clearInterval(j.interval),i=c.to,"function"==typeof c.onComplete&&c.onComplete.call(f,i))}function l(a){var b=c.formatter.call(f,a,c);g.text(b)}var c=a.extend({},a.fn.countTo.defaults,{from:a(this).data("from"),to:a(this).data("to"),speed:a(this).data("speed"),refreshInterval:a(this).data("refresh-interval"),decimals:a(this).data("decimals")},b),d=Math.ceil(c.speed/c.refreshInterval),e=(c.to-c.from)/d,f=this,g=a(this),h=0,i=c.from,j=g.data("countTo")||{};g.data("countTo",j),j.interval&&clearInterval(j.interval),j.interval=setInterval(k,c.refreshInterval),l(i)})},a.fn.countTo.defaults={from:0,to:0,speed:1e3,refreshInterval:100,decimals:0,formatter:b,onUpdate:null,onComplete:null}}(jQuery);

// 倒计时
(function ($) {
    jQuery.fn.extend({
        countDown: function (opts) {
            opts = jQuery.extend({
                endDate: this.attr('endDate'),
                cssClass: "imgDiv",
                message: "",
                miniteToAlert: 5,
                callback: function () { return false; }
            }, opts || {});
            var $this = $(this);
            $this.addClass(opts.cssClass);
            //计时功能
            var totalSecs, days, hours, mins, secs, date;
            var date1 = new Date(opts.endDate);
            var flag = true;

            var timer = setInterval(function () {
                date = new Date();
                if (date1- date  >= 0) {
                    totalSecs = (date1-date  ) / 1000;
                    days = Math.floor(totalSecs / 3600 / 24);
                    hours = Math.floor((totalSecs - days * 24 * 3600) / 3600);
                    mins = Math.floor((totalSecs - days * 24 * 3600 - hours * 3600) / 60);
                    secs = Math.floor((totalSecs - days * 24 * 3600 - hours * 3600 - mins * 60));
                    if (flag && mins < opts.miniteToAlert && days == 0 && hours == 0) {
                        flag = false;
                    }
                    days = days < 10 ? "0" + days : days;
                    hours = hours < 10 ? "0" + hours : hours;
                    mins = mins < 10 ? "0" + mins : mins;
                    secs = secs < 10 ? "0" + secs : secs;

                    $this.html("");
                    $this.append('<span>'+days+'</span>'+'<em>天</em>'+'<span>'+hours+'</span>' +'<em>时</em>'+ "<span>" + mins + "</span>"+'<em>分</em>' + '<span>'+secs+'</span>'+'<em>秒</em>' );
                } else {
                    $this.html("结束");
                    $this.append("");
                    opts.callback();
                    clearInterval(timer);
                }
            }, 1000);
        }
    });
})(jQuery);



jQuery(document).ready(function($) {

    //菜单
    $(".MENUS li").hover(function(){           
        $(this).addClass("ok").find("dl").stop(true,true).slideUp(0).slideDown(300);
    },function(){
    $(".ok").find("dl").stop(true,true).slideUp(200);
        $(this).removeClass("ok");
    });


    //选项卡切换
    $(".TAB li").mousemove(function(){
        var tab=$(this).parent(".TAB");
        var con=tab.attr("id");
        var on=tab.find("li").index(this);
        $(this).addClass('hover').siblings(tab.find("li")).removeClass('hover');
        $(con).eq(on).show().siblings(con).hide();
    });


    //选项卡点击切换
    $(".TAB_CLICK li").click(function(){
        var tab=$(this).parent(".TAB_CLICK");
        var con=tab.attr("id");
        var on=tab.find("li").index(this);
        $(this).addClass('hover').siblings(tab.find("li")).removeClass('hover');
        $(con).eq(on).show().siblings(con).hide();
    });


    $('#top .lan').hover(function(){
        $('#top .lan ul').css('height','auto');
    },function(){
        $('#top .lan ul').css('height','48px');
    })

});

var isMobile = false;

$(window).resize(function(event) {
    isMobile = $('.m-hd').is(':visible'); 
    return isMobile;
}).resize();


jQuery(document).ready(function($) {

    jQuery(document).ready(function($) {
        MobileMenu.init();
    });

    var MobileMenu = {
        init: function(){
            this.showNav();
            this.showSub();
            this.hideNav();
            this.hassub();
        },
        showNav: function(){
            $('.m-trigger').click(function(e){
                var m_nav = $('.m-nav'); 
                if(m_nav.is(':visible')){
                    $('.m-nav').hide();
                }else{
                    $('.m-nav').show();
                }
                e.stopPropagation();
            });
        },
        hassub: function(){
            $('.m-nav li').each(function() {
                if( $(this).find('.m-sub a').length > 0 ){
                    $(this).addClass('has-sub');
                }
            });
        },
        showSub: function(){
            $('.m-nav li > a').click(function(){
                var sub = $(this).next('.m-sub');
                if( !sub.length > 0){
                    return true;
                }
                if(sub.is(':visible')){
                    sub.hide();
                    $(this).removeClass('on');
                }else{
                    $('.m-sub').hide();
                    $('.m-nav li .on').removeClass('on');
                    $(this).addClass('on');
                    sub.show();
                }
                return false;
            })
        },
        hideNav:function(){
            $('body').click(function(){
                $('.m-nav').hide();
            })
        }
    }
});

// 菜单
$('#nav li').mouseenter(function(event) {
    var sub = $(this).find('.has-sub'); 
    if( sub.length >0 ){
        sub.stop(false,false).animate({height: sub.get(0).scrollHeight});
    }
}).mouseleave(function(event) {
    var sub = $(this).find('.has-sub'); 
    
    if( sub.length >0 ){
        sub.stop(false,false).animate({height: 0});
    }
});

/*分页*/
;(function(){

    $('.m-page .num').click(function(event) {
        $('body').addClass('show-page');
    });
    $('.m-page-pop').click(function(event) {
        $('body').removeClass('show-page');
    });
})();
// 分享到
;(function(){
    var shareJs = document.createElement('script');
    shareJs.setAttribute('type', 'text/javascript');
    shareJs.setAttribute('src', 'http://static.bshare.cn/b/buttonLite.js#uuid=&style=-1');
    document.getElementsByTagName('head').item(0).appendChild(shareJs);

    var shareJs = document.createElement('script');
    shareJs.setAttribute('type', 'text/javascript');
    shareJs.setAttribute('src', 'http://static.bshare.cn/b/bshareC3.js');
    document.getElementsByTagName('head').item(0).appendChild(shareJs);
    
  /*  var shareJs = document.createElement('script');
    shareJs.setAttribute('type', 'text/javascript');
    shareJs.setAttribute('src', 'http://v3.jiathis.com/code/jia.js');
    document.getElementsByTagName('body').item(0).appendChild(shareJs);*/
    

})();



$('.open-s').click(function(event) {
    $('.side-online .con').stop().animate({right: 0});
    $(this).stop().animate({right: -70});
    return false;
});


$('.close-s').click(function(event) {
    $('.side-online .con').stop().animate({right: -116});
    $('.side-online .open-s').stop().animate({right: 0});
    return false;
});





jQuery.fn.exists = function(){return this.length>0;}

// 首页

if ($('#banner').exists()) {

    function add_dot(){
        var num = $('#banner > div').length;
        for(var i = 0; i < num; i++){
            $('<li></li>').appendTo('.slider-nav');
        }
    }
    add_dot();
    
    $('#banner').slick({
      dots: false,
      arrows:true,
      infinite: true,
      speed: 500,
      autoplay: true
    });
    $('#banner').on('afterChange', function(event, slick, currentSlide, nextSlide){
        $('.slider-nav li').eq(currentSlide).addClass('on').siblings('li').removeClass('on');
    });

    $('.prev').click(function(){
        $('#banner').slick('slickPrev');
    });

    $('.next').click(function(){
        $('#banner').slick('slickNext');
    });
    $('.slider-nav li').click(function(event) {
        $('#banner').slick('slickGoTo', $(this).index());
        return false;
    });

    $('#hot-slider').slick({
      dots: true,
      arrows:false,
      infinite: true,
      adaptiveHeight:true,
      speed: 300,
      autoplay: false,
      customPaging: function(slider, i) {
          return '<a  tabindex="0">' + (i + 1) + '</a>';
      }
    });
    $('.slider-nav li:first').addClass('on');

    $('.ul-list1 li a').hover(function() {
        var img = $(this).css('background-image');
        var txt = $(this).find('em').text();
        var url = $(this).attr('href');
        $('.pic-big a').css({'background-image':img});
        $('.pic-big a').attr('href',url);
        $('.pic-big h3').text(txt);
    });
}
// 产品内页
if ( $('#product-pic').exists() ){
     $('#product-pic').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      adaptiveHeight: true,
      arrows: true,
      asNavFor: '#product-thumb'
    });
    $('#product-thumb').slick({
      slidesToShow: 4,
      slidesToScroll: 1,
      asNavFor: '#product-pic',
      dots: false,
      arrows: false,
      responsive: [
         {
           breakpoint: 640,
           settings: {
             slidesToShow: 3
           }
        }
        ],
      // centerMode: true,
      focusOnSelect: true
    });

    $('#product-pic').on('afterChange', function(event, slick, currentSlide, nextSlide){
        $('#product-thumb .item').eq(currentSlide).addClass('slick-current').siblings('.item').removeClass('slick-current');
    });



    var $curPos = $('.pro-nav'); 
        $(window).load(function() {
            $curPos.sticky({
                topSpacing: 0, 
                zIndex: 100
            });
        });


/*        $(".pro-nav .l a").click(function(event){      
            $('html,body').animate({scrollTop:$(this.hash).offset().top - $('.t2-u1').outerHeight(true)+10},500);
            event.preventDefault();
        });*/


} 
// 产品列表页
if ( $('.ul-pro-list').exists() ){
    $('.ul-pro-list li').hover(function(){
        $(this).toggleClass('on');
    })    
}
// 申报维修
if ( $('.form-boxz').exists() ){
    $('.inp-file').change(function(event) {
        var val = $(this).val();
        var fileName = val.split(/(\\|\/)/g).pop()
        $('#file-label-a span').text(fileName)
    });
    var date = $('[data-toggle="datepicker"]').datepicker({
      autohide:true,
      inline: true,
      language: 'zh-CN',
      format: 'yyyy-mm-dd'
    });
}
// 常见问题

if ( $('.list-oc').exists() ){
    $('.list-oc .hd').click(function(event) {
         var con = $(this).parents('li').find('.bd'); 
             if(con.is(':visible')){
                 $(this).removeClass('on');
                 con.slideUp();
             }else{
                 $('.list-oc .bd').slideUp();
                 $('.list-oc .hd').removeClass('on');
                 con.slideDown();
                 $(this).addClass('on');
             }
        return false;
    });
}

if ( $('#select1').exists() ){

    addressInit('select1', 'select2', 'select3');
}


// 关于

if ( $('.history-box').exists() ){
    $('.timer').countTo();
    $('.flexslider').flexslider({
        animation: "slide",
         prevText:"",
         nextText:"",
         slideshow:false,
         controlNav: false,
         directionNav: true,
         pauseOnHover: true,
         slideshowSpeed: 4000
     });
}


//$('.ul-history li:nth-child(4)').addClass('on');

$('.history-box .slider-for').slick({
  arrows: false,
  slidesToShow: 1,
  slidesToScroll: 1,
  infinite: false,
  asNavFor: '.slider-nav'
});

$('.history-box .slider-nav').slick({
  infinite: false,
  slidesToShow: 6,
  slidesToScroll: 1,
  asNavFor: '.slider-for',
  responsive: [
      {
        breakpoint: 1000,
        settings: {
          slidesToShow: 4,
        }
      }
   ],
  dots: false,
  arrows: false,
  focusOnSelect: true
});

if ( $('.ul-history').exists() ){

    $('.ul-history li:even').addClass('even');   
        $('.ul-history li:odd').addClass('odd');  
        $('.ul-history li').hover(function(){
            $(this).toggleClass('on');
    }) 
}

function isJson(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

$('.tab-3').tabs({tit:'a',curClass:'on'});
if ( $('.fixed-bar').exists() ){
    $('body').addClass('pro-dsiplay');
    var offset = isMobile ? $('.m-hd').outerHeight() : $('#hd').outerHeight();

    $(window).scroll(function(){
          var y = $(window).scrollTop();

         $('#float-bar li a[href^=#]').each(function (event) {
             if (y  >= $($(this).attr('href')).offset().top - offset) {
                 $('#float-bar li a').not(this).removeClass('current');
                 $(this).addClass('current');
             }
         });
        if( y + $(window).height() == $(document).height()) {
             $('#float-bar li a').removeClass('current');
             $('#float-bar li:last a').addClass('current');

        }
    })



    $('#float-bar li a').on('click', function () {
        var scrollAnchor = $(this).attr('src'),
            scrollPoint = $($(this).attr('href')).offset().top;
        var offset = isMobile ? $('.m-hd').height() : $('#hd').height();
        $('body,html').stop().animate({
            scrollTop: scrollPoint -offset
        }, 500);
        return false;

    })

    $(window).load(function() {
        $(window).scroll();
    });


    $('.s-top').click(function(){
        $('body,html').stop().animate({
            scrollTop: 0
        }, 500);
        return false;
    })
    
    
}

if ( $('#hd').is(':visible') ){

  
       $('#hd').sticky({
            topSpacing: 0, 
            zIndex: 99999
        });

}



$('.show-side').click(function(event) {
    $('.serach-con').toggleClass('slide-in');
});

$('.m-sub-menu').slick({
    slidesToShow: 2,
    variableWidth: true,
    infinite: false,
    slidesToScroll: 1,
    arrows: true
});

$('.pro-snv .wp').slick({
    slidesToShow: 7,
    infinite: false,
    slidesToScroll: 1,
    arrows: true
});


$('.vidoe-box').slick({
    infinite: false,
    useCSS: false,
    arrows: true
});

$('.vidoe-box').on('afterChange', function(event, slick, currentSlide, nextSlide){
	$('.vidoe-box').find('video').each(function(){
		this.pause();
	})
	
});
       

