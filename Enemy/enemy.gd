extends PathFollow3D

@export var speed: float = 2.5
@export var max_health: int = 50
@export var gold_value: int = 15
@onready var slap_1: AudioStreamPlayer = %slap1
@onready var slap_2: AudioStreamPlayer = %slap2
@onready var slap_3: AudioStreamPlayer = %slap3
@onready var slap_4: AudioStreamPlayer = %slap4


var current_health: int:
	set(health_in):
		randomize()
		if health_in < current_health:
			animation_player.play("TakeDamage")
			var random_slap = randi_range(1, 4)
			play_damage_sound(random_slap)
			
		current_health = health_in
		if current_health < 1:
			bank.gold += gold_value
			self.queue_free()
			
		

@onready var base = get_tree().get_first_node_in_group("base")
@onready var bank = get_tree().get_first_node_in_group("bank") # This needs to be an @onready variable, because it needs to get the path to the tree when the enemy is created!
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.progress += delta * speed
	if self.progress_ratio == 1.0:
		base.take_damage()
		set_process(false)
		queue_free()
		
	if current_health <= 0:
		self.queue_free()
	

func play_damage_sound(number: int):
	if number == 1:
		slap_1.play()
	elif number == 2:
		slap_2.play()
	elif number == 3:
		slap_3.play()
	elif number == 4:
		slap_4.play()
