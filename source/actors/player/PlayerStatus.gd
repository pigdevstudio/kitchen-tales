extends Node

export (Resource) var player_data

func update_health(new_value):
	player_data.health = new_value


func update_score(new_value):
	player_data.score = new_value


func increase_health(amount):
	player_data.health += amount


func decrease_health(amount):
	player_data.health -= amount


func increase_score(amount):
	player_data.score += amount


func decrease_score(amount):
	player_data.score -= amount
