extends SignalConnector

export (NodePath) var attack_path = "../Attack"
export (NodePath) var guard_path = "../Guard"
export (NodePath) var health_path = "../Health"
export (NodePath) var hitbox_path = "../HitBox"
export (NodePath) var hurtbox_path = "../HurtBox"
export (NodePath) var actor_path = ".."
export (NodePath) var gravity_path = "../Gravity"
export (NodePath) var jump_path = "../Jump"
export (NodePath) var walk_path = "../Walk"
export (NodePath) var dash_path = "../Dash"
export (NodePath) var hitlag_path = "../HitLag"
export (NodePath) var hitcount_path = "../HitCount"

func connect_signals():
	var attack = get_node(attack_path)
	var guard = get_node(guard_path)
	var health = get_node(health_path)
	var hitbox = get_node(hitbox_path)
	var hurtbox = get_node(hurtbox_path)
	var actor = get_node(actor_path)
	var gravity = get_node(gravity_path)
	var jump = get_node(jump_path)
	var walk = get_node(walk_path)
	var dash = get_node(dash_path)
	var hitlag = get_node(hitlag_path)
	var hitcount = get_node(hitcount_path)
	
	attack.connect("started", guard, "set_enabled", [false])
	attack.connect("finished", guard, "set_enabled", [true])
	attack.connect("started", walk, "set_enabled", [false])
	attack.connect("finished", walk, "set_enabled", [true])
	attack.connect("started", jump, "set_enabled", [false])
	attack.connect("finished", jump, "set_enabled", [true])
	attack.connect("started", dash, "set_enabled", [false])
	attack.connect("finished", dash, "set_enabled", [true])
#	attack.connect("started", hitbox, "enable")
#	attack.connect("finished", hitbox, "disable")
	
	guard.connect("started", attack, "set_enabled", [false])
	guard.connect("finished", attack, "set_enabled", [true])
	guard.connect("started", walk, "set_enabled", [false])
	guard.connect("started", walk, "stop")
	guard.connect("finished", walk, "set_enabled", [true])
	guard.connect("started", jump, "set_enabled", [false])
	guard.connect("finished", jump, "set_enabled", [true])
	guard.connect("started", dash, "set_enabled", [false])
	guard.connect("finished", dash, "set_enabled", [true])
	guard.connect("started", hurtbox, "set_invincible", [true])
	guard.connect("finished", hurtbox, "set_invincible", [false])
	
	health.connect("died", actor, "queue_free")
	
#	hitbox.connect("landed", hitlag, "start")
#	hitbox.connect("finished", hitlag, "stop")
#	hitbox.connect("landed", hitcount, "increase")
#	hitbox.connect("missed", hitcount, "reset")
	
	hurtbox.connect("hit_landed", guard, "check_for_weakness")
	hurtbox.connect("damage_inflicted", health, "damage")
