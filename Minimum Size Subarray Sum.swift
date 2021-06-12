class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var start = 0
        var sum = 0
        var shortestLen = Int.max
        
        for end in 0..<nums.count {
            sum += nums[end]
            
            while sum >= target {
                let newLen = 1 + end - start
                // since we are looking for the minimal length, we can return if 1
                if newLen == 1 { return 1 }
                if newLen < shortestLen { shortestLen = newLen }
                
                sum -= nums[start]
                start += 1
            }
        }
        
        return shortestLen == Int.max ? 0 : shortestLen
    }
}