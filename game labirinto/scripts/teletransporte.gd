extends Area2D
class_name Teleporter

@export var destinyPos: Marker2D;
@onready var player = GlobalVar.playerNode;

## Quando o PLayer entrar em contato com o Teletransporte:
func _on_body_entered(body):
	if body is Player && destinyPos != null:
		player.position = destinyPos.position;
		pass
