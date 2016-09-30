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
//# sourceMappingURL=data:application/json;charset:utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCIvVXNlcnMvY2hyaXN0aW5hem91L0Rvd25sb2Fkcy92aWRlb19wbGF5ZXJfcHJvbS5mcmFtZXIvbW9kdWxlcy9hamF4LmNvZmZlZSIsIi9Vc2Vycy9jaHJpc3RpbmF6b3UvRG93bmxvYWRzL3ZpZGVvX3BsYXllcl9wcm9tLmZyYW1lci9tb2R1bGVzL215TW9kdWxlLmNvZmZlZSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTtBQ0FBLE9BQU8sQ0FBQyxHQUFSLEdBQWMsU0FBQyxHQUFELEVBQU0sUUFBTjtBQUNWLE1BQUE7RUFBQSxPQUFBLEdBQWMsSUFBQSxjQUFBLENBQUE7RUFDZCxPQUFPLENBQUMsSUFBUixDQUFhLEtBQWIsRUFBb0IsR0FBcEIsRUFBeUIsSUFBekI7RUFDQSxPQUFPLENBQUMsWUFBUixHQUF1QjtFQUV2QixLQUFBLENBQU0sR0FBTjtFQUNBLE9BQU8sQ0FBQyxNQUFSLEdBQWlCLFNBQUE7QUFDYixRQUFBO0lBQUEsS0FBQSxDQUFNLFNBQU47SUFDQSxJQUFHLE9BQU8sQ0FBQyxNQUFSLElBQWtCLEdBQWxCLElBQTBCLE9BQU8sQ0FBQyxNQUFSLEdBQWlCLEdBQTlDO01BQ0ksU0FBQSxHQUFZLE9BQU8sQ0FBQztNQUNwQixLQUFBLENBQU0saUJBQU47TUFDQSxHQUFBLEdBQU0sR0FBRyxDQUFDLGVBQUosQ0FBb0IsU0FBcEI7TUFDTixLQUFBLENBQU0scUJBQU47YUFDQSxLQUFLLENBQUMsR0FBTixHQUFZLElBTGhCOztFQUZhO0VBU2pCLE9BQU8sQ0FBQyxPQUFSLEdBQWtCLFNBQUE7SUFDZCxLQUFBLENBQU0sU0FBTixFQUFpQixPQUFPLENBQUMsVUFBekI7V0FDQSxRQUFBLENBQVM7TUFBQyxNQUFBLEVBQVEsS0FBVDtLQUFUO0VBRmM7U0FLbEIsT0FBTyxDQUFDLElBQVIsQ0FBQTtBQXBCVTs7OztBQ0lkLE9BQU8sQ0FBQyxLQUFSLEdBQWdCOztBQUVoQixPQUFPLENBQUMsVUFBUixHQUFxQixTQUFBO1NBQ3BCLEtBQUEsQ0FBTSx1QkFBTjtBQURvQjs7QUFHckIsT0FBTyxDQUFDLE9BQVIsR0FBa0IsQ0FBQyxDQUFELEVBQUksQ0FBSixFQUFPLENBQVAiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIiwiZXhwb3J0cy5nZXQgPSAodXJsLCBjYWxsYmFjaykgLT5cbiAgICByZXF1ZXN0ID0gbmV3IFhNTEh0dHBSZXF1ZXN0KClcbiAgICByZXF1ZXN0Lm9wZW4oJ0dFVCcsIHVybCwgdHJ1ZSlcbiAgICByZXF1ZXN0LnJlc3BvbnNlVHlwZSA9ICdibG9iJ1xuXG4gICAgcHJpbnQgXCIxXCJcbiAgICByZXF1ZXN0Lm9ubG9hZCA9IC0+XG4gICAgICAgIHByaW50IFwibG9hZGluZ1wiXG4gICAgICAgIGlmIHJlcXVlc3Quc3RhdHVzID49IDIwMCBhbmQgcmVxdWVzdC5zdGF0dXMgPCA0MDBcbiAgICAgICAgICAgIHZpZGVvQmxvYiA9IHJlcXVlc3QucmVzcG9uc2VcbiAgICAgICAgICAgIHByaW50IFwiY29udmVydGluZyBibG9iXCJcbiAgICAgICAgICAgIHZpZCA9IFVSTC5jcmVhdGVPYmplY3RVcmwodmlkZW9CbG9iKVxuICAgICAgICAgICAgcHJpbnQgXCJmaW5pc2hlZCBjb252ZXJ0aW5nXCJcbiAgICAgICAgICAgIHZpZGVvLnNyYyA9IHZpZFxuXG4gICAgcmVxdWVzdC5vbmVycm9yID0gLT5cbiAgICAgICAgcHJpbnQgXCJlcnJvcjogXCIsIHJlcXVlc3Quc3RhdHVzVGV4dFxuICAgICAgICBjYWxsYmFjayh7c3RhdHVzOiBmYWxzZX0pXG5cblxuICAgIHJlcXVlc3Quc2VuZCgpIiwiIyBBZGQgdGhlIGZvbGxvd2luZyBsaW5lIHRvIHlvdXIgcHJvamVjdCBpbiBGcmFtZXIgU3R1ZGlvLiBcbiMgbXlNb2R1bGUgPSByZXF1aXJlIFwibXlNb2R1bGVcIlxuIyBSZWZlcmVuY2UgdGhlIGNvbnRlbnRzIGJ5IG5hbWUsIGxpa2UgbXlNb2R1bGUubXlGdW5jdGlvbigpIG9yIG15TW9kdWxlLm15VmFyXG5cbmV4cG9ydHMubXlWYXIgPSBcIm15VmFyaWFibGVcIlxuXG5leHBvcnRzLm15RnVuY3Rpb24gPSAtPlxuXHRwcmludCBcIm15RnVuY3Rpb24gaXMgcnVubmluZ1wiXG5cbmV4cG9ydHMubXlBcnJheSA9IFsxLCAyLCAzXSJdfQ==
