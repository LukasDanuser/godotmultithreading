extends Node


var Type: String
var Level: int
var HealthPoints: int
var ActionPoints: int
var MoveAP: int
var Discipline: int
var toHit: int
var evade: int

func _init(type: String, level: int, hp: int, ap: int, moveAP: int, discipline:int):
	pass

func _ready():
	pass

func attack(defender):
	var effectiveToHit = toHit-defender.evade #berechnet die effektive trefferwahrscheinlickeit
	if (Math.rand_range(1,100)<effectiveToHit):
		defender.takeDamage(damage)
	pass

func setLevel(level: int):
	self.Level = level

func getLevel():
	return self.Level

func setHP(hp: int):
	self.HealthPoints = hp

func getHP():
	return self.HealthPoints

func setAP(ap: int):
	self.AttackPoints = ap

func getAP():
	return self.AttackPoints

func setMoveAP(moveAP: int):
	self.MoveAP = moveAP

func getMoveAP():
	return self.MoveAP

func setDiscipline(discipline: int):
	self.Discipline = discipline

func getDiscipline():
	return self.Discipline

func setType(type: String):
	self.Type = type

func getType():
	return self.Type
