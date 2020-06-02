// Given two positive integers x and y,
// an integer is powerful if it is equal to x^i + y^j
// for some integers i >= 0 and j >= 0.

// Return a list of all powerful integers that have value less than or equal to bound.

// You may return the answer in any order. 
// In your answer, each value should occur at most once.

class Solution {
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        let maxI = x == 1 ? 1 : Int(log(Double(bound))/log(Double(x)))
        let maxJ = y == 1 ? 1 : Int(log(Double(bound))/log(Double(y)))
        var res = Set<Int>()

        for i in 0..<maxI+1 {
            for j in 0..<maxJ+1 {
                let ans = Int(pow(Double(x), Double(i)) + pow(Double(y), Double(j)))
                if ans <= bound{ 
                    res.insert(ans)
                }
            }
        }
        return Array(res)
    }
}