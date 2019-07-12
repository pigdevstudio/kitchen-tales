extends SignalConnector

export (NodePath) var gravity_path = "../Gravity"
export (NodePath) var jump_path = "../Jump"
export (NodePath) var walk_path = "../Walk"
export (NodePath) var dash_path = "../Dash"
export (NodePath) var fall_path = "../Fall"
export (NodePath) var actor_path = ".."

func connect_signals():
	var gravity = get_node(gravity_path)
	var jump = get_node(jump_path)
	var walk = get_node(walk_path)
	var dash = get_node(dash_path)
	var fall = get_node(fall_path)
	var actor = get_node(actor_path)
	
	dash.connect("started", jump, "deplete")
	dash.connect("started", jump, "set_enabled", [false])
	dash.connect("started", walk, "set_enabled", [false])
	dash.connect("finished", jump, "set_enabled", [true])
	dash.connect("finished", walk, "set_enabled", [true])
	
	jump.connect("available_jumps_depleted", dash, "set_air_dash", [false])
	jump.connect("available_jumps_replenished", dash, "set_air_dash", [true])
	jump.connect("started", fall, "set_enabled", [true])
	
	fall.connect("finished", fall, "set_enabled", [false])
	
	actor.connect("ready", gravity, "set_physics_process", [true])
	actor.connect("ready", fall, "set_physics_process", [true])
