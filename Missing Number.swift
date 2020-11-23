class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        
        var rangeDict: [Int:Int] = [:]
        
        for num in nums {
            rangeDict[num] = num + 1
        }
        
        var nextNumber = 0
        while true {
            if let num = rangeDict[nextNumber] {
                nextNumber = num
            } else {
                return nextNumber
            }
        }
        
        return 0
        
    }
}