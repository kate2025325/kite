extends Polygon2D

@export var rad = 5
var line
var vertexin
var line2
@export var srad = 30


# Called when the node enters the scene tree for the first time.
func _ready():
	vertexin = polygon
	line = $Line2D
	line2 = $Line2D2
	var newar : PackedVector2Array = []
	for i in vertexin.size():
		newar.push_back(vertexin[i])
		
		line.points = newar
		
		line2.points = newar

	pass # Replace with function body.
	#print(line.points.size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in vertexin.size():
			
		#polygon[i] = leashedwalker(i, polygon[i], delta)
		line.points[i] = leashedwalker(i, line.points[i], delta)
		line2.points[i] = leashedwalker(i, line2.points[i], delta)

			
	
	
func leashedwalker(i, pos, d):
	var newvec
	if (pos - vertexin[i]).length() > rad:
		newvec =(vertexin[i] - pos).normalized()
	else:
		newvec = Vector2(randf_range(-srad*d,srad*d),randf_range(-srad*d,srad*d)).normalized()
	return pos + newvec
	
		
	
	pass

func switchitup():
	for i in vertexin.size():
		
		#polygon[i] = Vector2(vertexin[i].x+randi_range(-rad,rad),vertexin[i].y+randi_range(-rad,rad))

		line.points[i] = Vector2(vertexin[i].x+randi_range(-rad,rad),vertexin[i].y+randi_range(-rad,rad))
		line2.points[i] = Vector2(vertexin[i].x+randi_range(-rad,rad),vertexin[i].y+randi_range(-rad,rad))


