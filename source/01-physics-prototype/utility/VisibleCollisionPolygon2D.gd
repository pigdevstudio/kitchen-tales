tool
extends CollisionPolygon2D

export (Color) var color = Color.white setget set_color

func _draw():
	var vertex_colors = []
	for point in polygon:
		vertex_colors.append(color)
	draw_polygon(polygon, vertex_colors)


func set_color(new_color):
	color = new_color
	update()
