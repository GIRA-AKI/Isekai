extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/la.select(BaseSystem.TL)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_setting_pressed() -> void:
	get_tree().change_scene_to_file("res://setting-manu.tscn")
	pass # Replace with function body.
	

func _on_la_item_selected(index: int) -> void:
	if index==0:
		TranslationServer.set_locale("en")
		BaseSystem.TL = 0
	elif index==1:
		TranslationServer.set_locale("th")
		BaseSystem.TL = 1
	pass # Replace with function body.


func _on_host_pressed() -> void:
	get_tree().change_scene_to_file("res://new_host.tscn")
	pass # Replace with function body.
