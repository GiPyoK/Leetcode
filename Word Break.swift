class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        var dp = Array(repeating: false, count: s.count+1)
        
        dp[0] = true
        
        for i in 1..<dp.count {
            for j in 0...i {
                let startIndex = s.index(s.startIndex, offsetBy: j)
                let endIndex = s.index(s.startIndex, offsetBy: i)
                let range = startIndex..<endIndex
                if dp[j] && wordDict.contains(String(s[range])) {
                    dp[i] = true
                    break
                }
            }
        }
        
        
        return dp[s.count]
    }
}