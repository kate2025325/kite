extends CharacterBody2D


const SPEED = 300.0
var acc = 30
var lastvel = Vector2.ZERO

var lastpos :Vector2 = Vector2.ZERO
var alive = true



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 800

func _ready():
	glob.connect("die",oof)
	glob.connect("go",destroy)

func _physics_process(delta):
	if alive:

		var mousev = get_viewport().get_mouse_position()
		mousev.x -= (get_viewport_rect().size.x - 1920)/2
		
		
		global_position = lerp(global_position,mousev,acc*delta)
		global_position.x = clamp(global_position.x,0,1920)
		global_position.y = clamp(global_position.y,0,1080)
		
		var vel = global_position - lastpos
		rotation = vel.y/50
		rotation = clamp(rotation, -PI/2, PI/2)
		#print(vel.y)
		if vel.y > 70 or vel.y < -70:
			if lastvel.y > -70 and lastvel.y < 70:
			
				glob.emit_signal("whoosh")
		lastpos = global_position
		lastvel = vel
	else:
		global_position.x -= glob.speed * delta
		if global_position.x <= -2500:
			destroy()
		
	#move_and_slide()
func destroy():
	queue_free()
func oof():
	alive = false
	$shape/Polygon2D.rad = 50
	$shape/Polygon2D.srad = 500
	$shape/Polygon2D/Line2D.width = 2
	$shape/Polygon2D/Line2D2.width = 2
	$shape/Polygon2D.switchitup()
	
	pass
