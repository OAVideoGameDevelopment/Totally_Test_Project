extends Area2D


@export var spawnArea: Rect2 = Rect2(Vector2(0, 0), Vector2(1100, 650))
@export var pickupScene: PackedScene
signal savedMayuri
@onready var gui = get_node("/root/World/TimesSavedMayuri")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func spawn_pickup():
	var pickup = pickupScene.instantiate()
	var pos = Vector2(
		randf_range(spawnArea.position.x, spawnArea.position.x + spawnArea.size.x),
		randf_range(spawnArea.position.y, spawnArea.position.y + spawnArea.size.y)
	)
	pickup.connect("savedMayuri", Callable(gui, "_on_mayuri_saved_mayuri"))
	pickup.pickupScene = pickupScene
	pickup.position = pos
	get_parent().call_deferred("add_child", pickup)
	
	
	
func _on_body_entered(body):
	if body.name == "Player":
		queue_free()
		spawn_pickup()
		emit_signal("savedMayuri")
		
		
