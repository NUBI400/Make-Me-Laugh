extends CharacterBody2D
@export var choice: String
var offset: int
var dialogue
#var myTextRefs: Array[String]
#var author
var text
#var timeout
var cena
# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.x = offset
	$Label.text = choice
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	pass
#	dialogue.clean()
#	Global.cenaAtual = Global
#	DialoguesData.Textos = myTextRefs
#	DialoguesData.initTextWithoutSet()
#	Global.isFinishedAllTexts = false
