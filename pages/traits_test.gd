extends Node

var list_item = preload("res://pages/traits_set.tscn")

#table
@onready var traits_good = $Control/traits_good/MarginContainer/ScrollContainer/VBoxContainer
@onready var traits_bad = $Control/traits_bad/MarginContainer/ScrollContainer/VBoxContainer
@onready var traits_use = $Control/use_traits/MarginContainer/ScrollContainer/VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadAllTable()
	pass
	
func loadAllTable()-> void:
	
	loadTraits(traits_good,BaseSystem.good_traits)
	loadTraits(traits_bad,BaseSystem.bad_traits)
	loadTraits(traits_use,BaseSystem.playerTraits,true)

func loadTraits(table, traits:Array, isPlayerTraits:bool = false) -> void:
	
	for child in table.get_children():
		table.remove_child(child)
		child.queue_free()  # Optionally free the child to release memory
		
	for i in traits:
		var item = list_item.instantiate()
		item.get_node("Label").text = i["title"]
		item.get_node("Label2").text = str(i["point"])
		item.type = i["type"]
		item.id = i["id"]
		item.isSelect = isPlayerTraits
		table.add_child(item)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
