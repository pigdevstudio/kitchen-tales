extends Node2D

export (Resource) var recipe


func _ready():
	for ingredient in get_children():
		if not ingredient.has_node("Brain"):
			continue
		ingredient.get_node("Brain").connect("died", self, "_on_ingredient_died")


func _on_ingredient_died(death):
	death.who.queue_free()
	recipe.update_ingredient(death.type, death.cause)
