exports.get = (url, callback) ->
    request = new XMLHttpRequest()
    request.open('GET', url, true)
    request.responseType = 'blob'

    print "1"
    request.onload = ->
        print "loading"
        if request.status >= 200 and request.status < 400
            videoBlob = request.response
            print "converting blob"
            vid = URL.createObjectUrl(videoBlob)
            print "finished converting"
            video.src = vid

    request.onerror = ->
        print "error: ", request.statusText
        callback({status: false})


    request.send()