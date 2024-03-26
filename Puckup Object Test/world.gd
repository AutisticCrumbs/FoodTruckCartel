extends Node3D

@onready var burger_patty = $"Burger/BurgerPatty"
@onready var cut_lettuce = $"Burger/CutLettuce"
@onready var cut_tomato = $"Burger/CutTomato"
@onready var cut_cheese = $"Burger/CutCheese"
@onready var ketchup = $Burger/Ketchup
@onready var top_bun = $"Burger/TopBun"

signal order_label

var dialogue_shown = false

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_ingredient_checker_body_entered(body):
	if body.has_method("is_order_correct"):
		body.is_order_correct()

func _on_stovetop_body_entered(body):
	if body.has_method("cook"):
		body.cook()

func _on_cutting_area_body_entered(body):
	if body.has_method("cut_lettuce"):
		body.cut_lettuce()
	if body.has_method("cut_tomato"):
		body.cut_tomato()
	if body.has_method("cut_cheese"):
		body.cut_cheese()
