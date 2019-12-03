tool
extends EditorScript

const SOUND_EFFECTS_BASE_DIR = "res://actors/sound_effects"

func _run():
	var interface = get_editor_interface()
	var filesys = interface.get_resource_filesystem()
	var directory = filesys.get_filesystem_path(SOUND_EFFECTS_BASE_DIR)
	
	for subdir_index in range(0, directory.get_subdir_count()):
		var subdir = directory.get_subdir(subdir_index)
		for file_index in range(0, subdir.get_file_count()):
			if subdir.get_file(file_index).get_extension() == "tres":
				continue
			generate_random_pitch_sample(subdir.get_file_path(file_index))
	
	filesys.scan()


func generate_random_pitch_sample(audio_stream_file_path):
	var audio_sample = load(audio_stream_file_path)
	var audio_stream_random_pitch = AudioStreamRandomPitch.new()
	var extension = audio_stream_file_path.get_extension()
	var new_path = audio_stream_file_path.replace(extension, "tres")

	audio_stream_random_pitch.audio_stream = audio_sample
	ResourceSaver.save(new_path, audio_stream_random_pitch)
