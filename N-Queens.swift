class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        // dfs
        func dfs(_ board: inout [[String]], _ col: Int, _ solutions: inout [[String]]) {
            
            // validating queen placement
                // for (i,j) given (x,y), not valid if
                // x,y is "Q" and
                // i == x, j == y, x+y == i+j, x+j == y+i
            func canPlaceQueen(_ board: [[String]], _ x: Int, _ y: Int) -> Bool {
                for j in 0..<board.count {
                    for i in 0..<board[j].count {
                        if board[j][i] == "Q", (x == i || y == j || x+y == i+j || x+j == y+i) {
                                return false
                        }
                    }
                }
                return true
            }
            
            
            // if row index is equal to board length,
            // then add the board to the solution
            // and return
            if col == board.count {
                var solution = [String]()
                for row in board {
                    solution.append(row.joined(separator: ""))
                }
                solutions.append(solution)
                return
            }
            
            // check if I can place the queen
                // if I can place the queen,
                // place the queen
                // call dfs on the next row
                // undo the placement of the queen
            for y in 0..<board.count {
                if canPlaceQueen(board, col, y) {
                    board[y][col] = "Q"
                    dfs(&board, col+1, &solutions)
                    board[y][col] = "."
                }
            }
        }
        
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        var solutions = [[String]]()
        dfs(&board, 0, &solutions)
        
        return solutions
    }
}