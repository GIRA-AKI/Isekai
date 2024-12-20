extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#$Control/Label.text = str(ServiceDiscovery.set_server())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://set_new_game.tscn")
	pass # Replace with function body.


func _on_start_pressed() -> void:
	pass # Replace with function body.
