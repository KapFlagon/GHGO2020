extends RigidBody2D

var picked = false
var originalspeed
var originaljump
var visible_by_player: bool = false setget set_visible_by_player, is_visible_by_player

func _ready():
	originalspeed = get_node("../Player").base_movement_speed
	originaljump = get_node("../Player").jump_force

func _physics_process(delta):
	if is_visible_by_player():
		if picked == true:
			self.position = get_node("../Player/Position2D").global_position
			get_node("../Player").base_movement_speed = originalspeed/6  # Slow down due to box
			get_node("../Player").jump_force = originaljump/1.5  # Jump reduction due to box
			sleeping = true
		else:
			sleeping = false
			get_node("../Player").base_movement_speed = originalspeed
			get_node("../Player").jump_force = originaljump

func _input(event):
	if is_visible_by_player():
		if PowerManager.is_phobos_equipped():
			if Input.is_action_just_pressed("phobosInteract") and picked == false:
				var bodies = $Detector.get_overlapping_bodies()
				for b in bodies:
					if b.name == "Player":
						picked = true
						get_node("../Player/Camera2D/PlayerHud")._on_phobosAbilityManager_power_triggered(true)
			elif Input.is_action_just_pressed("phobosInteract") and Input.is_action_pressed("ui_down") and picked == true:
				picked = false
				get_node("../Player/Camera2D/PlayerHud")._on_phobosAbilityManager_power_triggered(false)
				if get_node("../Player/Sprite").flip_h == false:
					apply_impulse(Vector2(), Vector2(50, 0))
				else:
					apply_impulse(Vector2(), Vector2(-50, 0))
			elif Input.is_action_just_pressed("phobosInteract") and Input.is_action_pressed("ui_up") and picked == true:
				picked = false
				get_node("../Player/Camera2D/PlayerHud")._on_phobosAbilityManager_power_triggered(false)
				apply_impulse(Vector2(), Vector2(0, -100))
			elif Input.is_action_just_pressed("phobosInteract") and picked == true:
				picked = false
				get_node("../Player/Camera2D/PlayerHud")._on_phobosAbilityManager_power_triggered(false)
				if get_node("../Player/Sprite").flip_h == false:
					apply_impulse(Vector2(), Vector2(200, -50))
				else:
					apply_impulse(Vector2(), Vector2(-200, -50))

#func _input(event):
#	if Input.is_action_just_pressed("phobosInteract"):
#		var bodies = $Detector.get_overlapping_bodies()  # BUG HERE! Press 'e' away from object to trigger
#		for b in bodies:
#			#if b.name == "Player" and get_node("../Player").can_pick == true:
#			if b.name == "Player":
#				picked = true
#				#get_node("../Player").can_pick = false
#	if Input.is_action_just_pressed("drop") and picked == true:
#		picked = false
#		#get_node("../Player").can_pick = true
#	if Input.is_action_just_pressed("throw") and picked == true:
#		#print("throw")
#		picked = false
#		#get_node("../Player").can_pick = true
#		#apply_impulse(Vector2(), Vector2(200, -50))
#		if get_node("../Player/Sprite").flip_h == false:
#			apply_impulse(Vector2(), Vector2(200, -50))
#		else:
#			apply_impulse(Vector2(), Vector2(-200, -50))


func set_visible_by_player(new_value: bool) -> void:
	visible_by_player = new_value


func is_visible_by_player() -> bool:
	return visible_by_player


func _on_VisibilityEnabler2D_screen_entered() -> void:
	set_visible_by_player(true)


func _on_VisibilityEnabler2D_screen_exited() -> void:
	set_visible_by_player(false)
