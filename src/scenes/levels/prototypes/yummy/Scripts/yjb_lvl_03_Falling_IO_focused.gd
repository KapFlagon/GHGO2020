extends BaseLevel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	MusicManager.play_song("res://assets/music/Godot_Slurp_Master1.ogg")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.s
#func _process(delta):
#	pass


func _on_Button_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()
