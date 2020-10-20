// Given an array nums of n integers, are there elements a, b, c in nums
// such that a + b + c = 0?
// Find all unique triplets in the array which gives the sum of zero

// Notice that the solution set must not contain duplicate triplets.

// input: [Int]
// output: [[Int]]

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // put the values in the dictionary [num : 0 - num]
        // [-1,0,1,2,-1,-4]
        // num1Dict = [num1 : 0 - num1], [-1 : 1]
        // num2Dict = [num2 : num1Dict[num1] - num2], [0 : 1] , [1 : 0], [2 : -1], ...
        // num3Dict = [num3 : count]
        }
    }
}