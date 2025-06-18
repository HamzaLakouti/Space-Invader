extends Control

func _ready() -> void:
	$MarginContainer2/Label.text = $MarginContainer2/Label.text + str(Global.time) + str('s')
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)
	Global.score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
