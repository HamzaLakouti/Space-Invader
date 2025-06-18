extends CharacterBody2D

var speed := 500
var can_shoot := true

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(640, 600)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# Shoot input
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPosition.global_position)
		can_shoot = false
		$Timer.start()
		$LaserSound.play()


func _on_timer_timeout() -> void:
	can_shoot = true

func play_collision_sound():
	$CollisionSound.play()
