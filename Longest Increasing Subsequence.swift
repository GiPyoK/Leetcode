class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp: [Int] = Array(repeating: 1, count: nums.count)
        
        for i in 1..<nums.count {
            var max = 1
            for j in 0..<i {
                if nums[i] > nums[j], max < dp[j] + 1 {
                    max = dp[j] + 1
                }
            }
            dp[i] = max
        }
        
        print(dp)
        return dp.max()!
    }
}