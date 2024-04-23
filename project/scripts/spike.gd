extends Node2D
var points : PackedVector2Array = []
var poly
var copoly
var accentline
var whiteline

var rad = 10
var srad = 50

var flipped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	glob.connect("go",destroy)
	flipped = randi_range(0,1) == 1
	
	
	var x = 0
	var y = 40
	if flipped == true:
		y = 1040
	points.append(Vector2(x,y))
	
	var max = randi_range(glob.min_points, glob.max_points)
	
	for i in max - 2:
		x += randi_range(glob.min_dist,glob.max_dist)
		y = randi_range(glob.min_height+40,glob.max_height+40)
		if flipped == true:
			y = 1040 - y
		points.append(Vector2(x,y))
	
	x += randi_range(glob.min_dist,glob.max_dist)
	
	if flipped == false:
		points.append(Vector2(x,40))
	else:
		points.append(Vector2(x,1040))
	
	poly = $poly
	copoly = $area/copoly
	accentline = $poly/accent
	whiteline = $poly/white
	
	poly.polygon = points
	copoly.polygon = points
	accentline.points = points
	whiteline.points = points
	
	pass # Replace with function body.

func destroy():
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= glob.speed * delta
	for i in points.size()-2:
		#move lines!
		accentline.points[i+1] = leashedwalker(i+1, accentline.points[i+1], delta)
		whiteline.points[i+1] = leashedwalker(i+1, whiteline.points[i+1], delta)
	
	if position.x < -2500:
		destroy()
	
	
	
	
func leashedwalker(i, pos, d):
	var newvec
	if (pos - points[i]).length() > rad:
		newvec =(points[i] - pos).normalized()
	else:
		newvec = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()*srad*d
	return pos + newvec
	
		
	
	pass


func _on_area_body_entered(body):
	glob.emit_signal("die")
	pass # Replace with function body.
