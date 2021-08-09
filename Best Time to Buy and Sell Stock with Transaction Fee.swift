class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        // b[i] = max(s[i-1] - p[i], b[i-1])
        // s[i] = max(b[i-1] + p[i] - fee, s[i-1])
        
        var buy: Int = -prices[0]
        var sell: Int = 0
        
        for i in 1..<prices.count {
            buy = max(sell - prices[i], buy)
            sell = max(buy + prices[i] - fee, sell)
        }
        
        return sell
    }
}