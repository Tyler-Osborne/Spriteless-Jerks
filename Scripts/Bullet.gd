extends KinematicBody2D

var speed = 600
var velocity = Vector2()

func start(pos, dir):
    rotation = dir
    position = pos
    velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
    var collision = move_and_collide(velocity * delta)
    if collision:
        if collision.collider.has_method("kill") and collision.collider.is_in_group("enemies"):
            collision.collider.kill()
            queue_free()
        elif collision.collider != get_node("/root/LevelTemplate/Player"):
            queue_free()

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()