$GAME_TYPES = 
[
	['GS = 3; N = 3; MTM(n,v) = 2,1', 31],
	['GS = 3; N = 6; MTM(n,v) = 2,1', 32],
	['GS = 3; N = 6; MTM(n,v) = 2,2', 35],
	# ['GS = 3; N = 4; MTM(n,v) = 3,3', 36],
	['GS = 4; N = 4; MTM(n,v) = 3,1', 43],
	# ['GS = 4; N = 8; MTM(n,v) = 3,1', 44],
	# ['GS = 4; N = 8; MTM(n,v) = 3,3', 46],
	['GS = 6; N = 6; MTM(n,v) = 2,1', 61]
	# ['GS = 6; N = 12; MTM(n,v) = 2,1', 62],
	# ['GS = 8; N = 8; MTM(n,v) = 3,1', 83]
]

$GAME_TYPES_LOOKUP = 
{
	31 => {
				name: 'GS= 3; N= 3; MTM(n,v)=2,1', 
				group_size: 3,
				n: 3,
				teams: 1, 
				project_split: [2], 
				membership_split: [[1,2,3]]
				},
	32 => {
				name: 'GS= 3; N= 6; MTM(n,v)=2,1', 
				group_size: 3,
				n: 6,
				teams: 2, 
				project_split: [2,2], 
				membership_split: [[1,2,3],[4,5,6]]
				},
	35 => {
				name: 'GS= 3; N= 6; MTM(n,v)=2,2', 
				group_size: 3,
				n: 6,
				teams: 4,
				project_split: [1,1,1,1],
				membership_split: [[1,2,6],[1,4,5],[2,3,5],[3,4,6]]
				},
	36 => {
				name: 'GS= 3; N= 4; MTM(n,v)=3,3', 
				group_size: 3,
				n: 4,
				teams: 4,
				project_split: [1,1,1,1],
				membership_split: [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
				},
	43 => {
				name: 'GS= 4; N= 4; MTM(n,v)=3,1', 
				group_size: 4,
				n: 4,
				teams: 1, 
				project_split: [3], 
				membership_split: [[1,2,3,4]]
				},
	44 => {
				name: 'GS= 4; N= 8; MTM(n,v)=3,1',
				group_size: 4,
				n: 8,
				teams: 2, 
				project_split: [3,3], 
				membership_split: [[1,2,3,4],[5,6,7,8]]
				},
	46 => {
				name: 'GS= 4; N= 8; MTM(n,v)=3,3', 
				group_size: 4,
				n: 8,
				teams: 6, 
				project_split: [1,1,1,1,1,1],
				membership_split: [[1,2,3,4],[5,6,7,8],[1,2,5,6],[3,4,7,8],[1,4,5,8],[2,3,6,7]]
				},
	61 => {
				name: 'GS= 6; N= 6; MTM(n,v)=2,1', 
				group_size: 6,
				n: 6,
				teams: 1, 
				project_split: [2], 
				membership_split: [[1,2,3,4,5,6]]
				},
	62 => {
				name: 'GS= 6; N= 12; MTM(n,v)=2,1', 
				group_size: 6,
				n: 12,
				teams: 2, 
				project_split: [2,2], 
				membership_split: [[1,2,3,4,5,6],[7,8,9,10,11,12]]
				},
	83 => {
				name: 'GS= 8; N= 8; MTM(n,v)=3,1',
				group_size: 8,
				n: 8,
				teams: 1, 
				project_split: [3], 
				membership_split: [[1,2,3,4,5,6,7,8]]
				}
}


$SKILL_LEVELS = 
{
	1..300 => 1,
	301..600 => 2,
	601..1000 => 3,
	1001..1500 => 4,
	1501..2500 => 5,
	2501..5000 => 6
}

$SKILL_LEVELS_NAMES = 
{
	1 => { icon: "N", name: "Novice" },
	2 => { icon: "A1", name: "Advanced" },
	3 => { icon: "A2", name: "Advanced" },
	4 => { icon: "E1", name: "Expert" },
	5 => { icon: "E2", name: "Expert" },
	6 => { icon: "E3", name: "Expert" }
}

$SKILL_NAMES = ["App Dev", "Marketing", "Support", "R&D"]

$SKILL_POINTS = 
{
	# do work [order: PMSR]
	1 => 10, 2 => 10, 3 => 10, 4 => 10,
	# learning skills [order: PMSR]
	11 => 100, 12 => 100, 13 => 100, 14 => 100
}

$SKILL_SALARY = 
{
	# do work [order: PMSR]
	1 => { 1 => 240, 2 => 480, 3 => 660, 4 => 900, 5 => 1200, 6 => 1500},
	2 => { 1 => 240, 2 => 480, 3 => 660, 4 => 900, 5 => 1200, 6 => 1500},
	3 => { 1 => 240, 2 => 480, 3 => 660, 4 => 900, 5 => 1200, 6 => 1500},
	4 => { 1 => 240, 2 => 480, 3 => 660, 4 => 900, 5 => 1200, 6 => 1500}
}

$SKILL_PRODUCTIVITY = 
{
	# do work [order: PMS]
	1 => { 1 => 240, 2 => 480, 3 => 720, 4 => 1140, 5 => 1380, 6 => 1500},
	2 => { 1 => 240, 2 => 480, 3 => 720, 4 => 1140, 5 => 1380, 6 => 1500},
	3 => { 1 => 240, 2 => 480, 3 => 720, 4 => 1140, 5 => 1380, 6 => 1500},
	4 => { 1 => 240, 2 => 480, 3 => 720, 4 => 1140, 5 => 1380, 6 => 1500}
}

$RND_STAGES = 
{
	1..300 => { stage_no: 1, multiplier_1: 0.30, multiplier_2: 0.20, multiplier_3: 0.50 },
	301..1000 => { stage_no: 2, multiplier_1: 0.60, multiplier_2: 0.50, multiplier_3: 0.80 },
	1001..2000 => { stage_no: 3, multiplier_1: 0.80, multiplier_2: 0.75, multiplier_3: 0.95 },
	2001..4000 => { stage_no: 4, multiplier_1: 0.95, multiplier_2: 0.95, multiplier_3: 0.99 },
	4001..8000 => { stage_no: 5, multiplier_1: 1, multiplier_2: 1, multiplier_3: 1 }
}

$STATS_NAMES = ["Max User Capacity", "Demand Generated", "Users Supported", "Selected R&D Area"]
$RND_BENEFITS = ["Technical Stability", "App Desireability", "User Satisfaction"]


$SUPPORTED_CONVERSION = 0.9
$UNSUPPORTED_CONVERSION = 0.2
$MARKET_CONVERSION = 1
$PRODUCT_UNIT_COST = 10


$HELP_TEXT = 
{
	# Stats text
	"max_user_capacity" => "Cumulative number of users your app can serve. Affected by app's App Dev and technical stability.",
	"demand_generated" => "Potential app sales forcasted for this quarter. Affected by app's marketing and desireability.",
	"users_supported" => "Number of users supported in this quarter. Affected by app's support and user satisfaction.",
	"active_users" => "Cumulative number of paying users of your app.",
	# R&D text
	0 => "text 1",
	1 => "text 1",
	2 => "text 1"
}
