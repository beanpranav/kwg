$GAME_TYPES = 
[
	# ['[MTM = 6,1] Each player has 6 projects & belongs to 1 team', 1],
	['[MTM = 6,2] Each player has 6 projects & belongs to 2 teams', 2],
	# ['[MTM = 6,3] Each player has 6 projects & belongs to 3 teams', 3],
	# ['[MTM = 6,4] Each player has 6 projects & belongs to 4 teams', 4],
	# ['[MTM = 6,5] Each player has 6 projects & belongs to 5 teams', 5],
	['[MTM = 6,6] Each player has 6 projects & belongs to 6 teams', 6],
	['[MTM = 3,3] Each player has 3 projects & belongs to 3 teams', 7]
]

$GAME_TYPES_LOOKUP = 
{
	1 => {
				name: 'MTM(n,v) = 6,1', 
				teams: 2, 
				project_split: [6,6], 
				membership_split: [[1,2,3,4],[5,6,7,8]]
				},
	2 => {
				name: 'MTM(n,v) = 6,2', 
				teams: 4, 
				project_split: [3,3,3,3], 
				membership_split: [[1,2,3,4],[5,6,7,8],[1,2,5,6],[3,4,7,8]]
				},
	3 => {
				name: 'MTM(n,v) = 6,3', 
				teams: 6, 
				project_split: [2,2,2,2,2,2], 
				membership_split: [[1,2,3,4],[5,6,7,8],[1,2,5,6],[3,4,7,8],[1,4,5,8],[2,3,6,7]]
				},
	4 => {
				name: 'MTM(n,v) = 6,4', 
				teams: 8, 
				project_split: [2,2,1,1,2,2,1,1], 
				membership_split: [[1,2,3,4],[5,6,7,8],[1,4,6,7],[2,3,5,8],[1,2,5,6],[3,4,7,8],[1,3,5,7],[2,4,6,8]]
				},
	5 => {
				name: 'MTM(n,v) = 6,5', 
				teams: 10,
				project_split: [2,1,1,1,1,2,1,1,1,1], 
				membership_split: [[2,3,6,7],[1,2,3,4],[5,6,7,8],[1,4,6,7],[2,3,5,8],[1,4,5,8],[1,2,5,6],[3,4,7,8],[1,3,5,7],[2,4,6,8]]
				 },
	6 => {
				name: 'MTM(n,v) = 6,6', 
				teams: 12,
				project_split: [1,1,1,1,1,1,1,1,1,1,1,1],
				membership_split: [[2,3,6,7],[1,2,3,4],[5,6,7,8],[1,4,6,7],[2,3,5,8],[1,2,7,8],[1,4,5,8],[1,2,5,6],[3,4,7,8],[1,3,5,7],[2,4,6,8],[3,4,5,6]]},
	7 => {
				name: 'MTM(n,v) = 3,3', 
				teams: 4,
				project_split: [1,1,1,1],
				membership_split: [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]}
}

$SKILL_NAMES = ["Product Dev", "Marketing", "Support", "R&D"]

$SKILL_SALARY = 
{
	# do work [order: PMSR]
	1 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	2 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	3 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	4 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	# learning skills [order: PMSR]
	11 => { 0 => 10, 1 => 20, 2 => 30, 3 => 40, 4 => 50},
	12 => { 0 => 10, 1 => 20, 2 => 30, 3 => 40, 4 => 50},
	13 => { 0 => 10, 1 => 20, 2 => 30, 3 => 40, 4 => 50},
	14 => { 0 => 10, 1 => 20, 2 => 30, 3 => 40, 4 => 50}
}

$SKILL_POINTS = 
{
	# do work [order: PMSR]
	1 => { 0 => 10, 1 => 20, 2 => 30, 3 => 40, 4 => 50},
	2 => { 0 => 10, 1 => 20, 2 => 30, 3 => 40, 4 => 50},
	3 => { 0 => 10, 1 => 20, 2 => 30, 3 => 40, 4 => 50},
	4 => { 0 => 10, 1 => 20, 2 => 30, 3 => 40, 4 => 50},
	# learning skills [order: PMSR]
	11 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	12 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	13 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	14 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500}
}

$SKILL_LEVELS = 
{
	0..200 => 0,
	201..500 => 1,
	501..1000 => 2,
	1001..2000 => 3,
	2001..10000 => 4
}

$SKILL_PRODUCTIVITY = 
{
	# do work [order: PMS]
	1 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	2 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	3 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	# do R&D [order: PMS]
	5 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	6 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500},
	7 => { 0 => 100, 1 => 200, 2 => 300, 3 => 400, 4 => 500}
}

$RND_STAGES = 
{
	0..400 => { stage_no: 1, multiplier_1: 0.30, multiplier_2: 0.20, multiplier_3: 0.50 },
	401..1600 => { stage_no: 2, multiplier_1: 0.60, multiplier_2: 0.50, multiplier_3: 0.80 },
	1601..4000 => { stage_no: 3, multiplier_1: 0.90, multiplier_2: 0.90, multiplier_3: 0.95 }
}

$RND_BENEFITS = ["Usefulness", "Desireability", "Satisfaction"]

$SUPPORTED_CONVERSION = 1
$UNSUPPORTED_CONVERSION = 0
$MARKET_CONVERSION = 1
$PRODUCT_UNIT_COST = 12
