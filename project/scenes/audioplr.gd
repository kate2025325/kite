extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pitch_scale = randf_range(0.9,1.3)
	play()
	pass # Replace with function body.


func _on_finished():
	queue_free()
	pass # Replace with function body.
