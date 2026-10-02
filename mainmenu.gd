extends Node2D

var button_type = null

func _on_start_pressed() -> void:
	button_type = "start"
	$imfaded.show()
	$imfaded/fadetime.start()
	$imfaded/AnimationPlayer.play("fade_in")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_fadetime_timeout() -> void:
	if button_type == "start" :
		get_tree().change_scene_to_file("res://myscenes/dagame.tscn")
