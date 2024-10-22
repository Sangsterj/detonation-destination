extends Node
# this script is a "global" script, meaning it is always loaded, even between scene changes
# this can be found in the project > project settings > globals tab

# this is better than using just numbers to select weapon
# enum is a common thing in most programming languages also,
enum Weapon {
	FLAMETHROWER,
	CLICK,
	EXPLOSIVE,
	PUSH,
	NUKE
}

var current_weapon = Weapon.CLICK

func weapon_name(weapon):
	match weapon:
		Weapon.FLAMETHROWER:
			return "Flamethrower"
		Weapon.CLICK:
			return "Cursor"
		Weapon.EXPLOSIVE:
			return "Bomb"
		Weapon.PUSH:
			return "Push"
		Weapon.NUKE:
			return "Nuke"
	return "UNKNOWN WEAPON"

# screen shake
const SHAKING_DIMINISH = 0.9  # decreases additional shaking if it is already shaking a lot
const SHAKING_GO_AWAY = 0.3  # decreases existing shaking (if it is already shaking)
var shaking_amt: int = 0


func shake_screen(amt: int) -> void:
	shaking_amt = amt*pow(SHAKING_DIMINISH, shaking_amt)


func _process(delta: float) -> void:
	shaking_amt *= 1-delta*SHAKING_GO_AWAY
