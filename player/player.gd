extends CharacterBody2D

@export var speed := 35
@onready var animation = $AnimationPlayer

func handleInput():
	var moveDir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDir * speed
	
func updateAnimation():
	if velocity.length() == 0:
		animation.stop()
		return
	
	var direction = "down";
	if velocity.x < 0: direction = "left"
	elif velocity.x > 0: direction = "right"
	elif velocity.y < 0: direction = "up"
	
	animation.play("walk_" + direction)
	
func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()

