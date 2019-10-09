extends Node

export(NodePath) var combat_state_machine_path = "../CombatStateMachine"
onready var combat_state_machine = get_node(combat_state_machine_path)

export(NodePath) var character_path = "../Carrot"
onready var character = get_node(character_path)

var current_state = "Idle"

func _on_Sight_spotted(spot_direction):
	if current_state == "Stand":
		character.set_look_direction(sign(spot_direction.x))
	combat_state_machine.set_direction(spot_direction)
	combat_state_machine.execute("Attack")


func _on_CombatStateMachine_state_changed(new_state):
	current_state = new_state
