tool
extends CPUParticles2D

export (NodePath) var weapon_path
onready var weapon = get_node(weapon_path)

func _process(delta):
	if not emitting:
		return
	angle = -weapon.rotation_degrees
	direction = Vector2.LEFT.rotated(deg2rad(-angle))
