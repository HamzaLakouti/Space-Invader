extends Area2D

var speed := 500
var rotation_speed: int
var direction_x: float

signal collision
var can_collide := true

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(10, width - 10)
	var random_y = rng.randi_range(-100, -50)
	position = Vector2(random_x, random_y)
	rotation_speed = rng.randi_range(100, 300)
	direction_x = rng.randf_range(-0.5, 0.5)
	
func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

# collision with player
func _on_body_entered(body: Node2D) -> void:
	if can_collide:
		collision.emit()
		queue_free()

# collision with bullet
func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	area.queue_free()
	$ExplosionSound.play()
	$Sprite2D.hide()
	can_collide = false
	await get_tree().create_timer(1).timeout
	queue_free()
	Global.score += 1
