extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: Node
@export var victory_layer: CanvasLayer

@onready var slap_1: AudioStreamPlayer = %slap1
@onready var slap_2: AudioStreamPlayer = %slap2
@onready var slap_3: AudioStreamPlayer = %slap3
@onready var slap_4: AudioStreamPlayer = %slap4

@onready var death_sound: AudioStreamPlayer = $DeathSound



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
	randomize()
	var random_number = randi_range(1,4)
	play_damage_sound(random_number)
	death_sound.play()
	if spawn_timer.is_stopped():
			for child in self.get_children():
				if child is PathFollow3D:
					return
			print("You won!")
			victory_layer.victory()


func play_damage_sound(number: int):
	if number == 1:
		slap_1.play()
	elif number == 2:
		slap_2.play()
	elif number == 3:
		slap_3.play()
	elif number == 4:
		slap_4.play()
