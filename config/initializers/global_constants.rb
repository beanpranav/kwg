$GAME_TYPES = 
[
	# ['[MTM = 6,1] Each player has 6 projects & belongs to 1 team', 1],
	# ['[MTM = 6,2] Each player has 6 projects & belongs to 2 teams', 2],
	# ['[MTM = 6,3] Each player has 6 projects & belongs to 3 teams', 3],
	# ['[MTM = 6,4] Each player has 6 projects & belongs to 4 teams', 4],
	# ['[MTM = 6,5] Each player has 6 projects & belongs to 5 teams', 5],
	# ['[MTM = 6,6] Each player has 6 projects & belongs to 6 teams', 6],
	# ['[MTM = 3,3] Each player has 3 projects & belongs to 3 teams', 7],
	['[MTM = 3,1] Each player has 3 projects & belongs to 1 team', 8],
	['[MTM = 3,3] Each player has 3 projects & belongs to 3 teams', 9]
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
				name: 'MTM(n,v) = 3,3 @3', 
				teams: 4,
				project_split: [1,1,1,1],
				membership_split: [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
				},
	8 => {
				name: 'MTM(n,v) = 3,1',
				teams: 2, 
				project_split: [3,3], 
				membership_split: [[1,2,3,4],[5,6,7,8]]
				},
	9 => {
				name: 'MTM(n,v) = 3,3', 
				teams: 6, 
				project_split: [1,1,1,1,1,1], 
				membership_split: [[1,2,3,4],[5,6,7,8],[1,2,5,6],[3,4,7,8],[1,4,5,8],[2,3,6,7]]
				}
}

$SKILL_NAMES = ["Product Dev", "Marketing", "Support", "R&D"]

$SKILL_SALARY = 
{
	# do work [order: PMSR]
	1 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	2 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	3 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	4 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	# learning skills [order: PMSR]
	11 => { 1 => 10, 2 => 20, 3 => 30, 4 => 40, 5 => 50, 6 => 60},
	12 => { 1 => 10, 2 => 20, 3 => 30, 4 => 40, 5 => 50, 6 => 60},
	13 => { 1 => 10, 2 => 20, 3 => 30, 4 => 40, 5 => 50, 6 => 60},
	14 => { 1 => 10, 2 => 20, 3 => 30, 4 => 40, 5 => 50, 6 => 60}
}

$SKILL_POINTS = 
{
	# do work [order: PMSR]
	1 => { 1 => 10, 2 => 20, 3 => 25, 4 => 30, 5 => 35, 6 => 40},
	2 => { 1 => 10, 2 => 20, 3 => 25, 4 => 30, 5 => 35, 6 => 40},
	3 => { 1 => 10, 2 => 20, 3 => 25, 4 => 30, 5 => 35, 6 => 40},
	4 => { 1 => 10, 2 => 20, 3 => 25, 4 => 30, 5 => 35, 6 => 40},
	# learning skills [order: PMSR]
	11 => { 1 => 70, 2 => 150, 3 => 250, 4 => 310, 5 => 360, 6 => 400},
	12 => { 1 => 70, 2 => 150, 3 => 250, 4 => 310, 5 => 360, 6 => 400},
	13 => { 1 => 70, 2 => 150, 3 => 250, 4 => 310, 5 => 360, 6 => 400},
	14 => { 1 => 70, 2 => 150, 3 => 250, 4 => 310, 5 => 360, 6 => 400}
}

$SKILL_LEVELS = 
{
	1..200 => 1,
	201..500 => 2,
	501..2000 => 3,
	2001..4000 => 4,
	4001..10000 => 5,
	10001..50000 => 6
}

$SKILL_PRODUCTIVITY = 
{
	# do work [order: PMS]
	1 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	2 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	3 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	# do R&D [order: PMS]
	5 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	6 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	7 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600}
}

$RND_STAGES = 
{
	1..400 => { stage_no: 1, multiplier_1: 0.30, multiplier_2: 0.20, multiplier_3: 0.50 },
	401..1600 => { stage_no: 2, multiplier_1: 0.60, multiplier_2: 0.50, multiplier_3: 0.80 },
	1601..4000 => { stage_no: 3, multiplier_1: 0.90, multiplier_2: 0.90, multiplier_3: 0.95 },
	4001..12000 => { stage_no: 4, multiplier_1: 0.99, multiplier_2: 0.99, multiplier_3: 0.99 }
}

$RND_BENEFITS = ["Usefulness", "Desireability", "Satisfaction"]

$SUPPORTED_CONVERSION = 1
$UNSUPPORTED_CONVERSION = 0
$MARKET_CONVERSION = 1
$PRODUCT_UNIT_COST = 12
