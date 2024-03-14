extends RigidBody3D

var food_cooked = false

func cook():
	if food_cooked == false:
		$"Cook Timer".start()

func _on_cook_timer_timeout():
	$MeshInstance3D.material_override.albedo_color = Color.SADDLE_BROWN
	food_cooked = true
