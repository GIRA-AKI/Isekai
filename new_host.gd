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


func _on_back_in_load_pressed() -> void:
	$load_manu.visible = false
	pass # Replace with function body.


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://set_new_game.tscn")
	pass # Replace with function body.


func _on_load_pressed() -> void:
	$load_manu.visible = true
	pass # Replace with function body.


func _on_load_out_pressed() -> void:
	$FileDialog.visible = true
	pass # Replace with function body.


func _on_back_find_pressed() -> void:
	$load_find.visible = false
	pass # Replace with function body.


func _on_load_in_pressed() -> void:
	$load_find.visible = true
	pass # Replace with function body.
