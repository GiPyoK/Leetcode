class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        let sArray = Array(s)
        var index: Int = 0
        var rCounter = 0
        var lCounter = 0
        var splits = 0
        
        while index < sArray.count {
            
            let letter = sArray[index]
            
            if letter == "R" {
                rCounter += 1
            } else {
                lCounter += 1
            }
            
            if rCounter == lCounter {
                splits += 1
                rCounter = 0
                lCounter = 0
            }
            
            index += 1
        }
        
        return splits
    }
}