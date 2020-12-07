extends Node


class_name Enums


enum PLAYER_STATE{
	IDLE,		# Regular states
	RUNNING,
	JUMPING,
	FALLING,
	LANDING,
	DEAD,
	FLOATING,	#Power-up states
	DASHING,
	THROWING,
	PHASING,
	PUSHING,
	PULLING,
}


enum FIRING_DIRECTIONS{
	UP, 
	RIGHT, 
	DOWN, 
	LEFT,
}


enum SCREENS{
	MAIN_MENU,
	HOWTOPLAY,
	CREDITS,
	TEMPLATE,
	INTRO,
	END,
}


enum POWERS{
	PUCK_DASH,
	IO_PHASE,
	PHOBOS_STRENGTH,
	TITAN_PLATFORMS,
}
