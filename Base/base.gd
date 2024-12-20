extends Node3D

@export var MAX_HEALTH: int = 6

var RED: Color = Color.DARK_RED
var WHITE: Color = Color.WHITE_SMOKE
var blended_color

var current_health: int:
	set(health_in):
		current_health = health_in
		print("health was changed")
		label_3d.text = str(current_health) + "/" + str(MAX_HEALTH)
		label_3d.modulate = RED.lerp(WHITE, float(current_health) / float(MAX_HEALTH))
		if current_health < 1:
			get_tree().reload_current_scene()
	
	
	
	
@onready var label_3d: Label3D = $Label3D

func _ready() -> void:
	current_health = MAX_HEALTH
	

func take_damage() -> void:
	print("damage dealt to base! ")
	self.current_health -= 1
	
