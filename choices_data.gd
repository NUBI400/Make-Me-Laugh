extends Node
func choice(text: String, cena):
	return {
		'text': text,
		'cena': cena
#		'textRefs': textRefs
	}

var ESCOLHA_UM = [
	choice("Beber", Global.BEBEU),
	choice("Não beber", Global.N_BEBEU)
]
var escolhas_index = 0
var escolhas = []
