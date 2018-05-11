#StartMenu.gd
extends Control


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
export(String, FILE, "*.tscn") var next_world


func _on_StartGame_pressed():
	get_tree().change_scene(next_world)


func _on_QuitGame_pressed():
	get_tree().quit()
