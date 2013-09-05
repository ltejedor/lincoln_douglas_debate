window.onload=function(){function e(e,t){throw $('<div id="bsCustomizerAlert" class="bs-customizer-alert">        <div class="container">          <a href="#bsCustomizerAlert" data-dismiss="alert" class="close pull-right">&times;</a>          <p class="bs-customizer-alert-text"><span class="glyphicon glyphicon-warning-sign"></span>'+e+"</p>"+(t.extract?'<pre class="bs-customizer-alert-extract">'+t.extract.join("\n")+"</pre>":"")+"        </div>      </div>").appendTo("body").alert(),t}function t(e,t){var s=$('<div class="bs-callout bs-callout-danger">       <h4>Attention!</h4>      <p>'+e+"</p>    </div>");t?s.appendTo(".bs-docs-container"):s.insertAfter(".bs-customize-download")}function s(e){e=e.replace(/[*+?^$.\[\]{}()|\\\/]/g,"\\$&");var t=location.search.match(new RegExp("[?&]"+e+"=([^&]+)(&|$)"));return t&&decodeURIComponent(t[1].replace(/\+/g," "))}function n(t){var s={description:"Bootstrap Customizer Config","public":!0,files:{"config.json":{content:JSON.stringify(t,null,2)}}};$.ajax({url:"https://api.github.com/gists",type:"POST",dataType:"json",data:JSON.stringify(s)}).success(function(e){history.replaceState(!1,document.title,window.location.origin+window.location.pathname+"?id="+e.id)}).error(function(t){e("<strong>Ruh roh!</strong> Could not save gist file, configuration not saved.",t)})}function o(){var e={};$("#less-variables-section input").each(function(){$(this).val()&&(e[$(this).prev().text()]=$(this).val())});var t={vars:e,css:$("#less-section input:checked").map(function(){return this.value}).toArray(),js:$("#plugin-section input:checked").map(function(){return this.value}).toArray()};if(!$.isEmptyObject(t.vars)||t.css.length||t.js.length)return t}function i(){var t=s("id");t&&$.ajax({url:"https://api.github.com/gists/"+t,type:"GET",dataType:"json"}).success(function(e){var t=JSON.parse(e.files["config.json"].content);if(t.js&&$("#plugin-section input").each(function(){$(this).prop("checked",~$.inArray(this.value,t.js))}),t.css&&$("#less-section input").each(function(){$(this).prop("checked",~$.inArray(this.value,t.css))}),t.vars)for(var s in t.vars)$('input[data-var="'+s+'"]').val(t.vars[s])}).error(function(t){e("Error fetching bootstrap config file",t)})}function r(t,s,n,o){if(!t&&!s)return e("<strong>Ruh roh!</strong> No Bootstrap files selected.",new Error("no Bootstrap"));var i=new JSZip;if(t){var r=i.folder("css");for(var a in t)r.file(a,t[a])}if(s){var c=i.folder("js");for(var a in s)c.file(a,s[a])}if(n){var l=i.folder("fonts");for(var a in n)l.file(a,n[a])}var u=i.generate({type:"blob"});o(u)}function a(e){var t="";for(var s in e)t+=s+": "+e[s]+";\n";return t+"\n\n"}function c(){var e=$('#less-section [value="glyphicons.less"]:checked');return e.length?__fonts:void 0}function l(){var t=$("#less-section input:checked");if(!t.length)return!1;var s={},n={},o="";$("#less-variables-section input").each(function(){$(this).val()&&(n[$(this).prev().text()]=$(this).val())}),o+=__less["variables.less"],n&&(o+=a(n)),o+=__less["mixins.less"],o+=__less["normalize.less"],o+=__less["scaffolding.less"],o+=t.map(function(){return __less[this.value]}).toArray().join("\n"),o=o.replace(/@import[^\n]*/gi,"");try{new less.Parser({paths:["variables.less","mixins.less"],optimization:0,filename:"bootstrap.css"}).parse(o,function(t,n){return t?e("<strong>Ruh roh!</strong> Could not parse less files.",t):(s={"bootstrap.css":p+n.toCSS(),"bootstrap.min.css":p+n.toCSS({compress:!0})},void 0)})}catch(i){return e("<strong>Ruh roh!</strong> Could not parse less files.",i)}return s}function u(){var e=$("#plugin-section input:checked");if(!e.length)return!1;var t=e.map(function(){return __js[this.value]}).toArray().join("\n");return{"bootstrap.js":t,"bootstrap.min.js":p+uglify(t)}}var p="/*!\n * Bootstrap v3.0.0\n *\n * Copyright 2013 Twitter, Inc\n * Licensed under the Apache License v2.0\n * http://www.apache.org/licenses/LICENSE-2.0\n *\n * Designed and built with all the love in the world @twitter by @mdo and @fat.\n */\n\n",d=$("#less-section input"),f=$("#plugin-section input"),h=$("#less-variables-section input");$("#less-section .toggle").on("click",function(e){e.preventDefault(),d.prop("checked",!d.is(":checked"))}),$("#plugin-section .toggle").on("click",function(e){e.preventDefault(),f.prop("checked",!f.is(":checked"))}),$("#less-variables-section .toggle").on("click",function(e){e.preventDefault(),h.val("")}),$("[data-dependencies]").on("click",function(){if($(this).is(":checked")){var e=this.getAttribute("data-dependencies");if(e){e=e.split(",");for(var t=0;t<e.length;t++){var s=$('[value="'+e[t]+'"]');s&&s.prop("checked",!0)}}}}),$("[data-dependents]").on("click",function(){if(!$(this).is(":checked")){var e=this.getAttribute("data-dependents");if(e){e=e.split(",");for(var t=0;t<e.length;t++){var s=$('[value="'+e[t]+'"]');s&&s.prop("checked",!1)}}}});var v=$("#btn-compile");$("#btn-download"),v.on("click",function(e){e.preventDefault(),v.attr("disabled","disabled"),r(l(),u(),c(),function(e){v.removeAttr("disabled"),saveAs(e,"bootstrap.zip"),n(o())})}),window.URL||-1==navigator.userAgent.toLowerCase().indexOf("safari")?window.URL||window.webkitURL||($(".bs-docs-section, .bs-sidebar").css("display","none"),t('Looks like your current browser doesn\'t support the Bootstrap Customizer. Please take a second                to <a href="https://www.google.com/intl/en/chrome/browser/"> upgrade to a more modern browser</a>.',!0)):t('Looks like you\'re using safari, which sadly doesn\'t have the best support                 for HTML5 blobs. Because of this your file will be downloaded with the name <code>"untitled"</code>.                 However, if you check your downloads folder, just rename this <code>"untitled"</code> file                 to <code>"bootstrap.zip"</code> and you should be good to go!'),i()};