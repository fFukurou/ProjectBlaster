extends PathFollow3D

@export var speed: float = 2.5

@onready var base = get_tree().get_first_node_in_group("base")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.progress += delta * speed
	if self.progress_ratio == 1.0:
		base.take_damage()
		set_process(false)
