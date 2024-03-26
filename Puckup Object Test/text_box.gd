extends Node3D

@onready var label := $Label3D

var lettuce = false
var cheese = false
var tomato = false
var ketchup = false

func _ready():
	label.text = 'I want a burger\n'
	if lettuce == true:
		label.text += 'with Lettuce\n'
	if cheese == true:
		label.text += 'with Cheese\n'
	if tomato == true:
		label.text += 'with Tomato\n'
	if ketchup == true:
		label.text += 'with Ketchup\n'
	label.text += 'please!'

func _on_burger_burger_lettuce_emit():
	lettuce = true
func _on_burger_burger_cheese_emit():
	cheese = true
func _on_burger_burger_tomato_emit():
	tomato = true
func _on_burger_burger_ketchup_emit():
	ketchup = true
