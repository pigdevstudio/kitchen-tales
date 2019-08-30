extends CanvasLayer

export (Resource) var player_data

func _ready():
	player_data.connect("updated", self, "update_player_data")
	update_player_data()


func update_player_data():
	$ScoreLabel.text = "Score: %s" % player_data.score
	$HealthBar.value = player_data.health
	$HealthBar.max_value = player_data.max_health
