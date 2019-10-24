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

func _ready():
	character.set_look_direction(-1)


func _on_Sight_spotted(spot_direction):
	if state_machine.current_state_name == "HiddenState":
		state_machine.execute("Show")
		return
	character.set_look_direction(sign(spot_direction.x))
	combat_state_machine.set_direction(spot_direction)
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
