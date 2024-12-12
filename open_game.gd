extends Node

@onready var server_list = $Control/local/ScrollContainer/VBoxContainer

var server_list_item = preload("res://local_i.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/la.select(BaseSystem.TL)
	ServiceDiscovery.port = 4040
	ServiceDiscovery.scanned_server.connect(_on_scan_local)
	pass # Replace with function body.

func add_server_button(data):
	var item = server_list_item.instantiate()
	item.get_node("name").text = str(data.server_data.Name)
	item.get_node("ip").text = "IP: "+str(data.server_ip)
	
	server_list.add_child(item)
	

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

func _on_scan_local(data):
	add_server_button(data)

func _on_host_pressed() -> void:
	get_tree().change_scene_to_file("res://new_host.tscn")
	pass # Replace with function body.


func _on_re_press() -> void:
	ServiceDiscovery.scan_lan_servers()
	for child in server_list.get_children():
		server_list.remove_child(child)
	pass # Replace with function body.
