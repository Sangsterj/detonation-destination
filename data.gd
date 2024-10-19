extends Node
# this script is a "global" script, meaning it is always loaded, even between scene changes
# this can be found in the project > project settings > globals tab

# this is better than using just numbers to select weapon
# enum is a common thing in most programming languages also,
enum Weapon {
	FLAMETHROWER,
	CLICK,
	EXPLOSIVE
}

var current_weapon = Weapon.CLICK
