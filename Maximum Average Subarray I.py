class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        biggest = sub_sum = sum(nums[:k])
        index = 1 
        
        while index + k <= len(nums):
            sub_sum = sub_sum - nums[index-1] + nums[index + k - 1]
            if biggest < sub_sum:
                biggest = sub_sum
                
            index += 1
        
        return biggest / k
        