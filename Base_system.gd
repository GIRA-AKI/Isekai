extends Node

var TL

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if TranslationServer.get_locale().contains("en"):
		TL = 0
	elif TranslationServer.get_locale().contains("th"):
		TL = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
