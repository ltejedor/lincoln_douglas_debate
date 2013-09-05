if("function"!=typeof Blob||"undefined"==typeof URL)if("function"==typeof Blob&&"undefined"!=typeof webkitURL)self.URL=webkitURL;else var Blob=function(t){"use strict";var e=t.BlobBuilder||t.WebKitBlobBuilder||t.MozBlobBuilder||t.MSBlobBuilder||function(t){var e=function(t){return Object.prototype.toString.call(t).match(/^\[object\s(.*)\]$/)[1]},n=function(){this.data=[]},o=function(t,e,n){this.data=t,this.size=t.length,this.type=e,this.encoding=n},r=n.prototype,i=o.prototype,a=t.FileReaderSync,c=function(t){this.code=this[this.name=t]},u="NOT_FOUND_ERR SECURITY_ERR ABORT_ERR NOT_READABLE_ERR ENCODING_ERR NO_MODIFICATION_ALLOWED_ERR INVALID_STATE_ERR SYNTAX_ERR".split(" "),s=u.length,l=t.URL||t.webkitURL||t,d=l.createObjectURL,f=l.revokeObjectURL,R=l,p=t.btoa,b=t.atob,h=t.ArrayBuffer,v=t.Uint8Array;for(o.fake=i.fake=!0;s--;)c.prototype[u[s]]=s+1;return l.createObjectURL||(R=t.URL={}),R.createObjectURL=function(t){var e,n=t.type;return null===n&&(n="application/octet-stream"),t instanceof o?(e="data:"+n,"base64"===t.encoding?e+";base64,"+t.data:"URI"===t.encoding?e+","+decodeURIComponent(t.data):p?e+";base64,"+p(t.data):e+","+encodeURIComponent(t.data)):d?d.call(l,t):void 0},R.revokeObjectURL=function(t){"data:"!==t.substring(0,5)&&f&&f.call(l,t)},r.append=function(t){var n=this.data;if(v&&(t instanceof h||t instanceof v)){for(var r="",i=new v(t),u=0,s=i.length;s>u;u++)r+=String.fromCharCode(i[u]);n.push(r)}else if("Blob"===e(t)||"File"===e(t)){if(!a)throw new c("NOT_READABLE_ERR");var l=new a;n.push(l.readAsBinaryString(t))}else t instanceof o?"base64"===t.encoding&&b?n.push(b(t.data)):"URI"===t.encoding?n.push(decodeURIComponent(t.data)):"raw"===t.encoding&&n.push(t.data):("string"!=typeof t&&(t+=""),n.push(unescape(encodeURIComponent(t))))},r.getBlob=function(t){return arguments.length||(t=null),new o(this.data.join(""),t,"raw")},r.toString=function(){return"[object BlobBuilder]"},i.slice=function(t,e,n){var r=arguments.length;return 3>r&&(n=null),new o(this.data.slice(t,r>1?e:this.data.length),n,this.encoding)},i.toString=function(){return"[object Blob]"},n}(t);return function(t,n){var o=n?n.type||"":"",r=new e;if(t)for(var i=0,a=t.length;a>i;i++)r.append(t[i]);return r.getBlob(o)}}(self);var saveAs=saveAs||navigator.msSaveOrOpenBlob&&navigator.msSaveOrOpenBlob.bind(navigator)||function(t){"use strict";var e=t.document,n=function(){return t.URL||t.webkitURL||t},o=t.URL||t.webkitURL||t,r=e.createElementNS("http://www.w3.org/1999/xhtml","a"),i=!t.externalHost&&"download"in r,a=function(n){var o=e.createEvent("MouseEvents");o.initMouseEvent("click",!0,!1,t,0,0,0,0,0,!1,!1,!1,!1,0,null),n.dispatchEvent(o)},c=t.webkitRequestFileSystem,u=t.requestFileSystem||c||t.mozRequestFileSystem,s=function(e){(t.setImmediate||t.setTimeout)(function(){throw e},0)},l="application/octet-stream",d=0,f=[],R=function(){for(var t=f.length;t--;){var e=f[t];"string"==typeof e?o.revokeObjectURL(e):e.remove()}f.length=0},p=function(t,e,n){e=[].concat(e);for(var o=e.length;o--;){var r=t["on"+e[o]];if("function"==typeof r)try{r.call(t,n||t)}catch(i){s(i)}}},b=function(e,o){var s,R,b,h=this,v=e.type,g=!1,w=function(){var t=n().createObjectURL(e);return f.push(t),t},y=function(){p(h,"writestart progress write writeend".split(" "))},E=function(){(g||!s)&&(s=w(e)),R?R.location.href=s:window.open(s,"_blank"),h.readyState=h.DONE,y()},O=function(t){return function(){return h.readyState!==h.DONE?t.apply(this,arguments):void 0}},U={create:!0,exclusive:!1};return h.readyState=h.INIT,o||(o="download"),i?(s=w(e),r.href=s,r.download=o,a(r),h.readyState=h.DONE,y(),void 0):(t.chrome&&v&&v!==l&&(b=e.slice||e.webkitSlice,e=b.call(e,0,e.size,l),g=!0),c&&"download"!==o&&(o+=".download"),(v===l||c)&&(R=t),u?(d+=e.size,u(t.TEMPORARY,d,O(function(t){t.root.getDirectory("saved",U,O(function(t){var n=function(){t.getFile(o,U,O(function(t){t.createWriter(O(function(n){n.onwriteend=function(e){R.location.href=t.toURL(),f.push(t),h.readyState=h.DONE,p(h,"writeend",e)},n.onerror=function(){var t=n.error;t.code!==t.ABORT_ERR&&E()},"writestart progress write abort".split(" ").forEach(function(t){n["on"+t]=h["on"+t]}),n.write(e),h.abort=function(){n.abort(),h.readyState=h.DONE},h.readyState=h.WRITING}),E)}),E)};t.getFile(o,{create:!1},O(function(t){t.remove(),n()}),O(function(t){t.code===t.NOT_FOUND_ERR?n():E()}))}),E)}),E),void 0):(E(),void 0))},h=b.prototype,v=function(t,e){return new b(t,e)};return h.abort=function(){var t=this;t.readyState=t.DONE,p(t,"abort")},h.readyState=h.INIT=0,h.WRITING=1,h.DONE=2,h.error=h.onwritestart=h.onprogress=h.onwrite=h.onabort=h.onerror=h.onwriteend=null,t.addEventListener("unload",R,!1),v}(self);