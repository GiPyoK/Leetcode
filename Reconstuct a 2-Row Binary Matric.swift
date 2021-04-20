class Solution {
    func reconstructMatrix(_ upper: Int, _ lower: Int, _ colsum: [Int]) -> [[Int]] {

        var row1: [Int] = []
        var row2: [Int] = []
        var up = upper
        var low = lower
        
        for sum in colsum {
            if sum == 2 {
                row1.append(1)
                row2.append(1)
                up -= 1
                low -= 1
            } else if sum == 1 {
                if up >= low {
                    row1.append(1)
                    row2.append(0)
                    up -= 1
                } else {
                    row1.append(0)
                    row2.append(1)
                    low -= 1
                }
            } else {
                row1.append(0)
                row2.append(0)
            }
        }
        
        print(up)
        print(low)
        
        if up != 0 || low != 0 {
            return []
        }
        
        return [row1, row2]
    }
}