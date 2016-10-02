activePlayerIndex = 0
offSetBetweenPOV = 225.5
intermediaryStage = false
timeCompensationPerSwitch = 0.3

# setup a container to hold everything
videoContainer = new Layer
	width: 1320
	height: 750
	backgroundColor: 'black'
	shadowBlur: 2
	shadowColor: 'rgba(0,0,0,0.24)'
	opacity: 1.0

# create the video layer
# make transparent until loading finishes
videoLayerOne = new VideoLayer
	width: 1320
	height: 750
	video: 'http://d3rcw0c7h4lwii.cloudfront.net/prom.mp4'
	superLayer: videoContainer

videoLayerTwo = new VideoLayer
	width: 1320
	height: 750
	video: 'http://d3rcw0c7h4lwii.cloudfront.net/prom.mp4'
	superLayer: videoContainer

# initialize video players
videoLayerOne.player.setAttribute('preload', 'auto')
videoLayerTwo.player.setAttribute('preload', 'auto')
videoLayerTwo.player.currentTime = offSetBetweenPOV
videoLayerOne.player.currentTime = 1.0
currPlayer = videoLayerOne
videoLayerTwo.player.muted = true
videoLayerOne.bringToFront()

thumbnailLayer = new Layer
	width: 1320
	height: 750
	image: "images/thumbnail_prom.png"
	superLayer: videoContainer
	opacity: 1.0

thumbnailLayer.bringToFront()

# keep POV switch loaded
window.setInterval( ->
	print "player one: ", videoLayerOne.player.currentTime, "player two: ", videoLayerTwo.player.currentTime, 
	# keep 2nd player loaded if 1st is active
	if activePlayerIndex == 0 and !intermediaryStage
		if videoLayerTwo.player.currentTime <= videoLayerOne.player.currentTime + offSetBetweenPOV - 2.0 or videoLayerTwo.player.currentTime >= videoLayerOne.player.currentTime + 2.0 + offSetBetweenPOV
			print "updating player two"
			videoLayerTwo.player.currentTime = videoLayerOne.player.currentTime + offSetBetweenPOV
		
	# keep 1st player loaded if 2nd is active
	if activePlayerIndex == 1 and !intermediaryStage
		if videoLayerOne.player.currentTime <= videoLayerTwo.player.currentTime - offSetBetweenPOV - 2.0 or videoLayerOne.player.currentTime >= videoLayerTwo.player.currentTime - offSetBetweenPOV + 2.0
			print "updating player one"
			videoLayerOne.player.currentTime = videoLayerTwo.player.currentTime - offSetBetweenPOV

	# check if video is at end
	if (currPlayer.player.currentTime >= 228.5 and currPlayer.player.currentTime <= 230) and !intermediaryStage
		print "video at end: ", currPlayer.player.currentTime
		videoLayerOne.player.pause()
		videoLayerTwo.player.pause()
		playButton.image = "images/play.png"
		
	if currPlayer.player.currentTime >= 450 
		switchPOV(videoLayerTwo, videoLayerOne, 228.5)
, 500)

# center everything on screen
videoContainer.center()

# control bar to hold buttons
controlBar = new Layer
	width:100
	height:100
	backgroundColor:''
	clip:false
	borderRadius:'8px'
	superLayer:videoContainer
	opacity: 1.0
	
# position control bar towards the bottom of the video
controlBar.y = videoContainer.maxY - controlBar.height
controlBar.x = videoContainer.width/2.0 - controlBar.width/2.0

# play button
playButton = new Layer
	width:100
	height:100
	image:'images/play.png'
	superLayer:controlBar

# forward-scene layer
forwardScene = new Layer
	width: 1320
	height: 620
	#video: "images/morning.mp4"
	superLayer: videoContainer
	backgroundColor: ""

# Function to handle play/pause button
playButton.on Events.Click, ->
	thumbnailLayer.opacity = 0.0
	if currPlayer.player.paused == true
		videoLayerOne.player.play()
		videoLayerTwo.player.play()
		playButton.image = "images/pause.png"
	else
		videoLayerOne.player.pause()
		videoLayerTwo.player.pause()
		playButton.image = "images/play.png"

	# simple bounce effect on click
	playButton.scale = 1.15
	playButton.animate
		properties:
			scale: 1
		time: 0.1
		curve: 'spring(900,30,0)'

# Function to handle forward scene choice
forwardScene.on Events.Tap, (event) ->
	
	xCoord = event.point.x
	yCoord = event.point.y
	
	currTime = currPlayer.player.currentTime
	print xCoord, yCoord, currTime
	
	# clicked to switch while on player one 
	if xCoord >= 1200 and yCoord >= 250 and yCoord <= 315 and activePlayerIndex == 0
		switchPOV(videoLayerOne, videoLayerTwo, offSetBetweenPOV + currTime - timeCompensationPerSwitch)
		activePlayerIndex = 1
		
	# clicked to switch while on player two 
	if xCoord >= 1200 and yCoord >= 375 and yCoord <= 450 and activePlayerIndex == 1
		switchPOV(videoLayerTwo, videoLayerOne, currTime - offSetBetweenPOV - timeCompensationPerSwitch)
		activePlayerIndex = 0
		
	# reached end of video. offer playthrough with switched POV
	if xCoord >= 600 and xCoord <= 700 and yCoord >= 300 and yCoord <= 400 
		if currTime >= 226 and currTime <= currTime <230
			switchPOV(videoLayerOne, videoLayerTwo, 232.75)
			activePlayerIndex = 1
		if  currTime > 450
			switchPOV(videoLayerTwo, videoLayerOne, 7)
			activePlayerIndex = 0

switchPOV = (oldPlayer, newPlayer, newTime) ->
		oldPlayer.player.muted = true
		oldPlayer.player.paused = true
		intermediaryStage = true
		newPlayer.player.currentTime = newTime
		newPlayer.player.play()
		setUpNextPlayer = window.setInterval( ->
			if newPlayer.player.currentTime > newTime and newPlayer.player.currentTime < newTime + 1.0
				newPlayer.placeBefore(oldPlayer)
				newPlayer.player.muted = false
				currPlayer = newPlayer
				intermediaryStage = false
				window.clearInterval(setUpNextPlayer)
		, 100)
		print " new time: ", newTime

	
#white timeline bar
timeline = new Layer
	width:videoContainer.width
	height:40
	y:0
	x:0
	borderRadius:'10px'
	backgroundColor:'#fff'
	clip:false
	superLayer: videoContainer
	
timeline.bringToFront()

# progress bar to indicate elapsed time
progress = new Layer
	width:0
	height:timeline.height
	borderRadius:'10px'
	backgroundColor:'#03A9F4'
	superLayer: timeline

#scrubber to change current time
scrubber = new Layer
	width:50
	height:50
	y:-4
	borderRadius:'50%'
	backgroundColor:'#fff'
	shadowBlur:10
	shadowColor:'rgba(0,0,0,0.75)'
	superLayer: timeline

# make scrubber draggable
scrubber.draggable.enabled = true

#limit dragging along x-axis
scrubber.draggable.speedY = 0

#prevent scrubber from dragging outside of timeline
scrubber.draggable.constraints =
	x:0
	y:timeline.midY
	width:timeline.width
	height:-10

#Disable dragging beyond constraints
scrubber.draggable.overdrag = false


#Update the progress bar and scrubber AND CURR/LAST SCENE as video plays
currPlayer.player.addEventListener "timeupdate", ->

	#Calculate progress bar position
	newPos = (timeline.width / currPlayer.player.duration) * currPlayer.player.currentTime
	#Update progress bar and scrubber
	scrubber.x = newPos
	progress.width = newPos	+ 10


# Pause the video at start of drag
scrubber.on Events.DragStart, ->
	currPlayer.player.pause()

#Update Video Layer to current frame when scrubber is moved
scrubber.on Events.DragMove, ->
	progress.width = scrubber.x + 10

#When finished dragging set currentTime and play video
scrubber.on Events.DragEnd, ->
	newTime = Utils.round(currPlayer.player.duration * (scrubber.x / timeline.width),0);
	currPlayer.player.currentTime = newTime
	currPlayer.player.play()
	playButton.image = "images/pause.png"

