extends Node

export(NodePath) var state_machine_path = "../StateMachine"
onready var state_machine = get_node(state_machine_path)

export(NodePath) var combat_state_machine_path = "../CombatStateMachine"
onready var combat_state_machine = get_node(combat_state_machine_path)

export(NodePath) var character_path = "../Character"
onready var character = get_node(character_path)

export(NodePath) var sight_path = "../ChasingSightArea"
onready var sight = get_node(sight_path)

var _previous_valid_state = "Idle"

func _on_StateMachine_state_changed(new_state):
	if not new_state == "Stun":
		_previous_valid_state = new_state
	
	match new_state:
		"Idle":
			$IdleTime.start()
			sight.update_sight()
		"Walk":
			$WanderTime.start()
		"Chase":
			$IdleTime.stop()
			$WanderTime.stop()
		"Stun":
			$StunTime.start()
			$"../AttackAnimator".stop()


func _on_CombatStateMachine_state_changed(new_state):
	match new_state:
		"Stun":
			combat_state_machine.execute("Attack")


func _on_IdleTime_timeout():
	var inverse_direction = state_machine.direction
	inverse_direction.x *= -1
	update_directions(inverse_direction)
	
	state_machine.execute("Move")


func _on_WanderTime_timeout():
	state_machine.execute("Stop")


func _on_ChasingSightArea_spotted(spot_direction):
	update_directions(spot_direction)
	state_machine.execute("Chase")


func _on_ChasingSightArea_chase_direction_changed(new_direction):
	update_directions(new_direction)


func update_directions(direction):
	state_machine.direction = direction
	combat_state_machine.direction = direction
	character.set_look_direction(sign(direction.x))
	state_machine.execute("Move")


func _on_StunTime_timeout():
	state_machine.change_state_to(_previous_valid_state)


func _on_AttackAnimator_animation_changed(old_name, new_name):
	if old_name == "squash":
		$"../HurtBox".position = Vector2.ZERO


func _on_ChasingSightArea_missed():
	state_machine.execute("Stop")


func _on_Health_died():
	state_machine.change_state_to("Dead")
