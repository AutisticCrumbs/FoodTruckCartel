extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var interaction := $Camera3D/Interaction
@onready var hand := $Camera3D/Hand

var picked_object
var pull_power = 5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x) * 0.25)
		$Camera3D.rotate_x(deg_to_rad(-event.relative.y) * 0.25)
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x,deg_to_rad(-60), deg_to_rad(60))
	
	if Input.is_action_just_pressed("left_click"):
		if picked_object == null:
			pick_object()
		elif picked_object != null:
			drop_object()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	if picked_object != null:
		var a = picked_object.global_transform.origin
		var b = hand.global_transform.origin
		picked_object.set_linear_velocity((b-a) * pull_power)

	move_and_slide()

func pick_object():
	var collider = interaction.get_collider()
	if collider != null and collider is RigidBody3D:
		picked_object = collider

func drop_object():
	if picked_object != null:
		picked_object = null
