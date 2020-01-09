extends Node

export(NodePath) var combat_state_machine_path = "../CombatStateMachine"
onready var combat_state_machine = get_node(combat_state_machine_path)

export(NodePath) var state_machine_path = "../StateMachine"
onready var state_machine = get_node(state_machine_path)

export(NodePath) var character_path = "../Carrot"
onready var character = get_node(character_path)

export(NodePath) var sight_area_path = "../SightArea"
onready var sight_area = get_node(sight_area_path)

export(NodePath) var hurt_box_path = "../HurtBox"
onready var hurt_box = get_node(hurt_box_path)

export(NodePath) var punch_sigh_path = "../PunchSightArea"
onready var punch_sight = get_node("../PunchSightArea")

func _ready():
	character.set_look_direction(-1)


func _on_Sight_spotted(spot_direction):
	character.set_look_direction(sign(spot_direction.x))
	combat_state_machine.set_direction(spot_direction)
	
	var current_state = state_machine.current_state_name
	if  current_state == "HiddenState":
		state_machine.execute("Show")
		return
	elif current_state == "AlertState":
		$AttackDelay.start()


func _on_AttackDelay_timeout():
	combat_state_machine.execute("Attack")


func _on_StateMachine_state_changed(new_state):
	hurt_box.set_invincible(false)
	match new_state:
		"Alert":
			sight_area.update_sight()
		"Stand":
			sight_area.update_sight()
			$AlertTimer.start()
		"Stun":
			$AttackDelay.stop()
			$StunTimer.start()
		"Hidden":
			$HideTimer.start()
			hurt_box.set_invincible(true)


func _on_PunchSightArea_spotted(spot_direction):
	if state_machine.current_state_name == "StandState":
		state_machine.change_state_to("Hide")
	if not combat_state_machine.current_state_name == "StandState":
		combat_state_machine.change_state_to("Stand")
	$AlertTimer.stop()
	combat_state_machine.execute("Attack")


func _on_PunchTimer_timeout():
	if not combat_state_machine.current_state_name == "StandState":
		return
	combat_state_machine.execute("Attack")


func _on_PunchSightArea_area_exited(area):
	if area.is_in_group(punch_sight.target_group):
		state_machine.execute("Hide")
