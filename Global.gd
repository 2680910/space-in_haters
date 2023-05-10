extends Node 

var bulletInstanceCount = 0 # Keeps track of how many bullet instances are current
var enemyBulletCount = 0
var enemyBulletInstanceCount = 0
var automaticFiring = false 
var saveFile = "user://save.dat"

var scoringInformation = {
	"currentScore": 0,
	"currentPlayer": "User",
	"highScores": [0,0,0],
	"highScorePlayersName" : "Winner"
}



