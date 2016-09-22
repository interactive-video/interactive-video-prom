# Made with Framer
# by Todd Hamilton
# www.toddham.com

# use ajax
# ajax = require "ajax"

# stack of scene indices
history = [0]

scenesActiveInPlayers = [0, 14, 15, -1]
# timestamps of scene starts in seconds
sceneStarts = [0,19.8,55.2,85.5,113.4,151.5,189.6,240.7,289.4,341,366.0,413.4,459,505,535.4,562.2,593.4,609.9,619.7,626.8,641, 668]

earlySceneLoads = [0, 14, 15, 10, 19, 20, 13, 18]
lateSceneLoads = [8, 16, 17, 5, 2, 12, 4,  7, 9, 3, 1, 6, 11]

# timestamp of choice starts in seconds
choiceStarts = [17,49,79,108,146,184,233,282,335,360,408,453,499,532,557,582,605,616,623,636,665]

# time ranges that trigger a "non-choice" selection
nonChoiceTimes = [[18.75, 18.99], [535.15, 535.39], [619.45, 619.69], [626.55, 626.79], [668, 668.49]]

# dictionary of choices with their starts and ends, and coordinates
# {scene number: [['startTime', 'endTime', 'xMin', 'xMax', 'yMin', 'yMax'],['startTime': ..],...]}
# for an end scene, choice skips to black screen and there are no valid buttons
choiceIcons = {
	0: [{'startTime': 17, 'endTime': 19.5, 'xMin': 460, 'xMax': 720, 'yMin': 170, 'yMax': 380, 'sceneLink': 14}],
	1: [{'startTime': 40, 'endTime': 54, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	2: [{'startTime': 79, 'endTime': 84, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	3: [{'startTime': 108, 'endTime': 113, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	4: [{'startTime': 146, 'endTime': 151, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	5: [{'startTime': 184, 'endTime': 189, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	6: [{'startTime': 233, 'endTime': 238, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	7: [{'startTime': 282, 'endTime': 287, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	8: [{'startTime': 335, 'endTime': 340, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	9: [{'startTime': 360, 'endTime': 365, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	10: [{'startTime': 408, 'endTime': 413, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	11: [{'startTime': 453, 'endTime': 458, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	12: [{'startTime': 499, 'endTime': 504, 'xMin': -1, 'xMax': -1, 'yMin': -1, 'yMax': -1, 'sceneLink': 0}],
	13: [{'startTime': 532, 'endTime': 535, 'xMin': 544, 'xMax': 775, 'yMin': 390, 'yMax': 620, 'sceneLink': 12}],
	14: [{'startTime': 557, 'endTime': 560, 'xMin': 180, 'xMax': 425, 'yMin': 60, 'yMax': 260, 'sceneLink': 19}, {'startTime': 560, 'endTime': 562, 'xMin': 440, 'xMax': 730, 'yMin': 200, 'yMax': 425, 'sceneLink': 10}],
	15: [{'startTime': 582, 'endTime': 587, 'xMin': 450, 'xMax': 680, 'yMin': 330, 'yMax': 600, 'sceneLink': 20}, {'startTime': 584, 'endTime': 588, 'xMin': 1050, 'xMax': 1210, 'yMin': 0, 'yMax': 175, 'sceneLink': 18}, {'startTime': 588, 'endTime': 588, 'xMin': 0, 'xMax': 220, 'yMin': 0, 'yMax': 200, 'sceneLink': 18}, {'startTime': 590, 'endTime': 593, 'xMin': 400, 'xMax': 1000, 'yMin': 280, 'yMax': 550, 'sceneLink': 13}],
	16: [{'startTime': 605, 'endTime': 609, 'xMin': 200, 'xMax': 306, 'yMin': 339, 'yMax': 407, 'sceneLink': 9}, {'startTime': 605, 'endTime': 609, 'xMin': 200, 'xMax': 306, 'yMin': 415, 'yMax': 500, 'sceneLink': 3}, {'startTime': 605, 'endTime': 609, 'xMin': 200, 'xMax': 306, 'yMin': 530, 'yMax': 605, 'sceneLink': 1}],
	17: [{'startTime': 616, 'endTime': 619, 'xMin': 374, 'xMax': 700, 'yMin': 286, 'yMax': 440, 'sceneLink': 6}],
	18:  [{'startTime': 623, 'endTime': 626, 'xMin': 0, 'xMax': 300, 'yMin': 0, 'yMax': 300, 'sceneLink': 7}],
	19:  [{'startTime': 636, 'endTime': 641, 'xMin': 0, 'xMax': 250, 'yMin': 0, 'yMax': 250, 'sceneLink': 8}, {'startTime': 636, 'endTime': 641, 'xMin': 550, 'xMax': 700, 'yMin': 0, 'yMax': 250, 'sceneLink': 16}, {'startTime': 636, 'endTime': 641, 'xMin': 0, 'xMax': 300, 'yMin': 0, 'yMax': 620, 'sceneLink': 17}],
	20: [{'startTime': 665, 'endTime': 669, 'xMin': 460, 'xMax': 722, 'yMin': 433, 'yMax': 700, 'sceneLink': 5}]	
}

# non-action scene links for each scene 
nonActionSceneLinks = [15,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,11,20,0,2]

# full scene links
sceneLinks = [[14,15,-1],
[-1,-1,-1],
[-1,-1,-1],
[-1,-1,-1],
[-1,-1,-1],
[-1,-1,-1],
[-1,-1,-1],
[-1,-1,-1],
[-1,-1,-1],
[-1,-1,-1],
[-1,-1,-1],
[-1,-1,-1],
[-1,-1,-1],
[12,4,-1],
[10,19,-1],
[20,13,18],
[9,3,1],
[6,11,-1],
[7,20,-1],
[8,16,17],
[5,2,-1]]


# setup a container to hold everything
videoContainer = new Layer
	width: 1320
	height: 750
	backgroundColor: 'black'
	shadowBlur: 2
	shadowColor: 'rgba(0,0,0,0.24)'
	
videoContainer.states.add
	loading:
		backgroundColor: 'blue'


# create the video layer
# make transparent until loading finishes
videoLayer = new VideoLayer
	x: 75
	width: 1160
	height: 650
	video: 'http://d3rcw0c7h4lwii.cloudfront.net/stabbing_CLIPCHAMP_480p.mp4'
	superLayer: videoContainer
	opacity: 1.0
	
childLayerOne = new VideoLayer
	x: 75
	width: 1160
	height: 650
	video: 'http://d3rcw0c7h4lwii.cloudfront.net/stabbing_CLIPCHAMP_480p.mp4'
	superLayer: videoContainer
	opacity: 0.0

childLayerOne.player.currentTime = sceneStarts[14]

childLayerTwo = new VideoLayer
	x: 75
	width: 1160
	height: 650
	video: 'http://d3rcw0c7h4lwii.cloudfront.net/stabbing_CLIPCHAMP_480p.mp4'
	superLayer: videoContainer
	opacity: 0.0
		
childLayerOne.player.currentTime = sceneStarts[15]

# center everything on screen
videoContainer.center()

# show load times
videoLayer.player.setAttribute('preload', 'auto')
childLayerOne.player.setAttribute('prelod', 'auto')
childLayerTwo.player.setAttribute('prelod', 'auto')

#load children in children players
lastEnds = []
currEnds = [0, 0, 0]
window.setInterval( -> 
	lastEnds = currEnds
	currEnds = [videoLayer.player.buffered.end(0), childLayerOne.player.buffered.end(0), childLayerTwo.player.buffered.end(0)]
	print "currEnds: ", currEnds
, 1000)

# 	# load first 10s for final clips and load full for starting clips 
# 	print "currScene: " + currLoadingScene + " end: " + currEnd+ " percent: " + Math.round(percPreLoaded)+ "%"
# 	if (currLoadingScene in earlySceneLoads and currEnd >= sceneStarts[currLoadingScene+1] - 1.0) or (currLoadingScene in lateSceneLoads and currEnd > sceneStarts[currLoadingScene] + 10.0)
# 		#print "finished loading segment"
# 		currLoadingScene = currLoadingScene + 1
# 		# got to end of whole video
# 		if currLoadingScene == sceneStarts.length - 1
# 			print "done loading"
# 			window.clearInterval(setIntervalID)
# 			# turn video on and reset to beginning
# 			videoLayer.player.currentTime = 0.0
# 			videoLayer.opacity = 1.0
# 		# jump to next buffer point
# 		else
# 			videoLayer.player.currentTime = Math.max(sceneStarts[currLoadingScene], currEnd)
# 			#currStart = videoLayer.player.currentTime
# 			#currEnd = videoLayer.player.currentTime
# # 		videoLayer.player.play()
# 	# continue advancing to prevent any stalls
# 	videoLayer.player.currentTime = currEnd
# , 200)

# WORKING - LOADS ALL IMPORTANT NODES
# currLoadingScene = 0
# lastEnd = 0
# currEnd = 0
# setIntervalID = window.setInterval( -> 
# 	lastEnd = currEnd
# 	currEnd = videoLayer.player.buffered.end(0)
# 
# 	percPreLoaded = (currLoadingScene + 1.0)/ sceneStarts.length * 100
# 	#print("LOADING: " + currLoadingScene + ", "+ Math.round(percPreLoaded) + "%")
# 	# load first 10s for final clips and load full for starting clips 
# 	print "currScene: " + currLoadingScene + " end: " + currEnd+ " percent: " + Math.round(percPreLoaded)+ "%"
# 	if (currLoadingScene in earlySceneLoads and currEnd >= sceneStarts[currLoadingScene+1] - 1.0) or (currLoadingScene in lateSceneLoads and currEnd > sceneStarts[currLoadingScene] + 10.0)
# 		#print "finished loading segment"
# 		currLoadingScene = currLoadingScene + 1
# 		# got to end of whole video
# 		if currLoadingScene == sceneStarts.length - 1
# 			print "done loading"
# 			window.clearInterval(setIntervalID)
# 			# turn video on and reset to beginning
# 			videoLayer.player.currentTime = 0.0
# 			videoLayer.opacity = 1.0
# 		# jump to next buffer point
# 		else
# 			videoLayer.player.currentTime = Math.max(sceneStarts[currLoadingScene], currEnd)
# 			#currStart = videoLayer.player.currentTime
# 			#currEnd = videoLayer.player.currentTime
# # 		videoLayer.player.play()
# 	# continue advancing to prevent any stalls
# 	videoLayer.player.currentTime = currEnd
# , 200)
	

# when the video is clicked
# videoLayer.on Events.Click, ->
# 	check if the player is paused
# 	if videoLayer.player.paused == true
# 		if true call the play method on the video layer
# 		videoLayer.player.play()
# 		playButton.image = 'images/pause.png'
# 	else
# 		else pause the video
# 		videoLayer.player.pause()
# 		playButton.image = 'images/play.png'
# 
# 	simple bounce effect on click
# 	playButton.scale = 1.15
# 	playButton.animate
# 		properties:
# 			scale:1
# 		time:0.1
# 		curve:'spring(900,30,0)'

# control bar to hold buttons and timeline
controlBar = new Layer
	width:500
	height:100
	backgroundColor:'rgba(0,0,0,0.75)'
	clip:false
	borderRadius:'8px'
	superLayer:videoContainer
	
# position control bar towards the bottom of the video
controlBar.y = videoContainer.maxY - controlBar.height
controlBar.x = 375


# play button
playButton = new Layer
	width:100
	height:100
	image:'images/play.png'
	superLayer:controlBar

# on/off volume button
volumeButton = new Layer
	width:100
	height:100
	image:'images/volume_on.png'
	superLayer:controlBar

# position the volume button to the right of play
volumeButton.x = playButton.maxX

# back-scene layer
backButton = new Layer
	width: 100
	height: 100
	image: 'images/back.png'
	superLayer: controlBar

# position back-scene button to the right of play
backButton.x = volumeButton.maxX

# skip to choice button
skipToChoiceButton = new Layer
	width: 100
	height: 100
	image: 'images/choose.png'
	superLayer: controlBar

# position back-scene button to the right of play
skipToChoiceButton.x = backButton.maxX

# home button
homeButton = new Layer
	width: 100
	height: 100
	image: 'images/home.png'
	superLayer: controlBar
	
# position home button to the right of choose
homeButton.x = skipToChoiceButton.maxX	

# forward-scene layer
forwardScene = new Layer
	width: 1320
	height: 620
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

	# check each button instance for current scene
	#print [0...choiceIcons[currScene].length]
	for buttonIndex in [0...choiceIcons[currScene].length]
		currButton = choiceIcons[currScene][buttonIndex]
		
		xMin = currButton['xMin']
		xMax = currButton['xMax']
		yMin = currButton['yMin']
		yMax = currButton['yMax']
		buttonStartTime = currButton['startTime']
		buttonEndTime = currButton['endTime']
		currTime = videoLayer.player.currentTime
	
		# print xMin, xMax, yMin, yMax, xCoord, yCoord
		
		# logic for button choice
		# was the button area pressed while the button was active?
		if xCoord >= xMin and xCoord <= xMax and yCoord >= yMin and yCoord <= yMax and currTime > buttonStartTime and currTime < buttonEndTime
			#print "pressed choice"
			nextScene = currButton['sceneLink']
			#history.push(nextScene)
			#print "next scene:", nextScene 
			
			videoLayer.player.currentTime = sceneStarts[nextScene]
			videoLayer.player.play()
		#videoLayer.player.fastSeek(sceneStarts[nextScene])

# Function to handle forward scene choice
forwardScene.on Events.Tap, (event) ->
	
	xCoord = event.point.x
	yCoord = event.point.y
	#print event.point
	
	# if a click occurs while buttons are active during scene, check if a button was clicked
	currTime = videoLayer.player.currentTime
	#print currTime
	if true in [Math.round(currTime) in  [Math.round(choiceStarts[x])... Math.round(sceneStarts[x+1])+1] for x in [0...sceneStarts.length-1]][0]
		#print "tapped during choice"
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
	
	#print history[history.length - 1] 
	
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
	#print choiceStarts[currScene]
	
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
	homeButton.scale = 1.15
	homeButton.animate
		properties:
			scale:1
		time:0.1
		curve:'spring(900,30,0)'
		
	history = [0]
		
# white timeline bar
# timeline = new Layer
# 	width:455
# 	height:40
# 	y:0
# 	x:0
# 	borderRadius:'10px'
# 	backgroundColor:'#fff'
# 	clip:false
# 	superLayer: videoContainer
# 
# # progress bar to indicate elapsed time
# progress = new Layer
# 	width:0
# 	height:timeline.height
# 	borderRadius:'10px'
# 	backgroundColor:'#03A9F4'
# 	superLayer: timeline
# 
# # scrubber to change current time
# scrubber = new Layer
# 	width:50
# 	height:50
# 	y:-4
# 	borderRadius:'50%'
# 	backgroundColor:'#fff'
# 	shadowBlur:10
# 	shadowColor:'rgba(0,0,0,0.75)'
# 	superLayer: timeline
# 
# # make scrubber draggable
# scrubber.draggable.enabled = true

# limit dragging along x-axis
# scrubber.draggable.speedY = 0
# 
# prevent scrubber from dragging outside of timeline
# scrubber.draggable.constraints =
# 	x:0
# 	y:timeline.midY
# 	width:timeline.width
# 	height:-10
# 
# Disable dragging beyond constraints
# scrubber.draggable.overdrag = false

# helper function for scene transitions
sceneUpdate = (currTime, targetScene) ->
	
	# is current scene different a new scene? 
	currScene = history[history.length - 1]
	if sceneStarts[targetScene] + 0.3  <= currTime  and currTime < sceneStarts[targetScene+1] - 0.3 and currScene != targetScene

		currScene = targetScene
		history.push(currScene)

		#print "lastScene: ", history[history.length - 2]
		#print "currScene: ", currScene
		#print "history: ", history

# Update the progress bar and scrubber AND CURR/LAST SCENE as video plays
videoLayer.player.addEventListener "timeupdate", ->
	#Calculate progress bar position
	# newPos = (timeline.width / videoLayer.player.duration) * videoLayer.player.currentTime

	#Update progress bar and scrubber
	# scrubber.x = newPos
	# progress.width = newPos	+ 10
	# check if it's time to play a choice icon
	#Update curr and last scene if scene has just switched
	currTime = videoLayer.player.currentTime
	sceneUpdate(currTime, scene) for scene in [0..sceneStarts.length]
	
	#advance to proper scene for a "non-choice"
	for nonChoiceRange in nonChoiceTimes
		if currTime >= nonChoiceRange[0] and currTime <= nonChoiceRange[1]
			currScene = history[history.length - 1]
			nonActionNextScene = nonActionSceneLinks[currScene]
			videoLayer.player.currentTime = sceneStarts[nonActionNextScene]
			videoLayer.player.play()

# Pause the video at start of drag
# scrubber.on Events.DragStart, ->
# 	videoLayer.player.pause()
# 
# Update Video Layer to current frame when scrubber is moved
# scrubber.on Events.DragMove, ->
# 	progress.width = scrubber.x + 10
# 
# When finished dragging set currentTime and play video
# scrubber.on Events.DragEnd, ->
# 	newTime = Utils.round(videoLayer.player.duration * (scrubber.x / timeline.width),0);
# 	videoLayer.player.currentTime = newTime
# 	videoLayer.player.play()
# 	playButton.image = "images/pause.png"

