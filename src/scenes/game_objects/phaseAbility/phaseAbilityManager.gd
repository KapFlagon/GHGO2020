extends Node

var playerScene 
var particles 


# Called when the node enters the scene tree for the first time.
func _ready():
	playerScene = get_parent()
	particles =  preload("res://src/scenes/game_objects/phaseAbility/PhasingParticle.tscn").instance()


func checkActionButtonPressed():
	if Input.is_action_just_pressed("action_phase"):
		if(playerScene.get_collision_mask_bit(2) ):
			playerScene.set_collision_mask_bit(2,false)
			activateParticles()
		else:
			playerScene.set_collision_mask_bit(2,true)
			deactivateParticles()
			
func activateParticles():
	playerScene.add_child(particles) # They have a very high Z position, so being buried would not be a problem
	particles.set_emitting(true)

func deactivateParticles():
	particles.set_emitting(false)

