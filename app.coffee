# Made with Framer
# by Todd Hamilton
# www.toddham.com

# stack of scene indices
history = [0]

# timestamps of scene starts in seconds
sceneStarts = [0, 31.5, 51.8, 93.5, 123.5, 165.8, 198.9, 1000]

# scene descriptions 
# [go on date?, yes, pay half, no don't pay - go to park?,yes to park, no to park]

# timestamp of choice starts in seconds
choiceStarts = [24, 48, 84, 121, 160, 194, 220]

# choice button coords [button left: [[xMin, xMax], [yMin, yMax]], button right: ...]
normalChooseCoords = [[[58, 207], [352, 377]], [[468, 584], [352, 377]]]
tallChooseCoords = [[[58, 207], [330, 390]], [[448, 584], [310, 390]]]
goToBeginningChooseCords = [[[58, 207], [352, 377]], [[-1, -1], [-1, -1]]]

# which scene links to which scene 
# [[0's left scene #, 0's right scene #], [1's left scene #, 1's right scene #],....]
sceneLinks = [[1, 3], [2, 4], [0, 0], [5, 6], [5, 6], [0, 0], [0, 0]]

# choose button coords for all scenes
chooseCoords = [
	normalChooseCoords,
	tallChooseCoords,
	goToBeginningChooseCords,
	normalChooseCoords,
	normalChooseCoords,
	goToBeginningChooseCords,
	goToBeginningChooseCords
]

# setup a container to hold everything
videoContainer = new Layer
	width: 640
	height: 360
	backgroundColor: '#fff'
	shadowBlur: 2
	shadowColor: 'rgba(0,0,0,0.24)'

# create the video layer
videoLayer = new VideoLayer
	width: 640
	height: 360
	video: "images/dating_small_2.m4v"
	superLayer: videoContainer

# center everything on screen
videoContainer.center()

videoLayer.player.setAttribute('preload', 'auto')
window.setInterval( -> 
	print videoLayer.player.buffered.start(0)
	print videoLayer.player.buffered.end(0)
, 1000)

# when the video is clicked
videoLayer.on Events.Click, ->
	# check if the player is paused
	if videoLayer.player.paused == true
		# if true call the play method on the video layer
		videoLayer.player.play()
		playButton.image = 'images/pause.png'
	else
		# else pause the video
		videoLayer.player.pause()
		playButton.image = 'images/play.png'

	# simple bounce effect on click
	playButton.scale = 1.15
	playButton.animate
		properties:
			scale:1
		time:0.1
		curve:'spring(900,30,0)'

# control bar to hold buttons and timeline
controlBar = new Layer
	width:videoLayer.width - 448
	height:48
	backgroundColor:'rgba(0,0,0,0.75)'
	clip:false
	borderRadius:'8px'
	superLayer:videoContainer

# center the control bar
controlBar.center()

# position control bar towards the bottom of the video
controlBar.y = videoLayer.maxY - controlBar.height - 10

# play button
playButton = new Layer
	width:48
	height:48
	image:'images/play.png'
	superLayer:controlBar

# on/off volume button
volumeButton = new Layer
	width:48
	height:48
	image:'images/volume_on.png'
	superLayer:controlBar

# position the volume button to the right of play
volumeButton.x = playButton.maxX

# back-scene layer
backButton = new Layer
	width: 48
	height: 48
	image: 'images/back.png'
	superLayer: controlBar

# position back-scene button to the right of play
backButton.x = volumeButton.maxX

# skip to choice button
skipToChoiceButton = new Layer
	width: 48
	height: 48
	image: 'images/choose.png'
	superLayer: controlBar

# position back-scene button to the right of play
skipToChoiceButton.x = backButton.maxX

# home button
homeButton = new Layer
	width: 48
	height: 48
	image: 'images/home.png'
	superLayer: controlBar
	
# position home button to the right of choose
homeButton.x = skipToChoiceButton.maxX	

# forward-scene layer
forwardScene = new Layer
	width: 640
	height: 300
	#video: "images/morning.mp4"
	superLayer: videoContainer
	backgroundColor: ""

# Function to handle play/pause button
playButton.on Events.Click, ->
	if videoLayer.player.paused == true
		videoLayer.player.play()
		playButton.image = "images/pause.png"
	else
		videoLayer.player.pause()
		playButton.image = "images/play.png"

	# simple bounce effect on click
	playButton.scale = 1.15
	playButton.animate
		properties:
			scale: 1
		time: 0.1
		curve: 'spring(900,30,0)'

# helper function for figuring out if a scene choose button is being pressed
sceneChooseButtonChecker = (xCoord, yCoord) ->
	currScene = history[history.length - 1]

	chooseLeft = chooseCoords[currScene][0]
	chooseLeftX = chooseLeft[0]
	chooseLeftY = chooseLeft[1]

	chooseRight = chooseCoords[currScene][1]
	chooseRightX = chooseRight[0]
	chooseRightY = chooseRight[1]
	
	# logic for left button choice
	if xCoord >= chooseLeftX[0] and xCoord <= chooseLeftX[1] and yCoord >= chooseLeftY[0] and yCoord <= chooseLeftY[1]
		print "pressed left"
		currScene = history[history.length - 1]
		nextScene = sceneLinks[currScene][0]
		#history.push(nextScene)
		
		videoLayer.player.currentTime = sceneStarts[nextScene]
		videoLayer.player.play()
	#videoLayer.player.fastSeek(sceneStarts[nextScene])

	# logic for right button choice
	else if xCoord >= chooseRightX[0] and xCoord <= chooseRightX[1] and yCoord >= chooseRightY[0] and yCoord <= chooseRightY[1]
		print "pressed right"
		currScene = history[history.length - 1]
		nextScene = sceneLinks[currScene][1]
		#history.push(nextScene)
		
		videoLayer.player.currentTime = sceneStarts[nextScene]
		videoLayer.player.play()
		#videoLayer.player.fastSeek(sceneStarts[nextScene])

# Function to handle forward scene choice
forwardScene.on Events.Tap, (event) ->
	
	xCoord = event.point.x
	yCoord = event.point.y
	print videoLayer.player.currentTime
	# if a click occurs while buttons are active during scene, check if a button was clicked
	if true in [Math.round(videoLayer.player.currentTime) in  [Math.round(x)-11.. Math.round(x)] for x in sceneStarts][0]
		sceneChooseButtonChecker(xCoord, yCoord)

# Volume on/off toggle
volumeButton.on Events.Click, ->
	if videoLayer.player.muted == false
		videoLayer.player.muted = true
		volumeButton.image = "images/volume_off.png"
	else
		videoLayer.player.muted = false
		volumeButton.image = "images/volume_on.png"

	# simple bounce effect on click
	volumeButton.scale = 1.15
	volumeButton.animate
		properties:
			scale:1
		time:0.1
		curve:'spring(900,30,0)'

# Function to handle back button
backButton.on Events.Click, ->
	history.pop()
	if (history.length == 0)
		history.push(0)
	
	print history[history.length - 1] 
	
	videoLayer.player.currentTime = choiceStarts[history[history.length - 1]]

	videoLayer.player.play()
		#videoLayer.player.fastSeek(choiceStarts[history[history.length - 1]])

	# simple bounce effect on click
	backButton.scale = 1.15
	backButton.animate
		properties:
			scale:1
		time:0.1
		curve:'spring(900,30,0)'

# Function to handle choose button
skipToChoiceButton.on Events.Click, ->
	currScene = history[history.length - 1]
	print choiceStarts[currScene]
	
	videoLayer.player.currentTime = choiceStarts[currScene]
	videoLayer.player.play()
	#videoLayer.player.fastSeek(choiceStarts[currScene])

	# simple bounce effect on click
	skipToChoiceButton.scale = 1.15
	skipToChoiceButton.animate
		properties:
			scale:1
		time:0.1
		curve:'spring(900,30,0)'

# Function to handle home button
homeButton.on Events.Click, ->
	videoLayer.player.currentTime = 0
	videoLayer.player.play()
	#videoLayer.player.fastSeek(0)

	# simple bounce effect on click
	skipToChoiceButton.scale = 1.15
	skipToChoiceButton.animate
		properties:
			scale:1
		time:0.1
		curve:'spring(900,30,0)'
		
	history = [0]
		
# white timeline bar
timeline = new Layer
	width:455
	height:10
	y:backButton.midY - 5
	x:backButton.maxX + 10
	borderRadius:'10px'
	backgroundColor:'#fff'
	clip:false
	#superLayer: controlBar

# progress bar to indicate elapsed time
progress = new Layer
	width:0
	height:timeline.height
	borderRadius:'10px'
	backgroundColor:'#03A9F4'
	superLayer: timeline

# scrubber to change current time
scrubber = new Layer
	width:18
	height:18
	y:-4
	borderRadius:'50%'
	backgroundColor:'#fff'
	shadowBlur:10
	shadowColor:'rgba(0,0,0,0.75)'
	superLayer: timeline

# make scrubber draggable
scrubber.draggable.enabled = true

# limit dragging along x-axis
scrubber.draggable.speedY = 0

# prevent scrubber from dragging outside of timeline
scrubber.draggable.constraints =
	x:0
	y:timeline.midY
	width:timeline.width
	height:-10

# Disable dragging beyond constraints
scrubber.draggable.overdrag = false

# helper function for scene transitions
sceneUpdate = (currTime, targetScene) ->
	
	currScene = history[history.length - 1]
	if sceneStarts[targetScene] + 0.3  <= currTime  and currTime < sceneStarts[targetScene+1] - 0.3 and currScene != targetScene

		currScene = targetScene
		history.push(currScene)

		#print "lastScene: ", history[history.length - 2]
		#print "currScene: ", currScene
		print "history: ", history

# Update the progress bar and scrubber AND CURR/LAST SCENE as video plays
videoLayer.player.addEventListener "timeupdate", ->
	# Calculate progress bar position
	newPos = (timeline.width / videoLayer.player.duration) * videoLayer.player.currentTime

	# Update progress bar and scrubber
	scrubber.x = newPos
	progress.width = newPos	+ 10

	# Update curr and last scene if scene has just switched
	currTime = videoLayer.player.currentTime
	sceneUpdate(currTime, scene) for scene in [0..sceneStarts.length]

# Pause the video at start of drag
scrubber.on Events.DragStart, ->
	videoLayer.player.pause()

# Update Video Layer to current frame when scrubber is moved
scrubber.on Events.DragMove, ->
	progress.width = scrubber.x + 10

# When finished dragging set currentTime and play video
scrubber.on Events.DragEnd, ->
	newTime = Utils.round(videoLayer.player.duration * (scrubber.x / timeline.width),0);
	videoLayer.player.currentTime = newTime
	videoLayer.player.play()
	playButton.image = "images/pause.png"

