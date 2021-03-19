class Solution {
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        // if the given grid is smaller than 3x3 return 0
        if grid.count < 3 { return 0 }
        
        // referrence magic square set
        let oneThruNine: Set = [1,2,3,4,5,6,7,8,9]
        
        var magicSquareCount = 0
        
        for r in 0..<(grid.count-2) {
            for c in 0..<(grid[r].count-2) {
                // make a set with 3x3
                var numSet: Set = [grid[r][c], 
                                   grid[r][c+1], 
                                   grid[r][c+2], 
                                   grid[r+1][c], 
                                   grid[r+1][c+1], 
                                   grid[r+1][c+2], 
                                   grid[r+2][c], 
                                   grid[r+2][c+1], 
                                   grid[r+2][c+2]]
                // skip the current 3x3 if there are duplicate numbers
                if numSet.count != 9  { continue }
                // subtract the referrence set
                numSet.subtract(oneThruNine)
                // if the current 3x3 is a magic square, it should have 0 elements in the set
                if numSet.count != 0 { continue }
                // grab the first row as a refference
                let sum = grid[r][c] + grid[r][c+1] + grid[r][c+2]
                // check 2nd and 3rd row sums
                if sum == grid[r+1][c] + grid[r+1][c+1] + grid[r+1][c+2],
                    sum == grid[r+2][c] + grid[r+2][c+1] + grid[r+2][c+2],
                    // check column sums
                    sum == grid[r][c] + grid[r+1][c] + grid[r+2][c],
                    sum == grid[r][c+1] + grid[r+1][c+1] + grid[r+2][c+1],
                    sum == grid[r][c+2] + grid[r+1][c+2] + grid[r+2][c+2],
                    // check both diagonal sums
                    sum == grid[r][c] + grid[r+1][c+1] + grid[r+2][c+2],
                    sum == grid[r][c+2] + grid[r+1][c+1] + grid[r+2][c] {
                    // if all of the above condition is true, the current 3x3 is a magic square
                    magicSquareCount += 1
                }
            }
        }
        
        return magicSquareCount
    }
}