extends Node

var list_item = preload("res://pages/traits_set.tscn")

#table
@onready var traits_good = $Control/TabContainer/Traits/traits_good/MarginContainer/ScrollContainer/VBoxContainer
@onready var traits_bad = $Control/TabContainer/Traits/traits_bad/MarginContainer/ScrollContainer/VBoxContainer
@onready var traits_use = $Control/TabContainer/Traits/use_traits/MarginContainer/ScrollContainer/VBoxContainer
@onready var available_points = $Control/TabContainer/Traits/available_points/Label2

#Status
@onready var hp_text = $Control/Panel/StatusContainer/HBoxContainer/hpnum
@onready var mana_text = $Control/Panel/StatusContainer/HBoxContainer2/mana_num
@onready var stamina_text = $Control/Panel/StatusContainer/HBoxContainer3/Stamina_num
@onready var power_text = $Control/Panel/StatusContainer/HBoxContainer4/Power_num
@onready var sanity_text = $Control/Panel/StatusContainer/HBoxContainer5/Sanity_num
@onready var maintenance_text = $Control/Panel/StatusContainer/HBoxContainer6/Maintenance_num
@onready var Speaking_text = $Control/Panel/StatusContainer/HBoxContainer7/Speaking_num
@onready var Charm_text = $Control/Panel/StatusContainer/HBoxContainer8/Charm_num
@onready var Fluent_text = $Control/Panel/StatusContainer/HBoxContainer9/Fluent_num

#Character
@onready var Player_Class = $Control/TabContainer/Character/VBoxContainer/HBoxContainer/class
var Player_tribe
var sex
var hp
var mana
var stamina
var power
var sanity
var maintenance
var Speaking
var Charm
var Fluent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadAllTable()
	_on_setect_tribe_selected(0)
	pass

func calAvailablePoints():
	var current_point = 10
	for i in BaseSystem.playerTraits:
		current_point += i["point"]
	available_points.text = str(current_point)
	print(current_point)
	print("available_points was trigger")
	
func loadAllTable()-> void:
	loadTraits(traits_good,BaseSystem.good_traits)
	loadTraits(traits_bad,BaseSystem.bad_traits)
	loadTraits(traits_use,BaseSystem.playerTraits,true)
	calAvailablePoints();

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
	hp_text.text = str(hp)
	mana_text.text = str(mana)
	stamina_text.text = str(stamina)
	power_text.text = str(power)
	sanity_text.text = str(sanity) + "%"
	maintenance_text.text = str(maintenance) + "%"
	Speaking_text.text = str(Speaking) + "%"
	Charm_text.text = str(Charm) + "%"
	Fluent_text.text = str(Fluent)
	pass

func _on_setect_tribe_selected(index: int) -> void:
	if index ==0:
		Player_tribe = "Human"
		hp = 100
		mana = 20
		stamina = 50
		power = 20
		sanity = 100
		maintenance = 50
		Speaking = 100
		Charm = 100
		Fluent = 10
	elif index ==1:
		Player_tribe = "HaftCat"
	elif index ==2:
		Player_tribe = "Lizard"
	elif index ==3:
		Player_tribe = "Elf"
	elif index ==4:
		Player_tribe = "Dark Elf"
	pass # Replace with function body.

func _on_next_info_pressed() -> void:
	$Control/TabContainer/Traits.visible = true
	pass # Replace with function body.

func _on_back_to_info_pressed() -> void:
	$Control/TabContainer/Character.visible = true
	pass # Replace with function body.

func _on_man_pressed() -> void:
	$Control/TabContainer/Character/VBoxContainer/HBoxContainer2/woman.button_pressed = false
	sex = "M"

func _on_woman_pressed() -> void:
	$Control/TabContainer/Character/VBoxContainer/HBoxContainer2/man.button_pressed = false
	sex = "F"
