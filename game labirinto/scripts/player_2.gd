extends CharacterBody2D
var speed = 100

@onready var anim = $anim
var direction : Vector2 = Vector2.ZERO;

## o player terá um array "mySprite"
var mySprites: Array[Dictionary] = [
	{"idle": "idle_up",
	"walk": "walk_up"},
	{"idle": "idle_right",
	"walk": "walk_right"},
	{"idle": "idle",
	"walk": "walk_down"},
	{"idle": "idle_right",
	"walk": "walk_right"}
] 


func _physics_process(delta):
	move()
	move_and_slide()
	
	
func move() -> void:
	direction = Input.get_vector("mv_left", "mv_right", "mv_up", "mv_down")
	
	velocity = direction * speed;
	manageAnimation()

func manageAnimation() -> void:
	var myAngle = rad_to_deg(direction.angle()) + 90;
	print("my angle: " , myAngle)
	var myAngleInd = int((myAngle + 45) / 90) ;
	print("my angle ind: " , myAngleInd)
	var spriteStructure = mySprites[myAngleInd];
	
	var key = "walk" if velocity.length() > 0 else "idle";
	
	if velocity.x != 0:
		anim.flip_h = velocity.x < 0;
		
	anim.play(spriteStructure[key]);
		
		
		
