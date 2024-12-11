extends Button

var id : int = 0
var type : int = 0
var isSelect : bool = false

var last_click_time = 0.0  # Time of the last button press (in seconds)
var double_click_threshold = 0.3  # Time window for double-click (in seconds)
var time_since_last_click = 0.0  # Time since the last click (in seconds)

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Connect the button's signal to the function if not done already in the editor
	self.pressed.connect(_on_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update the time since the last click
	time_since_last_click += delta

# Called when the button is pressed
func _on_pressed() -> void:
	if time_since_last_click < double_click_threshold:
		# Double-click detected
		print("Double-click detected!")
		_on_double_click()
	else:
		# Single click detected
		print("Single click detected.")
	
	# Reset the time since last click
	time_since_last_click = 0.0

# Function for double-click action
func _on_double_click() -> void:
	# Add whatever actions you want to perform on double-click
	var currentTable
	var targetTable
	
	if(isSelect):
		currentTable = BaseSystem.playerTraits
	elif(type == 1):
		currentTable = BaseSystem.good_traits
	else:
		currentTable = BaseSystem.bad_traits
	
	if(isSelect):
		if(type == 1):
			targetTable = BaseSystem.good_traits
		else:
			targetTable = BaseSystem.bad_traits
	else:
		targetTable = BaseSystem.playerTraits
		
		
	for i in currentTable:
		if i.id == id:
			# Move the trait to playerTraits
			targetTable.append(i)
			
			# Remove the trait from good_traits
			currentTable.erase(i)
			break  # Exit loop after moving the trait
			
	if(isSelect):
		BaseSystem.playerTraits = currentTable
	elif(type == 1):
		BaseSystem.good_traits = currentTable
	else:
		BaseSystem.bad_traits = currentTable
	
	if(isSelect):
		if(type == 1):
			BaseSystem.good_traits = targetTable
		else:
			BaseSystem.bad_traits = targetTable
	else:
		BaseSystem.playerTraits = targetTable
	#print("-------------")
	#print(currentTable)
	#print(targetTable)
	#print(isSelect)
	get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().calSelfTrait()

	get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().loadAllTable()
