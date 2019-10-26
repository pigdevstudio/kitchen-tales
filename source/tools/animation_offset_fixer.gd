tool
extends EditorScript

const ANIMATION_NAME = "SETUP (copy)"
const PROPERTY = "position"

func _run():
	var selection = get_editor_interface().get_selection()
	var animator = selection.get_selected_nodes()[0]
	
	var animation = animator.get_animation(ANIMATION_NAME)
	
	for track in animation.get_track_count():
		var track_property = str(animation.track_get_path(track))
		if not PROPERTY in track_property:
			continue
		for key in animation.track_get_key_count(track):
			var current_key_value = animation.track_get_key_value(track, key)
			if not typeof(current_key_value) == TYPE_VECTOR2:
				continue
			var new_value_value = current_key_value + Vector2(0, 44)
			animation.track_set_key_value(track, key, new_value_value)
			print("done")