extends Node

var host_name

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://new_host.tscn")
	pass # Replace with function body.


func _on_start_pressed() -> void:
	ServiceDiscovery.server_data = {'Name':"Room's " + str(host_name) }
	ServiceDiscovery.set_server()
	get_tree().change_scene_to_file("res://lobby.tscn")
	pass # Replace with function body.


func _on_name_text_changed(new_text: String) -> void:
	host_name = new_text
	pass # Replace with function body.
