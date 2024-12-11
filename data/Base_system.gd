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

#data for  tribute

#all tribute stats config
var human = {
	"id":0,
	"tribute":"Human",
	"sex":"",
	"hp":100,
	"mana":20,
	"stamina":50,
	"power":20,
	"sanity":100,
	"maintenance":50,
	"speaking":100,
	"charm":100,
	"fluent":10
}
var cat = {
	"id":1,
	"tribute":"Cat Human",
	"sex":"",
	"hp":100,
	"mana":20,
	"stamina":50,
	"power":20,
	"sanity":100,
	"maintenance":50,
	"speaking":100,
	"charm":100,
	"fluent":10
}
var lizard = {
	"id":2,
	"tribute":"LIzard",
	"sex":"",
	"hp":100,
	"mana":20,
	"stamina":50,
	"power":20,
	"sanity":100,
	"maintenance":50,
	"speaking":100,
	"charm":100,
	"fluent":10
}
var elve = {
	"id":3,
	"tribute":"Elve",
	"sex":"",
	"hp":100,
	"mana":20,
	"stamina":50,
	"power":20,
	"sanity":100,
	"maintenance":50,
	"speaking":100,
	"charm":100,
	"fluent":10
}
var darkElve = {
	"id":4,
	"tribute":"Dark Elve",
	"sex":"",
	"hp":111,
	"mana":111,
	"stamina":111,
	"power":111,
	"sanity":111,
	"maintenance":111,
	"speaking":111,
	"charm":11,
	"fluent":111
}
