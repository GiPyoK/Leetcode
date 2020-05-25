class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        dict = {}
        
        num1 = nums[0]
        num2 = nums[0]
        
        while True:
            num1 = nums[num1]
            num2 = nums[nums[num2]]
            if num1 == num2:
                break
            
        num1 = nums[0]
        while num1 != num2:
            num1 = nums[num1]
            num2 = nums[num2]
        
        return num2