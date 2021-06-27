class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let n = word1.count + 1
        let m = word2.count + 1
        let w1 = Array(word1)
        let w2 = Array(word2)
        
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        for i in 0..<n {
            dp[i][0] = i
        }
        for j in 0..<m {
            dp[0][j] = j
        }
        
        for i in 1..<n {
            for j in 1..<m {
                if w1[i-1] == w2[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = 1 + min(dp[i][j-1], dp[i-1][j], dp[i-1][j-1])
                }
            }
        }
        return dp[n-1][m-1]
    }
}