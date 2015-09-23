$GAME_TYPES = 
[
	['[MTM = 6,1] Each player has 6 projects & belongs to 1 team', 1],
	['[MTM = 6,2] Each player has 6 projects & belongs to 2 teams', 2],
	['[MTM = 6,3] Each player has 6 projects & belongs to 3 teams', 3],
	['[MTM = 6,4] Each player has 6 projects & belongs to 4 teams', 4],
	['[MTM = 6,5] Each player has 6 projects & belongs to 5 teams', 5],
	['[MTM = 6,6] Each player has 6 projects & belongs to 6 teams', 6]
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
				 membership_split: [[2,3,6,7],[1,2,3,4],[5,6,7,8],[1,4,6,7],[2,3,5,8],[1,2,7,8],[1,4,5,8],[1,2,5,6],[3,4,7,8],[1,3,5,7],[2,4,6,8],[3,4,5,6]]}
}
