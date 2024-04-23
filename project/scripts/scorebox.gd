extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	glob.connect("go", open)
	glob.connect("die", close)
	glob.connect("title", close)
	#glob.connect("die", close)
	pass # Replace with function body.

func open():
	visible = true
	pass
func close():
	visible = false
	pass
func clear():
	pass

func _process(delta):
	update()
func update():
	var score = str(round(glob.score))
	var len = score.length()
	if len <5:
		for i in 5-len:
			score = "0"+score
	$PanelContainer/MarginContainer/Label.text = score
	pass
func _on_scoreupdatetimer_timeout():
	#update()
	pass # Replace with function body.
