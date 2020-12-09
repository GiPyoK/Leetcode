class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var output: [[Int]] = []
        var arr = nums
        
        permute(nums: &arr, left: 0, right: nums.count-1, output: &output)
        
        return output
    }
    
    func permute(nums: inout [Int], left: Int, right: Int, output: inout [[Int]]) {
        if left == right {
            output.append(nums)
        } else {
            for i in left...right {
                nums.swapAt(left, i)
                permute(nums: &nums, left: left+1, right: right, output: &output)
                nums.swapAt(left, i)
            }
        }
    }
}