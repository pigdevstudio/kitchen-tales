extends SignalConnector

export (NodePath) var attack_path = "../Attack"
export (NodePath) var guard_path = "../Guard"
export (NodePath) var jump_path = "../Jump"
export (NodePath) var walk_path = "../Walk"
export (NodePath) var dash_path = "../Dash"
export (NodePath) var hitbox_path = "../HitBox"
export (NodePath) var combat_action_bus_path = "../CombatActionBus"
export (NodePath) var physics_action_bus_path = "../PhysicsActionBus"
export (NodePath) var action_buffer_path = "../ActionBuffer"
export (NodePath) var action_chain_solver_path = "../ActionChainSolver"

func connect_signals():
	var attack = get_node(attack_path)
	var guard = get_node(guard_path)
	var jump = get_node(jump_path)
	var walk = get_node(walk_path)
	var dash = get_node(dash_path)
	var hitbox = get_node(hitbox_path)
	var combat_action_bus = get_node(combat_action_bus_path)
	var physics_action_bus = get_node(physics_action_bus_path)
	var action_buffer = get_node(action_buffer_path)
	var action_chain_solver = get_node(action_chain_solver_path)
	
	attack.connect("finished", physics_action_bus, "handle_walk_action_pressed")
	guard.connect("finished", physics_action_bus, "handle_walk_action_pressed")
	
	combat_action_bus.connect("attack_pressed", attack, "execute")
	combat_action_bus.connect("attack_released", attack, "cancel")
	combat_action_bus.connect("defend_pressed", guard, "execute")
	combat_action_bus.connect("defend_released", guard, "cancel")
	combat_action_bus.connect("direction_changed", hitbox, "set_hit_direction")
	
	physics_action_bus.connect("dash_pressed", dash, "apply")
	physics_action_bus.connect("dash_released", dash, "stop")
	physics_action_bus.connect("walk_pressed", walk, "apply")
	physics_action_bus.connect("walk_released", walk, "stop")
	physics_action_bus.connect("jump_pressed", jump, "apply")
	physics_action_bus.connect("jump_released", jump, "stop")
	physics_action_bus.connect("direction_changed", dash, "set_movement_direction")
	physics_action_bus.connect("direction_changed", walk, "set_movement_direction")
	
	action_buffer.connect("actions_chain_changed", action_chain_solver, "resolve_action_chain")
	action_chain_solver.connect("action_chain_solved", action_buffer, "clear_unsolved_actions")
