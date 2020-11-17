class Solution {
    func distributeCandies(_ candies: [Int]) -> Int {
        let uniqueCandies = Set(candies)
        
        if uniqueCandies.count <= candies.count / 2 {
            return uniqueCandies.count
        } else  {
            return candies.count / 2
        }
    }
}