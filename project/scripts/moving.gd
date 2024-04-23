extends Node2D
var scene = preload("res://scenes/spike.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	glob.connect("go", start)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn():
	var spike = scene.instantiate()
	add_child(spike)
	spike.position = Vector2(2500,0)
	#print(spike.position.x)
	pass
	
func start():
	spawn()
	$Timer.wait_time = randf_range(glob.min_dur, glob.max_dur)
	$Timer.start()
	
	pass
func _on_timer_timeout():
	#print("timer")
	if glob.running == true:
		spawn()
		$Timer.wait_time = randf_range(glob.min_dur, glob.max_dur)
		$Timer.start()
	
	pass # Replace with function body.
