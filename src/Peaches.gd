extends Area2D

signal peach_collected


func _on_Peaches_body_entered(body):
	emit_signal("peach_collected")
	queue_free()
