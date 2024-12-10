extends CharacterBody2D

#Nós
@onready var sprite = $Sprite
@onready var collision = $Collision

#Estados
enum{IDLE, MOVE}
@export var state : int = IDLE

# Movimentação;
var direcao = 1
@export var velocidade_padrao : int = 6000
var velocidade = velocidade_padrao



func _physics_process(delta):
	if Global.podesemexer == true:
		state = MOVE
	else : 
		state = IDLE
	
	
	
	match state:
		IDLE:
			idle()
		
		MOVE:
			move(delta)
	
	move_and_slide()
	#set_animation()


func idle():
	velocity.x = 0

func move(delta : float):
	direcao = Input.get_axis("Esquerda","Direita")
	velocity.x = direcao * velocidade * delta
	
	
	flip()
	


func flip():
	
	if velocity.x > 0:
		sprite.flip_h = false

	if velocity.x < 0:
		sprite.flip_h = true


func set_animation():
	pass
#	anim = "Idle"
#
#	if velocity.x != 0:
#		anim = "Run"
