extends Node


var Type: String
var UnitAmount: int
var Level: int
var HealthPoints: int
var MaxHealth: int
var ActionPoints: int
var MoveAP: int
var Discipline: int
var toHit: int
var evade: int
var damageReduction = [1,3]
var damage = [3,5]


func _init(type: String, level: int, hp: int, ap: int, moveAP: int, discipline:int, toHit: int, evade: int, damageReduction: Array, damage: Array):
	self.Type = type
	self.Level = level
	self.HealthPoints = hp
	self.ActionPoints = ap
	self.MoveAP = moveAP
	self.Discipline = discipline
	self.toHit = toHit
	self.evade = evade
	self.damageReduction = damageReduction
	self.damage = damage
	pass

func _ready():
	pass

func takeDamage(damage):
	for i in damage:
		HealthPoints -= damage
		if HealthPoints <= 0:
			UnitAmount -= 1
			HealthPoints = MaxHealth
		if UnitAmount <= 0:
			break
	pass

func attack(defender):
	var effectiveToHit = toHit-defender.evade #berechnet die effektive trefferwahrscheinlickeit
	var damagereduction = rand_range(defender.damageReduction[0], defender.damageReduction[1])
	var effectiveDamage = rand_range(self.damage[0], self.damage[1]) - damagereduction
	if (rand_range(1,100) < effectiveToHit):
		defender.takeDamage(effectiveDamage)
	pass

func setLevel(level: int):
	self.Level = level

func getLevel():
	return self.Level
	

func setupCombat(attack, defender):
	pass

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
