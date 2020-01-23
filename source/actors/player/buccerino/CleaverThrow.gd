extends Node2D

export(NodePath) var cleaver_sprite_path
onready var cleaver_sprite = get_node(cleaver_sprite_path)

export(PackedScene) var flying_cleaver_scene
export(float) var throw_strength = 0.0

var throw_direction = Vector2.RIGHT setget set_direction


func throw():
	if throw_strength == 0.0:
		return
	var flying_cleaver_instance = flying_cleaver_scene.instance()
	flying_cleaver_instance.global_position = global_position
	flying_cleaver_instance.connect("returned", self, "_on_cleaver_instance_returned")
	
	find_parent("Level").add_child(flying_cleaver_instance)
	flying_cleaver_instance.direction = throw_direction
	flying_cleaver_instance.duration = throw_strength
	flying_cleaver_instance.return_target = self
	
	cleaver_sprite.visible = false


func _on_cleaver_instance_returned():
	cleaver_sprite.visible = true


func set_direction(new_direction):
	throw_direction = new_direction
