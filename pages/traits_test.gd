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
@onready var woman_btn = $Control/TabContainer/Character/VBoxContainer/HBoxContainer2/woman
@onready var man_btn = $Control/TabContainer/Character/VBoxContainer/HBoxContainer2/man

@onready var hp_plus = $Control/Panel/StatusContainer/HBoxContainer/hp_plus
@onready var mana_plus = $Control/Panel/StatusContainer/HBoxContainer2/mana_plus
@onready var stamina_plus = $Control/Panel/StatusContainer/HBoxContainer3/stamina_plus
@onready var power_plus = $Control/Panel/StatusContainer/HBoxContainer4/power_plus
@onready var sanity_plus = $Control/Panel/StatusContainer/HBoxContainer5/sanity_plus
@onready var maintenance_plus = $Control/Panel/StatusContainer/HBoxContainer6/maintenance_plus
@onready var Speaking_plus = $Control/Panel/StatusContainer/HBoxContainer7/speaking_plus
@onready var Charm_plus = $Control/Panel/StatusContainer/HBoxContainer8/charm_plus
@onready var Fluent_plus = $Control/Panel/StatusContainer/HBoxContainer9/fluent_plus

@onready var player_class_table = $Control/TabContainer/Character/ItemList
#Character
@onready var player_class_label = $Control/TabContainer/Character/VBoxContainer/HBoxContainer/class

var statsFromClass
var stats = {
	"id":null,
	"tribute":"",
	"sex":"",
	"hp":0,
	"mana":0,
	"stamina":0,
	"power":0,
	"sanity":0,
	"maintenance":0,
	"speaking":0,
	"charm":0,
	"fluent":0,
	"class_id":null,
}

var player_class = {
	"warrior":{
		"id":0,
		"title":"Warrior",
		"self":{
			"hp":10,
			"mana":0,
			"stamina":20,
			"power":10,
			"sanity":0,
			"maintenance":0,
			"speaking":0,
			"charm":0,
			"fluent":0
		}
	},
	"magician":{
		"id":1,
		"title":"Magician",
		"self":{
			"hp":0,
			"mana":30,
			"stamina":0,
			"power":0,
			"sanity":0,
			"maintenance":0,
			"speaking":0,
			"charm":0,
			"fluent":0
		}
	},
	"archer":{
		"id":2,
		"title":"Archer",
		"self":{
			"hp":0,
			"mana":0,
			"stamina":10,
			"power":10,
			"sanity":0,
			"maintenance":10,
			"speaking":0,
			"charm":0,
			"fluent":0
		}
	},
	"assasin":{
		"id":3,
		"title":"Assasin",
		"self":{
			"hp":-10,
			"mana":0,
			"stamina":0,
			"power":40,
			"sanity":0,
			"maintenance":0,
			"speaking":0,
			"charm":0,
			"fluent":0
		}
	},
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_man_pressed()
	loadPlayerClass()
	loadAllTable()
	_on_setect_tribe_selected(0)
	_on_item_list_item_selected(0)
	pass
	
func loadPlayerClass() -> void:
	for i in player_class:
		player_class_table.add_item(player_class[i]["title"])
	pass
	
func calAvailablePoints():
	var current_point = 10
	for i in BaseSystem.playerTraits:
		current_point += i["point"]
	available_points.text = str(current_point)
	
func loadAllTable()-> void:
	loadTraits(traits_good,BaseSystem.good_traits)
	loadTraits(traits_bad,BaseSystem.bad_traits)
	loadTraits(traits_use,BaseSystem.playerTraits,true)
	calAvailablePoints()
	calSelfTrait()

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
	
func reDisplayStats():
	hp_text.text = str(stats.hp)
	mana_text.text = str(stats.mana)
	stamina_text.text = str(stats.stamina)
	power_text.text = str(stats.power)
	sanity_text.text = str(stats.sanity) + "%"
	maintenance_text.text = str(stats.maintenance) + "%"
	Speaking_text.text = str(stats.speaking) + "%"
	Charm_text.text = str(stats.charm) + "%"
	Fluent_text.text = str(stats.fluent)
	
func onChangeTributeTo(tribute):
	var old_tribute = null
	if stats.id == 0:
		old_tribute = BaseSystem.human
	elif stats.id == 1:
		old_tribute = BaseSystem.cat
	elif stats.id == 2:
		old_tribute = BaseSystem.lizard
	elif stats.id == 3:
		old_tribute = BaseSystem.elve
	elif stats.id == 4:
		old_tribute = BaseSystem.darkElve
	
	if old_tribute:
		for key in stats.keys():
				if key != "id" and key != "class_id" and typeof(stats[key]) == TYPE_INT: 
					stats[key] -= old_tribute[key]
				
	for key in tribute.keys():
			if key != "id" and key != "class_id" and typeof(tribute[key]) == TYPE_INT:
				stats[key] += tribute[key]
	stats.id = tribute.id
	stats.tribute = tribute.tribute
	reDisplayStats()
	
func _on_setect_tribe_selected(index: int) -> void:
	if index == 0:
		onChangeTributeTo(BaseSystem.human)
	elif index == 1:
		onChangeTributeTo(BaseSystem.cat)
	elif index == 2:
		onChangeTributeTo(BaseSystem.lizard)
	elif index == 3:
		onChangeTributeTo(BaseSystem.elve)
	elif index == 4:
		onChangeTributeTo(BaseSystem.darkElve)

func clearAllTextPlus()-> void:
	hp_plus.text = ""
	mana_plus.text = ""
	stamina_plus.text = ""
	power_plus.text = ""
	sanity_plus.text = ""
	maintenance_plus.text = ""
	Speaking_plus.text = ""
	Charm_plus.text = ""
	Fluent_plus.text = ""
	
func _on_next_info_pressed() -> void:
	$Control/TabContainer/Traits.visible = true
	
	for key in statsFromClass.keys():
		if key != "id" and key != "class_id" and typeof(statsFromClass[key]) == TYPE_INT:
			stats[key] += statsFromClass[key]
	calSelfTrait()
	reDisplayStats()
	

func _on_back_to_info_pressed() -> void:
	$Control/TabContainer/Character.visible = true
	var old_class_from_stats
	
	for i in player_class.keys():
		var class_data = player_class[i]
		if class_data["id"] == stats.class_id:
			old_class_from_stats = class_data["self"]
	
	for key in old_class_from_stats.keys():
		if key != "id" and key != "class_id" and typeof(old_class_from_stats[key]) == TYPE_INT: 
			stats[key] -= old_class_from_stats[key]
	
	_on_item_list_item_selected(stats.class_id)
	reDisplayStats()

func _on_man_pressed() -> void:
	woman_btn.button_pressed = false
	man_btn.button_pressed = true
	stats.sex = "M"

func _on_woman_pressed() -> void:
	man_btn.button_pressed = false
	woman_btn.button_pressed = true
	stats.sex = "F"

func _on_item_list_item_selected(index: int) -> void:
	var keys = player_class.keys()
	var selected_class = keys[index]
	player_class_label.text = player_class[selected_class]["title"]
	
	statsFromClass = player_class[selected_class]["self"]
	stats.class_id = index
	
	textPlus(hp_plus,player_class[selected_class]["self"].hp)
	textPlus(mana_plus,player_class[selected_class]["self"].mana)
	textPlus(stamina_plus,player_class[selected_class]["self"].stamina)
	textPlus(power_plus,player_class[selected_class]["self"].power)
	textPlus(sanity_plus,player_class[selected_class]["self"].sanity)
	textPlus(maintenance_plus,player_class[selected_class]["self"].maintenance)
	textPlus(Speaking_plus,player_class[selected_class]["self"].speaking)
	textPlus(Charm_plus,player_class[selected_class]["self"].charm)
	textPlus(Fluent_plus,player_class[selected_class]["self"].fluent)
	
func textPlus(label_ref,text:int,_backSign:String = "")-> void:
	var frontSign = ""
	var backSign = _backSign

	if text > 0 :
		label_ref.add_theme_color_override("font_color","green")
		frontSign = "+"
	elif text < 0:
		label_ref.add_theme_color_override("font_color","red")
	
	if text == 0 :
		label_ref.text = ""
	else :
		label_ref.text = (frontSign + str(text) + " "+backSign)

func calSelfTrait()-> void:
	var statsFromTraits = {	
		"hp":0,
		"mana":30,
		"stamina":0,
		"power":0,
		"sanity":0,
		"maintenance":0,
		"speaking":0,
		"charm":0,
		"fluent":0 }
		
	if BaseSystem.playerTraits == null or BaseSystem.playerTraits.size() == 0:
		clearAllTextPlus()
		return  # Exit the function early
	for i in BaseSystem.playerTraits:
		statsFromTraits["hp"] += i.get("HP", 0)  # Default to 0 if key does not exist
		statsFromTraits["mana"] += i.get("mana", 0)
		statsFromTraits["stamina"] += i.get("stamina", 0)
		statsFromTraits["power"] += i.get("power", 0)
		statsFromTraits["sanity"] += i.get("sanity", 0)
		statsFromTraits["maintenance"] += i.get("speakingSkills", 0)
		statsFromTraits["speaking"] += i.get("charisma", 0)
		statsFromTraits["charm"] += i.get("dodge", 0)
		
	textPlus(hp_plus,statsFromTraits.hp)
	textPlus(mana_plus,statsFromTraits.mana)
	textPlus(stamina_plus,statsFromTraits.stamina)
	textPlus(power_plus,statsFromTraits.power)
	textPlus(sanity_plus,statsFromTraits.sanity)
	textPlus(maintenance_plus,statsFromTraits.maintenance)
	textPlus(Speaking_plus,statsFromTraits.speaking)
	textPlus(Charm_plus,statsFromTraits.charm)
	textPlus(Fluent_plus,statsFromTraits.fluent)
	#print("statsFromTraits ----------------")
	#print(statsFromTraits)
