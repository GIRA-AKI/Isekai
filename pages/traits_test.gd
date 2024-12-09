extends Node

var list_item = preload("res://pages/traits_set.tscn")
@onready var traits_good = $Control/traits_good/MarginContainer/ScrollContainer/VBoxContainer
@onready var traits_bad = $Control/traits_bad/MarginContainer/ScrollContainer/VBoxContainer
@onready var traits_use = $Control/use_traits/MarginContainer/ScrollContainer/VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var item = list_item.instantiate()
	
	item.get_node("Label").text = "วิ่งเร็ว"
	item.get_node("Label2").text = "-3"
	traits_good.add_child(item)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
