extends Control

onready var game = get_node("/root/Game")
var saved_actions = {}

const REBIND_STR: String = "Rebind Key"
const PRESS_STR: String = "Press a Key..."
const CLEAR_STR: String = "Clear Key"

var is_rebinding: bool = false
var rebinding_action: String = ""
var active_rebind_button: Button = null

func _ready():
	# Fill parent rect
	embiggen(self)
	rect_size = Vector2(1366, 768)
	# Add scroll container
	var scroll_cont = ScrollContainer.new()
	embiggen(scroll_cont)
	self.add_child(scroll_cont)
	# Add vbox container
	var vbox = VBoxContainer.new()
	embiggen(vbox)
	scroll_cont.add_child(vbox)
	# Add list of actions
	for action in InputMap.get_actions():
		vbox.add_child(generate_action_row(action))
		vbox.add_child(HSeparator.new())

# Make a node fill its parent
func embiggen(node: Control):
	node.anchor_right = 1.0
	node.anchor_bottom = 1.0
	node.size_flags_horizontal = SIZE_EXPAND_FILL
	node.size_flags_vertical = SIZE_EXPAND_FILL

# Called for each action
func generate_action_row(action: String) -> HBoxContainer:
	# Parent
	var hcontainer = HBoxContainer.new()
	hcontainer.size_flags_horizontal = SIZE_EXPAND_FILL
	# Action Label
	hcontainer.add_child(create_label(action))
	# List of Buttons
	var list = InputMap.get_action_list(action)
	if not list.empty():
		hcontainer.add_child(create_label(list[0].as_text()))
	else:
		hcontainer.add_child(create_label(""))
	# Control buttons
	hcontainer.add_child(create_rebind_key(action))
	hcontainer.add_child(create_clear_key(action))
	# Save to a list to reference later
	saved_actions[action] = hcontainer
	return hcontainer

func create_label(txt: String) -> Label:
	var label = Label.new()
	label.text = txt
	label.size_flags_horizontal = SIZE_EXPAND_FILL
	return label

# Returns a rebind key, connected to a specific action
func create_rebind_key(action: String) -> Button:
	var button = Button.new()
	button.text = REBIND_STR
	button.connect("button_up", self, "rebind_button_pressed", [button, action])
	button.enabled_focus_mode = Control.FOCUS_NONE
	return button

# Returns a clear key, connected to a specific action
func create_clear_key(action: String) -> Button:
	var button = Button.new()
	button.text = CLEAR_STR
	button.connect("button_up", self, "clear_action", [action])
	button.enabled_focus_mode = Control.FOCUS_NONE
	return button

# Activate rebinding for the chosen key
func rebind_button_pressed(button, action: String):
	button.text = PRESS_STR
	button.button_mask = 0
	is_rebinding = true
	active_rebind_button = button
	rebinding_action = action


# Wipe out an action
func clear_action(action: String):
	InputMap.action_erase_events(action)
	saved_actions[action].get_child(1).text = ""

# Detect inputs
func _input(event):
	if is_rebinding:
		if event.is_pressed():
			clear_action(rebinding_action)
			InputMap.action_add_event(rebinding_action, event)
			is_rebinding = false
			var bind_text = event.as_text()
			if event is InputEventMouseButton:
				bind_text = "Mouse " + str(event.button_index)
			saved_actions[rebinding_action].get_child(1).text = bind_text
			active_rebind_button.text = REBIND_STR
			active_rebind_button.button_mask = BUTTON_MASK_LEFT
			active_rebind_button = null

func _on_BackButton_pressed():
	game.add_child(Global.title.instance())
	game.get_node("InputMapper").queue_free()
