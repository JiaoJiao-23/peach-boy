extends KinematicBody2D

const UP = Vector2(0,-1)
const SPEED = 150

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += 10

	if Input.is_action_pressed("attack"):
		$AnimatedSprite.play("Attack")
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
	else:
		velocity.x = 0
		$AnimatedSprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			velocity.y = -300
	else:
		$AnimatedSprite.play("Jump")
	
	velocity = move_and_slide(velocity, UP)
	pass


func _on_FallZone_body_entered(body):
	get_tree().change_scene("res://Node2D.tscn")
	
func die():
	$AnimatedSprite.play("Death")


func _on_SwordHit_area_entered(area):
	if area.is_in_group("hurtbox"):
		area.take_damage()
