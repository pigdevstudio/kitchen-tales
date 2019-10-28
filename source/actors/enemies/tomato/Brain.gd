extends Node

export(NodePath) var state_machine_path = "../StateMachine"
onready var state_machine = get_node(state_machine_path)

export(NodePath) var combat_state_machine_path = "../CombatStateMachine"
onready var combat_state_machine = get_node(combat_state_machine_path)

export(NodePath) var character_path = "../Character"
onready var character = get_node(character_path)

func _on_StateMachine_state_changed(new_state):
	match new_state:
		"Idle":
			$IdleTime.start()
		"Walk":
			$WanderTime.start()
		"Chase":
			$IdleTime.stop()
			$WanderTime.stop()


func _on_CombateStateMachine_state_changed(new_state):
	pass # Replace with function body.


func _on_SightArea_spotted(spot_direction):
	state_machine.direction.x = spot_direction.x
	combat_state_machine.direction = state_machine.direction
	state_machine.execute("Chase")
	var look_direction = sign(combat_state_machine.direction.x)
	character.set_look_direction(look_direction)


func _on_IdleTime_timeout():
	state_machine.direction.x *= -1
	combat_state_machine.direction = state_machine.direction
	state_machine.execute("Move")
	var look_direction = sign(combat_state_machine.direction.x)
	character.set_look_direction(look_direction)


func _on_WanderTime_timeout():
	state_machine.execute("Stop")


func _on_InnerAttackRange_area_entered(area):
	state_machine.execute("Squash")
	combat_state_machine.execute("Attack")


func _on_OuterAttackRange_area_exited(area):
	state_machine.execute("Stop")
