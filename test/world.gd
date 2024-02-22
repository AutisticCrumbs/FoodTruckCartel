extends Node3D

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("force_quit"):
		get_tree().quit()
