extends Node

var whoo = preload("res://scenes/whoosher.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	glob.connect("whoosh",woosh)
	pass # Replace with function body.

func woosh():
	var w = whoo.instantiate()
	add_child(w)
