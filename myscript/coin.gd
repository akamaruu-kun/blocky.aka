extends Area2D

@onready var gameman: Node = %gameman
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body) :
	gameman.add_point()
	animation_player.play("coins")
