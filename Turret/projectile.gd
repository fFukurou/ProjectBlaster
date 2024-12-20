extends Area3D



var direction := Vector3.FORWARD

@export var speed := 30.0
@onready var timer: Timer = $Timer


func _physics_process(delta: float) -> void:
	self.position += direction * speed * delta


func _on_timer_timeout() -> void:
	self.queue_free()
	#print("Pr ojectile Destroyed")


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		#print(area)
		area.get_parent().current_health -= 25 # area.get_parent() results in accessing the Enemy Node, which actually has the current_health variable
		self.queue_free()	
