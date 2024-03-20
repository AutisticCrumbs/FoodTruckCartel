extends Node3D

@onready var burger_patty = $"Burger/Burger Patty"
@onready var cut_lettuce = $"Burger/Cut Lettuce"

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_ingredient_checker_body_entered(_body):
	check_ingredients()

func check_ingredients():
	print('This burger has a:')
	if burger_patty.is_visible_in_tree() == true:
		print('patty')
	if cut_lettuce.is_visible_in_tree() == true:
		print('lettuce')

func _on_stovetop_body_entered(body):
	if body.has_method("cook"):
		body.cook()

func _on_cutting_area_body_entered(body):
	if body.has_method("cut_lettuce"):
		body.cut_lettuce()

