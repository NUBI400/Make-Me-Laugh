extends Node
var dialogueObj = {
	'author': "isoha",
	'text': "daskljdsa",
	'timeout': 0
}
var nome : String = ''
var texto : String = ''


var podesemexer = true
var index = 0
var isFinishedAllTexts = false
var isFinished = false
#var hasToBeClean()
var escolhas 
var choicesOffset = 0
var choicesAppeared = false
enum {
	STANDUP_PRIMEIRA_CENA,
	CHEGANDO_ONIBUS,
	PERDENDO_ONIBUS,
	MENDINGO,
	BEBEU,
	N_BEBEU
}
var cenaAtual = STANDUP_PRIMEIRA_CENA as int
var semResposta = false
var sanidade = 10
var felicidade = 0
var textura_de_fundo = preload("res://assests/palcohahahahaha1.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	if (ChoicesData.escolhas.size() > 0): escolhas = ChoicesData.escolhas[ChoicesData.escolhas_index]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
