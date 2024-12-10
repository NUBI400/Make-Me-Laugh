extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fadein")
	await $AnimationPlayer.animation_finished
	DialoguesData.initText()
#	Global.texto = 'TO FICANDO LOUCO AAAAAAAAAAAAAAAAAAAAAA'


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite2D.texture = Global.textura_de_fundo
	pass
