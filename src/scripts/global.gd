extends Node

var busyState = false   # global iam busy state
var currentItens = []   # current values for buttons
var itensLength = 4     # current values length
var currentLang = "pt_br"   # current language
var gameStarted = false # set if game is started, used as reference for multiple scripts instances
var visibleAntsCount = 0

var letters = ['a', 'b', 'c', 'd', 'e', 'f',
	'g', 'h', 'i', 'j',	'k', 'l', 'm', 'n',
	'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
	'w', 'x', 'y', 'z']

# sets the current languague, not used right now
# but is gonna be usefull in the future
func set_current_lang(lang):
	currentLang = lang

# sets a global lock, used to avoid
# multiple clicks
func set_i_am_busy():
	busyState = true

# removes global lock
func set_i_am_not_busy():
	busyState = false

# return current busy or not state
func get_busy_state():
	return busyState

# return current letter based on button index of current itens
func get_current_letter(index):
	# index must be a value between 0 and itensLength (it means current 4 buttons)
	if(index > -1):
		if(index < itensLength):
			return letters[currentItens[index]]
	else:
		return "not found"

# set next four value sets for buttons
func set_next_random_values():
	randomize()
	# intialize array with empty values (-1)
	currentItens.clear()
	# set array size to itensLength
	currentItens.resize(itensLength)
	var count=0
	# assign -1 to all currentItens value, I dont know if it is really needed
	while (count < itensLength):
		currentItens[count] = -1
		count = count + 1
	var i
	var newValue=-1
	count=0
	# populate array with new random values for letters
	while (count < itensLength):
		newValue = -1
		i=0
		newValue = (randi()%26)
		# check if newValue is not alrady present on currentItens array, and do it until false
		while(currentItens.has(newValue)):
			newValue = (randi()%26)
		# assign currentItens count index with newValue up to itensLenght
		currentItens[count] = newValue
		count=count + 1


# gets current sound name to be played by specified button id
func get_current_soud(index):
	# index must be a value between 0 and itensLength (it means current 4 buttons)
	if(index > -1):
		if(index < itensLength):
			return letters[currentItens[index]]
	else:
		return "not found"

# set game as initialized usefull to set the first unique values
func set_game_start():
	if (gameStarted == false):
		gameStarted = true

# return if current game was flagged as started
func get_is_game_started():
	return gameStarted

func get_itens_lenght():
	return itensLength

func get_current_lang():
	return currentLang

func get_visible_ants():
	return visibleAntsCount

func set_inc_visible_ants():
	visibleAntsCount = visibleAntsCount + 1

func set_dec_visible_ants():
	visibleAntsCount = visibleAntsCount - 1