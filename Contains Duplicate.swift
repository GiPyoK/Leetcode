class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        // count the original input length
        // convert the array into a set
        // count the length of the set
        // if the lengths are different return true
        // else return false

        let originalLength = nums.count
        let numsSet = Set(nums)
        let setLength = numsSet.count

        if (originalLength != setLength) {
            return true
        } else {
            return false
        }
    }
}