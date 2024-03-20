extends RigidBody3D

var cooked_patty = false
	
func cook():
	if cooked_patty == false:
		$"Cook Timer".start()

func _on_cook_timer_timeout():
	$MeshInstance3D.material_override.albedo_color = Color.SADDLE_BROWN
	cooked_patty = true
