extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	glob.connect("go",close)
	glob.connect("title",close)
	glob.connect("resetbutton",open)
	glob.connect("unsave",close)
	pass # Replace with function body.

func open():
	visible = true
func close():
	visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
