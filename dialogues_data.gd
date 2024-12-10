extends Node
var dialogos_index = 0
var tempo_para_pular_sozinho = 0
var dialogueManager
func _process(delta):
	if (Global.isFinished and not Global.choicesAppeared): tempo_para_pular_sozinho += 1 * delta
	if (tempo_para_pular_sozinho > 3):
		dialogueManager.clean()
		nextText()
func setProps():
#	if (!Global or !Global.dialogueObj): return
#	if(!Global.dialogueObj): return
	Global.texto = Global.dialogueObj.text
	Global.nome = Global.dialogueObj.author
func nextText():
	tempo_para_pular_sozinho = 0
	dialogos_index += 1
	if (dialogos_index + 1 > Textos.size()): return
	Global.dialogueObj = Textos[dialogos_index]
	setProps()
func hasNextText() -> bool:
	return dialogos_index + 1 != Textos.size()
	setProps()
func initText():
	dialogueManager.clean()
	tempo_para_pular_sozinho = 0	
	dialogos_index = 0
	Global.dialogueObj = Textos[dialogos_index]
	setProps()
func initTextWithoutSet():
	dialogueManager.clean()
	tempo_para_pular_sozinho = 0	
	Global.index = 0
	dialogos_index = 0
	Global.dialogueObj = Textos[dialogos_index]
	print(Global.dialogueObj)
		
	
func createDialogueText(text: String, author: String, timeout: int):
	return {
		'text': text,
		'author': author,
		'timeout': timeout
#		'BBCodeInit': 
	}
const A_R = 'Ronaldo'
var TextosUm = [
	createDialogueText("É... Eu terminei com minha namorada há 3 semanas...", A_R, 200),
	createDialogueText("Ela gemia muito na hora do sexo...", A_R, 120),
	createDialogueText("...E eu acabei escutando quando cheguei em casa.", A_R, 200),
	createDialogueText("...", "Plateia", 320),
	createDialogueText("É... Uma salva palmas para o Ronaldo Macedonia!", "Apresentador",0)
]

var TextosPontoDeOnibus = [
	createDialogueText("No que eu tava pensando? Óbvio que ninguém ia rir.", A_R,200),
	createDialogueText("Só quero chegar em casa e desmaiar logo...", A_R, 0),
]

var TextosPerdeuOOnibus = [
	createDialogueText("[shake rate=20.0 level=5 connected=1]PUTA MERDA![/shake]", A_R, 0),
	createDialogueText("Esse era o meu ônibus... O último.", A_R,0),
]

var TextosMendingo = [
	createDialogueText("Andando nas ruas, ele pega um beco como atalho.", "",200),	
	createDialogueText("Nesse beco ele encontra com um cara bêbado que tem uma bebida, cheia.", "",200),	
	createDialogueText("O que você faz? Suas escolhas tem consequências.", "", 200)
]
var Textos = TextosUm
