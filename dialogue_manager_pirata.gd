extends Node2D
var isPaused = false
var ChoicesRef: Array[CharacterBody2D] = []
# Called when the node enters the scene tree for the first time.
func _ready():
	$Box/Name.text = Global.nome
	pass
var prevState = Global.STANDUP_PRIMEIRA_CENA

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.choicesAppeared):
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://cenas/control.tscn")
#	if (prevState != Global.cenaAtual):
#		onChangeState()
#		prevState = Global.cenaAtual
	if (Global.isFinishedAllTexts):
		onFinishedAll()
	BBCodeMiddleware()
	DialoguesData.dialogueManager = self
	$Box/Name.text = Global.nome
	if (Global.isFinishedAllTexts and not Global.choicesAppeared):
		$TimerQuieto.start()
#		if (Global.escolhas): return
		if (Global.escolhas.size() == 0): return
		for i in Global.escolhas: 
			var choice = preload("res://choice.tscn").instantiate()
			ChoicesRef.push_front(choice)
			choice.choice = i.text
#			choice.myTextRefs = i.textRefs
			choice.dialogue = self
			choice.offset = 192 * Global.choicesOffset + 32
			if (Global.escolhas.size() == 2): choice.offset = 192 * Global.choicesOffset + 128
			Global.choicesOffset += 1
#			$HBoxContainer.add_child(mar)
			$HBoxContainer.add_child(choice)
		Global.choicesAppeared = true


func _on_timer_timeout():
	digitar()

func _input(event):
	if (event.as_text() == 'Enter' and not Global.choicesAppeared): 
		if (not Global.isFinished): 
			digitar()
		else:
			clean()
			DialoguesData.nextText()
func digitar():
	if (isPaused): return
	if (Global.texto.length() < Global.index + 1): 
		if Global.texto != '': 
			Global.isFinished = true
			Global.isFinishedAllTexts = not DialoguesData.hasNextText()
		return
	$Box/Label.text += Global.texto[Global.index]
	Global.index += 1
	
func clean():
	for i in ChoicesRef:
		$HBoxContainer.remove_child(i)
#		i.queuefree()
	Global.isFinished = false
	Global.isFinishedAllTexts = false
	Global.choicesOffset = 0
	Global.choicesAppeared = false
	$Box/Label.text = ''
	Global.index = 0


func _on_timer_quieto_timeout():
	if (!Global.semResposta): return
	pass
func setEffectOnText(BBCodeInit, BBCodeEnd):
	$Box/Label.text = BBCodeInit+$Box/Label.text+BBCodeEnd

func BBCodeMiddleware():
	var regex = RegEx.new()
	regex.compile("\\[.*?\\]")
	var text_without_tags = regex.sub(Global.texto, "", true)
	if (text_without_tags != Global.texto):
		$Box/Label.text = Global.texto
func onFinishedAll():
	if (Global.cenaAtual == Global.PERDENDO_ONIBUS):
		Global.textura_de_fundo = preload('res://assests/becosimpples.png')
		DialoguesData.Textos = DialoguesData.TextosMendingo
		Global.escolhas = ChoicesData.ESCOLHA_UM
		DialoguesData.initText()
		Global.cenaAtual = Global.MENDINGO
	if (Global.cenaAtual == Global.CHEGANDO_ONIBUS):
		Global.textura_de_fundo = preload("res://assests/o onibus o album.png")
		DialoguesData.Textos = DialoguesData.TextosPerdeuOOnibus
		DialoguesData.initText()
		Global.cenaAtual = Global.PERDENDO_ONIBUS
		Global.isFinishedAllTexts = false
	if (Global.cenaAtual == Global.STANDUP_PRIMEIRA_CENA):
		Global.textura_de_fundo = preload("res://assests/o onibus o album(3).png")
		clean()
		isPaused = true
		Global.nome = ''
		DialoguesData.Textos = DialoguesData.TextosPontoDeOnibus
		await get_tree().create_timer(1).timeout
		isPaused = false
		DialoguesData.initText()	
		Global.cenaAtual = Global.CHEGANDO_ONIBUS
		Global.isFinishedAllTexts = false
	pass
	# LÓGICA para fazer algo quando todos os textos acabarem.

func onChangeState():
	print("Olá")
