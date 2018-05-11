extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY

	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		run(SPEED)

	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		run(-SPEED)
	else:
		idle()

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
#	To fly if the up button is held down	
#		if Input.is_action_pressed("ui_up"):
#			fly()
#		else:
#			run(motion.x)
		jump()

	motion = move_and_slide(motion, UP)

func idle():
	$Sprite.play("idle")
	motion.x = 0

func run(speed):
	$Sprite.play("run")
	motion.x = speed
	
func jump():
	$Sprite.play("jump")
	
func fly():
	$Sprite.play("fly")
	motion.y = JUMP_HEIGHT / 2