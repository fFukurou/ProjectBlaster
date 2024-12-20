extends Path3D

@export var enemy_scene: PackedScene

# connected to timeout, in other words, this function will get called every 2 seconds
func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	self.add_child(new_enemy)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
