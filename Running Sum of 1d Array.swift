class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var sumArr: [Int] = [nums[0]]
        var index = 1
        var cache: [Int : Int] = [0 : nums[0]]
        
        while index < nums.count {
            var sum: Int = 0
            sum = cache[index-1]! + nums[index]
            cache[index] = sum
            sumArr.append(sum)
            index += 1
        }
        
        return sumArr
    }
}