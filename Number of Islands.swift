class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        // get copy of grid to mutate islands
        var gridCopy = grid
        
        // setup count variable
        var count: Int = 0
        
        // define dfs
        func findIsland(_ grid: inout [[Character]], _ x: Int, _ y: Int) {
            // if it hits water or goes out of bounds, return
            if !(0..<grid.count).contains(y) || !(0..<grid[0].count).contains(x) || grid[y][x] == "0" {
                return
            }
        
            // turn island into water
            grid[y][x] = "0"    
        
            // recurse over all 4 directions
            findIsland(&grid, x+1, y) // East
            findIsland(&grid, x-1, y) // West
            findIsland(&grid, x, y+1) // North
            findIsland(&grid, x, y-1) // South
        }
        
        // go through all the grid
        for y in 0..<gridCopy.count {
            for x in 0..<gridCopy[0].count {
                // check for any islands
                if gridCopy[y][x] == "1" {
                    // if we land on a island, call dfs and increament the counter
                    findIsland(&gridCopy, x, y)
                    count += 1
                }
                
            }
        }
        
        return count
    }
}