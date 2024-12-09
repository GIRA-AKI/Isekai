extends Node2D

# JSON Data
var available_traits = [
	{"title": "Strength", "point": 15, "HP": 60, "mana": 10, "stamina": 50, "power": 45, "mentalHealth": 10, "speakingSkills": 5, "charisma": 15, "dodge": 12},
	{"title": "Agility", "point": 12, "HP": 30, "mana": 40, "stamina": 35, "power": 20, "mentalHealth": 20, "speakingSkills": 10, "charisma": 5, "dodge": 20}
]

var selected_traits = [
	{"title": "Defend", "point": 15, "HP": 60, "mana": 10, "stamina": 50, "power": 45, "mentalHealth": 10, "speakingSkills": 5, "charisma": 15, "dodge": 12},
	{"title": "Mana", "point": 12, "HP": 30, "mana": 40, "stamina": 35, "power": 20, "mentalHealth": 20, "speakingSkills": 10, "charisma": 5, "dodge": 20}
]


# Exposing these variables to the editor for drag-and-drop assignments
@export var selected_table: ItemList
@export var available_table: ItemList

# Called when the node enters the scene tree for the first time.
func _ready():
	# Check if the ItemList nodes are assigned in the editor
	if selected_table == null or available_table == null:
		print("Warning: One or both ItemList nodes are not assigned.")
		return

	# Populate the tables with JSON data
	populate_table(selected_table, selected_traits)
	populate_table(available_table, available_traits)

# Function to populate a table with traits
func populate_table(table: ItemList, traits: Array):
	table.clear()  # Clear the existing items in the table
	
	# Iterate through the array and access each trait's title
	for i in range(traits.size()):  # Iterate over the indices
		var cal_padding = 40 - traits[i]["title"].length() 
		var title = traits[i]["title"] + " ".repeat(10) + str(traits[i]["point"])
		table.add_item(title)

# Function to handle item double-click
func _on_item_double_click(table: ItemList, item_idx: int):
	var trait_title = table.get_item_text(item_idx)
	var source_traits = []
	var target_traits = []

	# Determine source and target table based on the clicked table
	if table == selected_table:
		source_traits = selected_traits
		target_traits = available_traits
	else:
		source_traits = available_traits
		target_traits = selected_traits

	# Find the trait in the source traits
	for i in range(source_traits.size()):
		print(source_traits[i])
		#var trait = source_traits[i]  # Access the dictionary at index 'i'
		#if trait["title"] == trait_title:
			#source_traits.erase(i)  # Remove the trait by index
			#target_traits.append(trait)  # Add the trait to the target list
		break  # Exit the loop once we find the trait
#
	# Update the tables
	#populate_table(selected_table, traits_data["selected_traits"])
	#populate_table(available_table, traits_data["available_traits"])
