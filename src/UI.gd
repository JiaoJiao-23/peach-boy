extends CanvasLayer

var coins = 0
var peaches = 0

func _ready():
	$Interface/CoinCounter/Label.text = String(coins)
	$Interface/PeachCounter/Label.text = String(peaches)


func _on_coin_collected():
	coins = coins + 1
	_ready()
	
func _on_peach_collected():
	coins = coins + 1
	_ready()


func _on_Peaches_peach_collected():
	peaches = peaches + 1
	_ready()
