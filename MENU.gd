extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	print(event.is_pressed())
	if event.is_pressed():
		get_tree().change_scene_to_file("res://cenas/palco.tscn")
