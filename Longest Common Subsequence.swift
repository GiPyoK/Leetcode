class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let n = text1.count+1
        let m = text2.count+1
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        let t1 = Array(text1)
        let t2 = Array(text2)
        
        for i in 1..<n {
            for j in 1..<m {
                if t1[i-1] == t2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        return dp[n-1][m-1]
    }
}