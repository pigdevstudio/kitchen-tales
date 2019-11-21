extends Area2D

onready var hitbox = $HitBox
onready var animator = $AnimationPlayer

func _ready():
	set_physics_process(false)


func _physics_process(delta):
	pass
#	slow_down()


func slow_down():
	translate(Vector2.ZERO)
	for body in get_overlapping_bodies():
		if not body.is_in_group("player"):
			continue
		if not body.has_method("set_velocity"):
			continue
		body.velocity.x *= 0.5


func _on_area_entered(area):
	if not animator.current_animation == "vanish":
		animator.play("damage")
		set_physics_process(true)


func _on_area_exited(area):
	hitbox.disable()
	set_physics_process(false)


func _on_LifeTime_timeout():
	animator.play("vanish")
