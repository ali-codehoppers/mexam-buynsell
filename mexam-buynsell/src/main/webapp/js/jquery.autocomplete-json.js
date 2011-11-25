--- jquery.autocomplete.js	2009-06-12 15:16:22.000000000 +0100
+++ autosuggest.mine.js	2009-06-11 14:30:01.000000000 +0100
@@ -280,6 +280,22 @@
 		return parsed;
 	};
 
+	function parseJsonData(data) {
+		if (!data) return null;
+		var parsed = [];
+		
+		for (var i = 0; i < data.length; i++) {
+			var row = data[i];
+			if (row && typeof(row) == "string") {
+				parsed[i] = row.split(options.cellSeparator);
+			} else if (row && typeof(row) != "object") {
+				parsed[i] = escape(row);
+			}
+		}
+		
+		return parsed;
+	};
+
 	function dataToDom(data) {
 		var ul = document.createElement("ul");
 		var num = data.length;
@@ -321,6 +337,13 @@
 		// recieve the cached data
 		if (data) {
 			receiveData(q, data);
+		} else if (options.json != false && (typeof options.url == "string")) { 
+			$.getJSON(makeUrl(q), function(data) {
+
+				data = parseJsonData(data);
+				addToCache(q, data);
+				receiveData(q, data);
+			});
 		// if an AJAX url has been supplied, try loading the data now
 		} else if( (typeof options.url == "string") && (options.url.length > 0) ){
 			$.get(makeUrl(q), function(data) {
@@ -387,6 +410,12 @@
 		var data = options.cacheLength ? loadFromCache(q) : null;
 		if (data) {
 			findValueCallback(q, data);
+		} else if (options.json != false && (typeof options.url == "string")) { 
+			$.getJSON(makeUrl(q), function(data) {
+				data = parseJsonData(data);
+				addToCache(q, data);
+				findValueCallback(q, data);
+			});
 		} else if( (typeof options.url == "string") && (options.url.length > 0) ){
 			$.get(makeUrl(q), function(data) {
 				data = parseData(data)
@@ -479,6 +508,7 @@
 	options.selectOnly = options.selectOnly || false;
 	options.maxItemsToShow = options.maxItemsToShow || -1;
 	options.autoFill = options.autoFill || false;
+	options.json = 	options.json || false;
 	options.width = parseInt(options.width, 10) || 0;
 
 	this.each(function() {
@@ -500,4 +530,3 @@
 	}
 	return -1;
 };
-
