extends Node2D

@onready var window_polygon: Polygon2D = $WindowPolygon
@onready var ground: StaticBody2D = $Ground
@onready var blobber: RigidBody2D = $Blobber
@onready var zamn_label: Label = $Blobber/BlobberSprite/ZamnLabel
@onready var zamn_cooldown_timer: Timer = $ZamnCooldown
@onready var zamn_onscreen_timer: Timer = $ZamnOnScreen


func _ready() -> void:
	DisplayServer.window_set_mouse_passthrough(window_polygon.polygon)
	
	# Position the ground at the bottom of the screen so the blob can fall on it
	ground.position.y = get_viewport_rect().size.y
	ground.position.x = get_viewport_rect().size.x / 2
	
	blobber.position = get_viewport_rect().size - Vector2(80, 400)
	randomize_and_start_zamn_cooldown()
	
#	print("Zamn cooldown wait time at start up: " + str(zamn_cooldown_timer.wait_time))


# TESTING
#func _process(delta: float) -> void:
#	if not zamn_cooldown_timer.is_stopped():
#		print("Zamn cooldown time left:" + str(zamn_cooldown_timer.time_left))
#
#	if not zamn_onscreen_timer.is_stopped():
#		print("Zamn on screen timer left:" + str(zamn_onscreen_timer.time_left))


func randomize_and_start_zamn_cooldown() -> void:
#	zamn_cooldown_timer.wait_time = randi_range(2, 10) # TESTING
	zamn_cooldown_timer.wait_time = randi_range(120, 600)
	zamn_cooldown_timer.start()


func _on_zamn_cooldown_timeout() -> void:
	zamn_onscreen_timer.start()
	zamn_label.visible = true
	
#	if not zamn_onscreen_timer.is_stopped():
#		print("Zamn on screen timer started")


func _on_zamn_on_screen_timeout() -> void:
	randomize_and_start_zamn_cooldown()
	zamn_label.visible = false
