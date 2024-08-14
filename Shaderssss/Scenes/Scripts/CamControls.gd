extends CharacterBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity.z = -Input.get_action_strength("Forward") + Input.get_action_strength("Backward")
	rotation.y += (-Input.get_action_strength("Left") + Input.get_action_strength("Right")) * 0.15
	move_and_slide()
