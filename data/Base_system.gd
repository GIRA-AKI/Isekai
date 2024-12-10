extends Node

var TL

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if TranslationServer.get_locale().contains("en"):
		TL = 0
	elif TranslationServer.get_locale().contains("th"):
		TL = 1
	else:
		TL = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#data for  traits
var good_traits = [
	{"id":101,"type":1,"title": "Strength", "point": -3, "HP": 60, "mana": 10, "stamina": 50, "power": 45, "mentalHealth": 10, "speakingSkills": 5, "charisma": 15, "dodge": 12},
	{"id":102,"type":1,"title": "Agility", "point": -2, "HP": 30, "mana": 40, "stamina": 35, "power": 20, "mentalHealth": 20, "speakingSkills": 10, "charisma": 5, "dodge": 20}
]
var bad_traits = [
	{"id":103,"type":0,"title": "Weak", "point": 6, "HP": 60, "mana": 10, "stamina": 50, "power": 45, "mentalHealth": 10, "speakingSkills": 5, "charisma": 15, "dodge": 12},
	{"id":104,"type":0,"title": "Fat", "point": 4, "HP": 30, "mana": 40, "stamina": 35, "power": 20, "mentalHealth": 20, "speakingSkills": 10, "charisma": 5, "dodge": 20}
]
var playerTraits = []
