extends RigidBody3D

var cutted_cheese = false

func cut_cheese():
	if cutted_cheese == false:
		$"Uncut Cheese".hide()
		$"Cut Cheese".show()
		cutted_cheese = true
