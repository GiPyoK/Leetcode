class Solution {
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        
        let max = amount + 1
        var dp: [Int] = Array(repeating: max, count: max)
        dp[0] = 0
        
        for i in 1...amount {
            for j in 0..<coins.count {
                if coins[j] <= i {
                    dp[i] = min(dp[i], dp[i - coins[j]] + 1)
                }
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
}