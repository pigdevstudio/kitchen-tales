extends Control

export(Resource) var recipe
export(PackedScene) var ingredient_item_scene

onready var title_label = $Panel/MarginContainer/VBoxContainer/Title
onready var ingredient_list_container = $Panel/MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/IngredientList

func _ready():
	title_label.text = recipe.title
	recipe.connect("updated", self, "_on_Recipe_updated")
	setup_ingredient_list()


func setup_ingredient_list():
	for index in range(0, recipe.ingredients.size()):
		var ingredient_item = ingredient_item_scene.instance()
		ingredient_list_container.add_child(ingredient_item)
		update_ingredient_item(ingredient_item)


func update_ingredient_item(ingredient_item):
	var index = ingredient_item.get_index()
	var ingredient = recipe.ingredients[index]
	var preparation = recipe.preparations[index]
	var amount = recipe.amounts[index]
	ingredient_item.get_node("Ingredient").text = ingredient.capitalize()
	ingredient_item.get_node("Preparation").text = preparation.capitalize()
	ingredient_item.get_node("Amount").text = str(amount)


func _on_Recipe_updated():
	for child in range(0, ingredient_list_container.get_child_count()):
		var ingredient_item = ingredient_list_container.get_child(child)
		update_ingredient_item(ingredient_item)
