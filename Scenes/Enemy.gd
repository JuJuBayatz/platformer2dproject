extends Area2D
@export var move_speed: float = 30.0
@export var move_direction: Vector2

var start_position: Vector2
var target_position: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_position = global_position
	target_position = start_position + move_direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = global_position.move_toward(target_position, move_speed * delta)

	if global_position == target_position:
		target_position = start_position 

	if global_position == start_position:		
		target_position = start_position + move_direction
		


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.game_over()
