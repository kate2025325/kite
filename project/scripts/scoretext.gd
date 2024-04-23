extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update():
	var score = glob.score
	pass

func _on_scoreupdatetimer_timeout():
	update()
	pass # Replace with function body.
