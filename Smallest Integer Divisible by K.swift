class Solution {
    func smallestRepunitDivByK(_ K: Int) -> Int {
        var remainder = 1
        var lengthN = 1
        var remainderSet: Set = Set<Int>()
        
        while remainder % K != 0 {
            let N = remainder*10 + 1
            remainder = N % K
            lengthN += 1
            
            if remainderSet.contains(remainder) {
                return -1
            } else {
                remainderSet.insert(remainder)
            }
        }
        
        return lengthN
    }
}