# video container
videoContainer = new Layer
	width:640
	height:360
	backgroundColor:'#fff'
	shadowBlur:2
	shadowColor:'rgba(0,0,0,0.24)'

# center everything on screen	
videoContainer.center()
	
# create the video layer
videoLayer = new VideoLayer
	width: 640
	height: 360
	video: "images/All.mov"
	superLayer: videoContainer

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

#time given for the choice in seconds
choiceTimer = 10

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