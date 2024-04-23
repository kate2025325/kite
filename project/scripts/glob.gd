extends Node2D

#variables!
var og = {
	og_min_points = 7,
	og_max_points = 13,
	og_min_height = 50,
	og_max_height = 700,
	og_min_dist = 20,
	og_max_dist = 100,
	og_min_dur = 2,
	og_max_dur = 4,
	og_speed = 500
}

var min_points = 7
var max_points = 13
var min_height = 50
var max_height = 700
var min_dist = 20
var max_dist = 100
var min_dur = 2
var max_dur = 4

var duracc = 0.03
var acc = 15


var speed = 500
var running = false
var score = 0
var arrow = preload("res://scenes/arrow.tscn")

var highscore = 0

signal go
signal die
signal title
signal unsave
signal resetbutton
signal whoosh


# Called when the node enters the scene tree for the first time.
func _ready():
	highscore = save.load_game()["highscore"]
	connect("die", dead)
	connect("go", start)
	connect("title", menu)

	pass # Replace with function body.

func dead():
	running = false
	if score > highscore:
		highscore = score
		save.save_game()
	
func start():
	
	var plr = arrow.instantiate()
	get_node("/root/main").add_child(plr)
	plr.position = Vector2(960,540)
	running = true
	
	min_dur = og.og_min_dur
	max_dur = og.og_max_dur
	speed = og.og_speed
	score = 0

	
func menu():
	speed = 500
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if running:
		min_dur -= delta * duracc * 0.7
		max_dur -= delta * duracc
		min_dur = clamp(min_dur,0.3,10)
		max_dur = clamp(max_dur,min_dur,10)
		speed += acc * delta
		#print(min_dur)
		#print(max_dur)
		score += speed * delta * 0.01
		
		pass
	pass
