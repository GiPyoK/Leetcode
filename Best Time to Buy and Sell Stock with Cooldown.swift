class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy = Int.min
        var sell = 0
        var rest = 0

        for (index, price) in prices.enumerated() {
            let lastSell = sell
            sell = max(buy + price, sell)
            buy = max(buy, rest - price)
            rest = lastSell
        }

        return max(sell, rest)
    }
}