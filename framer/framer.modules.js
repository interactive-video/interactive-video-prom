require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"ajax":[function(require,module,exports){
exports.get = function(url, callback) {
  var request;
  request = new XMLHttpRequest();
  request.open('GET', url, true);
  request.responseType = 'blob';
  print("1");
  request.onload = function() {
    var vid, videoBlob;
    print("loading");
    if (request.status >= 200 && request.status < 400) {
      videoBlob = request.response;
      print("converting blob");
      vid = URL.createObjectUrl(videoBlob);
      print("finished converting");
      return video.src = vid;
    }
  };
  request.onerror = function() {
    print("error: ", request.statusText);
    return callback({
      status: false
    });
  };
  return request.send();
};


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset:utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCIvVXNlcnMvY2hyaXN0aW5hem91L0Rvd25sb2Fkcy92aWRlb19wbGF5ZXJfc3RhYmJpbmcuZnJhbWVyL21vZHVsZXMvYWpheC5jb2ZmZWUiLCIvVXNlcnMvY2hyaXN0aW5hem91L0Rvd25sb2Fkcy92aWRlb19wbGF5ZXJfc3RhYmJpbmcuZnJhbWVyL21vZHVsZXMvbXlNb2R1bGUuY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FDQUEsT0FBTyxDQUFDLEdBQVIsR0FBYyxTQUFDLEdBQUQsRUFBTSxRQUFOO0FBQ1YsTUFBQTtFQUFBLE9BQUEsR0FBYyxJQUFBLGNBQUEsQ0FBQTtFQUNkLE9BQU8sQ0FBQyxJQUFSLENBQWEsS0FBYixFQUFvQixHQUFwQixFQUF5QixJQUF6QjtFQUNBLE9BQU8sQ0FBQyxZQUFSLEdBQXVCO0VBRXZCLEtBQUEsQ0FBTSxHQUFOO0VBQ0EsT0FBTyxDQUFDLE1BQVIsR0FBaUIsU0FBQTtBQUNiLFFBQUE7SUFBQSxLQUFBLENBQU0sU0FBTjtJQUNBLElBQUcsT0FBTyxDQUFDLE1BQVIsSUFBa0IsR0FBbEIsSUFBMEIsT0FBTyxDQUFDLE1BQVIsR0FBaUIsR0FBOUM7TUFDSSxTQUFBLEdBQVksT0FBTyxDQUFDO01BQ3BCLEtBQUEsQ0FBTSxpQkFBTjtNQUNBLEdBQUEsR0FBTSxHQUFHLENBQUMsZUFBSixDQUFvQixTQUFwQjtNQUNOLEtBQUEsQ0FBTSxxQkFBTjthQUNBLEtBQUssQ0FBQyxHQUFOLEdBQVksSUFMaEI7O0VBRmE7RUFTakIsT0FBTyxDQUFDLE9BQVIsR0FBa0IsU0FBQTtJQUNkLEtBQUEsQ0FBTSxTQUFOLEVBQWlCLE9BQU8sQ0FBQyxVQUF6QjtXQUNBLFFBQUEsQ0FBUztNQUFDLE1BQUEsRUFBUSxLQUFUO0tBQVQ7RUFGYztTQUtsQixPQUFPLENBQUMsSUFBUixDQUFBO0FBcEJVOzs7O0FDSWQsT0FBTyxDQUFDLEtBQVIsR0FBZ0I7O0FBRWhCLE9BQU8sQ0FBQyxVQUFSLEdBQXFCLFNBQUE7U0FDcEIsS0FBQSxDQUFNLHVCQUFOO0FBRG9COztBQUdyQixPQUFPLENBQUMsT0FBUixHQUFrQixDQUFDLENBQUQsRUFBSSxDQUFKLEVBQU8sQ0FBUCIsImZpbGUiOiJnZW5lcmF0ZWQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlc0NvbnRlbnQiOlsiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiLCJleHBvcnRzLmdldCA9ICh1cmwsIGNhbGxiYWNrKSAtPlxuICAgIHJlcXVlc3QgPSBuZXcgWE1MSHR0cFJlcXVlc3QoKVxuICAgIHJlcXVlc3Qub3BlbignR0VUJywgdXJsLCB0cnVlKVxuICAgIHJlcXVlc3QucmVzcG9uc2VUeXBlID0gJ2Jsb2InXG5cbiAgICBwcmludCBcIjFcIlxuICAgIHJlcXVlc3Qub25sb2FkID0gLT5cbiAgICAgICAgcHJpbnQgXCJsb2FkaW5nXCJcbiAgICAgICAgaWYgcmVxdWVzdC5zdGF0dXMgPj0gMjAwIGFuZCByZXF1ZXN0LnN0YXR1cyA8IDQwMFxuICAgICAgICAgICAgdmlkZW9CbG9iID0gcmVxdWVzdC5yZXNwb25zZVxuICAgICAgICAgICAgcHJpbnQgXCJjb252ZXJ0aW5nIGJsb2JcIlxuICAgICAgICAgICAgdmlkID0gVVJMLmNyZWF0ZU9iamVjdFVybCh2aWRlb0Jsb2IpXG4gICAgICAgICAgICBwcmludCBcImZpbmlzaGVkIGNvbnZlcnRpbmdcIlxuICAgICAgICAgICAgdmlkZW8uc3JjID0gdmlkXG5cbiAgICByZXF1ZXN0Lm9uZXJyb3IgPSAtPlxuICAgICAgICBwcmludCBcImVycm9yOiBcIiwgcmVxdWVzdC5zdGF0dXNUZXh0XG4gICAgICAgIGNhbGxiYWNrKHtzdGF0dXM6IGZhbHNlfSlcblxuXG4gICAgcmVxdWVzdC5zZW5kKCkiLCIjIEFkZCB0aGUgZm9sbG93aW5nIGxpbmUgdG8geW91ciBwcm9qZWN0IGluIEZyYW1lciBTdHVkaW8uIFxuIyBteU1vZHVsZSA9IHJlcXVpcmUgXCJteU1vZHVsZVwiXG4jIFJlZmVyZW5jZSB0aGUgY29udGVudHMgYnkgbmFtZSwgbGlrZSBteU1vZHVsZS5teUZ1bmN0aW9uKCkgb3IgbXlNb2R1bGUubXlWYXJcblxuZXhwb3J0cy5teVZhciA9IFwibXlWYXJpYWJsZVwiXG5cbmV4cG9ydHMubXlGdW5jdGlvbiA9IC0+XG5cdHByaW50IFwibXlGdW5jdGlvbiBpcyBydW5uaW5nXCJcblxuZXhwb3J0cy5teUFycmF5ID0gWzEsIDIsIDNdIl19
