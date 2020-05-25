class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Convert nums array into a dictionary
        // key: int value, value: index
        var dict: [Int : [Int]] = [:]
        for i in nums.indices {
            if dict.keys.contains(nums[i]) {
                dict[nums[i]]!.append(i)
            } else {
                dict[nums[i]] = [i]
            }
        }
        //
        for key in dict.keys {
            if dict.keys.contains(target - key) {
                if key == target - key,
                    dict[key]!.count >= 2 {
                    return [dict[key]![0], dict[key]![1]]
                } else if key != target - key {
                    return [dict[key]![0], dict[target-key]![0]]
                }
            }
        }
        return []
    }
}