extends CanvasLayer

static var image = load("res://graphics/2520587371637258767-128.png")
var time_elapsed := 0

func set_health(health):
	# remove all children
	for child in $MarginContainer/HBoxContainer.get_children():
		child.queue_free()
	
	# create new children by health
	for amount in health:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer/HBoxContainer.add_child(text_rect)


func _on_timer_timeout() -> void:
	time_elapsed += 1
	$MarginContainer2/Label.text = str(time_elapsed)
	Global.time = time_elapsed
