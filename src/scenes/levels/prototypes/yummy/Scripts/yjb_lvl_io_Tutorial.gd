extends BaseLevel


func _ready():
	PowerManager.reset_all_equippment()
	set_level_screen_value(Enums.SCREENS.YJB_LVL_IO_TUTORIAL)
	.initialize_level()
