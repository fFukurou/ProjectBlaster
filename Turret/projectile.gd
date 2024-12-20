extends Area3D



var direction := Vector3.FORWARD

@export var speed := 30.0
@onready var timer: Timer = $Timer


func _physics_process(delta: float) -> void:
	self.position += direction * speed * delta


func _on_timer_timeout() -> void:
	self.queue_free()
	#print("Pr ojectile Destroyed")
