extends Node3D

signal burger_cooking

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_stovetop_body_entered(body):
	if body.has_method("cook"):
		body.cook()
