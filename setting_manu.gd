extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://open_game.tscn")
	pass # Replace with function body.


func _on_borderless_item_selected(index: int) -> void:
	if index==0:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
	if index==1:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
	pass # Replace with function body.


func _on_windonmod_item_selected(index: int) -> void:
	if index==0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif index==1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	#elif index==2:
		#DisplayServer.WINDOW_MODE_WINDOWED
	pass # Replace with function body.


func _on_sizewindow_item_selected(index: int) -> void:
	if index==0:
		DisplayServer.window_set_size(Vector2i(1024, 768))
	elif index==1:
		DisplayServer.window_set_size(Vector2i(1152, 648))
	elif index==2:
		DisplayServer.window_set_size(Vector2i(1920, 1080))
	pass # Replace with function body.
