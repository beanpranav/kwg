$GAME_TYPES = 
[
	['N = 2; GS = 2; MTM(n,v) = 2,1', 21],
	['N = 3; GS = 3; MTM(n,v) = 2,1', 31],
	['N = 4; GS = 2; MTM(n,v) = 2,2', 25],
	['N = 5; GS = 5; MTM(n,v) = 2,1', 51],
	['N = 6; GS = 3; MTM(n,v) = 2,2', 35]
	# ['GS = 3; N = 4; MTM(n,v) = 3,3', 36],
	# ['GS = 4; N = 4; MTM(n,v) = 3,1', 41],
	# ['GS = 4; N = 8; MTM(n,v) = 3,3', 46],
]

$GAME_TYPES_LOOKUP = 
{
	21 => {
				name: 'N= 2; GS= 2; MTM(n,v)=2,1', 
				group_size: 2,
				n: 2,
				teams: 1,
				project_split: [2],
				membership_split: [[1,2]]
				},
	25 => {
				name: 'N= 4; GS= 2; MTM(n,v)=2,2', 
				group_size: 2,
				n: 4,
				teams: 4,
				project_split: [1,1,1,1],
				membership_split: [[1,2],[2,3],[3,4],[1,4]]
				},
	31 => {
				name: 'N= 3; GS= 3; MTM(n,v)=2,1', 
				group_size: 3,
				n: 3,
				teams: 1, 
				project_split: [2], 
				membership_split: [[1,2,3]]
				},
	35 => {
				name: 'N= 6; GS= 3; MTM(n,v)=2,2', 
				group_size: 3,
				n: 6,
				teams: 4,
				project_split: [1,1,1,1],
				membership_split: [[1,2,6],[1,4,5],[2,3,5],[3,4,6]]
				},
	36 => {
				name: 'N= 4; GS= 3; MTM(n,v)=3,3', 
				group_size: 3,
				n: 4,
				teams: 4,
				project_split: [1,1,1,1],
				membership_split: [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
				},
	41 => {
				name: 'N= 4; GS= 4; MTM(n,v)=3,1', 
				group_size: 4,
				n: 4,
				teams: 1, 
				project_split: [3], 
				membership_split: [[1,2,3,4]]
				},
	46 => {
				name: 'N= 8; GS= 4; MTM(n,v)=3,3', 
				group_size: 4,
				n: 8,
				teams: 6, 
				project_split: [1,1,1,1,1,1],
				membership_split: [[1,2,3,4],[5,6,7,8],[1,2,5,6],[3,4,7,8],[1,4,5,8],[2,3,6,7]]
				},
	51 => {
				name: 'N= 5; GS= 5; MTM(n,v)=2,1', 
				group_size: 5,
				n: 5,
				teams: 1, 
				project_split: [2], 
				membership_split: [[1,2,3,4,5]]
				}
}


$SKILL_LEVELS = 
{
	1..200 => 1,
	201..400 => 2,
	401..600 => 3,
	601..900 => 4,
	901..1200 => 5,
	1201..5000 => 6
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
	1 => { 1 => 2400, 2 => 4800, 3 => 6600, 4 => 9000, 5 => 12000, 6 => 15000},
	2 => { 1 => 2400, 2 => 4800, 3 => 6600, 4 => 9000, 5 => 12000, 6 => 15000},
	3 => { 1 => 2400, 2 => 4800, 3 => 6600, 4 => 9000, 5 => 12000, 6 => 15000},
	4 => { 1 => 2400, 2 => 4800, 3 => 6600, 4 => 9000, 5 => 12000, 6 => 15000}
}

$SKILL_PRODUCTIVITY = 
{
	# do work [order: PMS]
	1 => { 1 => 2400, 2 => 4800, 3 => 7200, 4 => 11400, 5 => 13800, 6 => 15000},
	2 => { 1 => 2400, 2 => 4800, 3 => 7200, 4 => 11400, 5 => 13800, 6 => 15000},
	3 => { 1 => 2400, 2 => 4800, 3 => 7200, 4 => 11400, 5 => 13800, 6 => 15000},
	4 => { 1 => 1200, 2 => 2400, 3 => 3600, 4 => 5700, 5 => 6900, 6 => 7500}
}

$RND_STAGES = 
{
	1..1000 => { stage_no: 1, multiplier_1: 0.30, multiplier_2: 0.20, multiplier_3: 0.50 },
	1001..2500 => { stage_no: 2, multiplier_1: 0.60, multiplier_2: 0.50, multiplier_3: 0.80 },
	2501..5500 => { stage_no: 3, multiplier_1: 0.80, multiplier_2: 0.75, multiplier_3: 0.95 },
	5501..10000 => { stage_no: 4, multiplier_1: 0.95, multiplier_2: 0.95, multiplier_3: 0.99 },
	10001..30000 => { stage_no: 5, multiplier_1: 1, multiplier_2: 1, multiplier_3: 1 }
}

$STATS_NAMES = ["Max User Capacity", "Demand Generated", "Users Supported", "R&D Area Selected"]
$RND_BENEFITS = ["Technical Stability", "App Desireability", "User Satisfaction"]


$SUPPORTED_CONVERSION = 0.9
$UNSUPPORTED_CONVERSION = 0.2
$MARKET_CONVERSION = 1
$PRODUCT_UNIT_COST = 10
$STARTING_INVESTMENT = 20000


$HELP_TEXT = 
{
	# Stats text
	"max_user_capacity" => "Cumulative number of users your app can serve. Affected by app's App Dev and technical stability.",
	"demand_generated" => "Potential app sales forcasted for this quarter. Affected by app's marketing and desireability.",
	"users_supported" => "Number of users supported in this quarter. Affected by app's support and user satisfaction.",
	"active_users" => "Cumulative number of paying users of your app.",
	# R&D text
	0 => "Indirectly improves Max User Capacity",
	1 => "Indirectly improves Demand Generated",
	2 => "Indirectly improves Users Supported"
}

$PROTIP =
{
	0 => { id: 0, text: ""},
	1 => { id: 1, text: "<b>PRO TIP 1: Make sure you are talking to all your team members - else you will be handicapped.</b>"},
	2 => { id: 1, text: "<b>PRO TIP 2: Q1 needs no Support!</b><br>You only need to support your active users. You'll have active users only after Q1 ends."},
	3 => { id: 1, text: "<b>PRO TIP 3: Balance learning with task work.</b><br>More learning is good: It makes you more productive BUT it also makes you a costly resource. Importantly, it takes away time from revenue generating tasks. You don’t want your projects to be in debt!"},
	4 => { id: 0, text: ""},
	5 => { id: 1, text: "<b>PRO TIP 4: Develop and coordinate skill expertise across your team!</b><br>Some of you might choose to become experts on specific skills, while others might choose to be 'jack of all trades, master of none'. BUT Knowing which skills your team members ARE GOOD at makes coordination easier. </b>"},
	6 => { id: 1, text: "<b>PRO TIP 5: Optimize your support!</b><br>Remember supported customers are more likely to pay every quarter. So don't leave them hanging. BUT, putting in more support time than active users will just be a waste of your time and your team's money"},
	7 => { id: 0, text: ""},
	8 => { id: 1, text: "<b>PRO TIP 6: Doing R&D for projects makes your work more effective!</b><br>It acts as a multiplier to all your task efforts BUT too much of R&D spending and your project profits will tank!"},
	9 => { id: 0, text: ""},
	10 => { id: 0, text: ""},
	11 => { id: 1, text: "<b>PRO TIP 7: Last Quarter Focus</b><br>Work on tasks that will get you profits - DON'T spend time and money on learning or R&D tasks!"},
	12 => { id: 0, text: ""},
	13 => { id: 0, text: ""}
}
