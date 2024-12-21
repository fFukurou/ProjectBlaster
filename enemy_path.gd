extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: Node
@export var victory_layer: CanvasLayer

@onready var spawn_timer: Timer = $SpawnTimer

# connected to timeout, in other words, this function will get called every 2 seconds
func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	new_enemy.max_health = difficulty_manager.get_enemy_health()
	self.add_child(new_enemy)
	spawn_timer.wait_time = difficulty_manager.get_spawn_time()
	new_enemy.tree_exited.connect(enemy_defeated)


func _on_difficulty_manager_stop_spawning_enemies() -> void:
	spawn_timer.stop()

func enemy_defeated() -> void:
	if spawn_timer.is_stopped():
			for child in self.get_children():
				if child is PathFollow3D:
					return
			print("You won!")
			victory_layer.visible = true
