extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	glob.connect("title",open)
	glob.connect("go",close)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func close():
	visible = false
func open():
	
	visible = true
