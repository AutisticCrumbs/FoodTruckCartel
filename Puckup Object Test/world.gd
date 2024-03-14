extends Node3D

@onready var burger = $Burger
@onready var patty = $Patty
@onready var burger_patty = $"Burger/Burger Patty"

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_stovetop_body_entered(body):
	if body.has_method("cook"):
		body.cook()

func _on_connect_point_body_entered(body):
	if body is RigidBody3D and !body.is_in_group('burger'):
		if body.food_cooked == true:
			patty.queue_free()
			burger_patty.show()
