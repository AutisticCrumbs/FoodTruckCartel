extends RigidBody3D

var cutted_tomato = false

func cut_tomato():
	if cutted_tomato == false:
		$"Uncut Tomato".hide()
		$"Cut Tomato".show()
		cutted_tomato = true
