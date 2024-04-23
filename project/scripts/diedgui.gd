extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	glob.connect("go", close)
	glob.connect("menu", close)
	glob.connect("die",open)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func close():
	visible = false
func open():
	visible = true
	var score = str(round(glob.score))
	var highscore = str(round(glob.highscore))

	if highscore == score:
			$PanelContainer/MarginContainer/Label.text ="new best:\n"+score
	else:
		$PanelContainer/MarginContainer/Label.text ="score:\n"+score+"\n\nhigh score:\n"+highscore
		


func _on_button_pressed():
	visible = false
	pass # Replace with function body.
