$GAME_TYPES = 
[
	['N = 4; GS = 4; MTM(n,v) = 3,1', 1],
	['N = 8; GS = 4; MTM(n,v) = 3,1', 2],
	['N = 8; GS = 8; MTM(n,v) = 3,1', 3],
	# ['N = 8; GS = 4; MTM(n,v) = 3,3', 4],
	['N = 4; GS = 3; MTM(n,v) = 3,3', 5]
]

$GAME_TYPES_LOOKUP = 
{
	1 => {
				name: 'N= 4; GS= 4; MTM(n,v)=3,1', 
				teams: 1, 
				project_split: [3],
				group_size: 4, 
				membership_split: [[1,2,3,4]]
				},
	2 => {
				name: 'N= 8; GS= 4; MTM(n,v)=3,1',
				teams: 2, 
				project_split: [3,3],
				group_size: 4, 
				membership_split: [[1,2,3,4],[5,6,7,8]]
				},
	3 => {
				name: 'N= 8; GS= 8; MTM(n,v)=3,1',
				teams: 1, 
				project_split: [3],
				group_size: 8, 
				membership_split: [[1,2,3,4,5,6,7,8]]
				},
	4 => {
				name: 'N= 4; GS= 3; MTM(n,v)=3,3', 
				teams: 4,
				project_split: [1,1,1,1],
				group_size: 3,
				membership_split: [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
				},
	5 => {
				name: 'N= 8; GS= 4; MTM(n,v)=3,3', 
				teams: 6, 
				project_split: [1,1,1,1,1,1],
				group_size: 4,
				membership_split: [[1,2,3,4],[5,6,7,8],[1,2,5,6],[3,4,7,8],[1,4,5,8],[2,3,6,7]]
				}
}

$SKILL_NAMES = ["App Dev", "Marketing", "Support", "R&D"]

$SKILL_SALARY = 
{
	# do work [order: PMSR]
	1 => { 1 => 75, 2 => 150, 3 => 225, 4 => 300, 5 => 400, 6 => 500},
	2 => { 1 => 75, 2 => 150, 3 => 225, 4 => 300, 5 => 400, 6 => 500},
	3 => { 1 => 75, 2 => 150, 3 => 225, 4 => 300, 5 => 400, 6 => 500},
	4 => { 1 => 75, 2 => 150, 3 => 225, 4 => 300, 5 => 400, 6 => 500}
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

$SKILL_LEVELS_NAMES = 
{
	1 => "Novice",
	2 => "Advanced",
	3 => "Advanced",
	4 => "Expert",
	5 => "Expert",
	6 => "Expert"
}

$SKILL_PRODUCTIVITY = 
{
	# do work [order: PMS]
	1 => { 1 => 75, 2 => 150, 3 => 250, 4 => 375, 5 => 450, 6 => 500},
	2 => { 1 => 75, 2 => 150, 3 => 250, 4 => 375, 5 => 450, 6 => 500},
	3 => { 1 => 75, 2 => 150, 3 => 250, 4 => 375, 5 => 450, 6 => 500},
	4 => { 1 => 75, 2 => 150, 3 => 250, 4 => 375, 5 => 450, 6 => 500}
	# # do R&D [order: PMS]
	# 5 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	# 6 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600},
	# 7 => { 1 => 100, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600}
}

$RND_STAGES = 
{
	1..400 => { stage_no: 1, multiplier_1: 0.30, multiplier_2: 0.20, multiplier_3: 0.50 },
	401..1600 => { stage_no: 2, multiplier_1: 0.60, multiplier_2: 0.50, multiplier_3: 0.80 },
	1601..4000 => { stage_no: 3, multiplier_1: 0.80, multiplier_2: 0.75, multiplier_3: 0.95 },
	4001..12000 => { stage_no: 4, multiplier_1: 0.95, multiplier_2: 0.95, multiplier_3: 0.99 },
	12001..30000 => { stage_no: 5, multiplier_1: 1, multiplier_2: 1, multiplier_3: 1 }
}

$STATS_NAMES = ["Max User Capacity", "Demand Generated", "Users Supported", "Selected R&D Area"]
$RND_BENEFITS = ["Technical Stability", "App Desireability", "User Satisfaction"]


$SUPPORTED_CONVERSION = 0.9
$UNSUPPORTED_CONVERSION = 0.2
$MARKET_CONVERSION = 1
$PRODUCT_UNIT_COST = 8 #12


$HELP_TEXT = 
{
	"max_user_capacity" => "Cumulative number of users your app can serve. Affected by app's App Dev and technical stability.",
	"demand_generated" => "Potential app sales forcasted for this quarter. Affected by app's marketing and desireability.",
	"users_supported" => "Number of users supported in this quarter. Affected by app's support and user satisfaction.",
	"active_users" => "Cumulative number of paying users of your app.",
	0 => "text 1",
	1 => "text 1",
	2 => "text 1"
}
