extends Resource

signal completed
signal updated

export (String) var title = ""
export (PoolStringArray) var ingredients = []
export (PoolStringArray) var preparations = []
export (PoolIntArray) var amounts = []

func make_all_array():
	ingredients = Array(ingredients)
	preparations = Array(preparations)
	amounts = Array(amounts)


func update_ingredient(ingredient, preparation):
	if not ingredient in ingredients:
		return
	for index in range(0, ingredients.size()):
		if not ingredients[index] == ingredient:
			continue
		if not preparations[index] == preparation:
			continue
		amounts[index] = max(0, amounts[index] -1)
		emit_signal("updated")


func check_completion():
	var completed = false
	for amount in amounts:
		if amount > 0:
			break
		completed = true
	
	if completed:
		emit_signal("completed")
