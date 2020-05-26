class Solution {
    func maxArea(_ height: [Int]) -> Int {
        // get most left and most right index
        var left: Int = 0
        var right: Int = height.count - 1
        
        // calculate water amount
        var water: Int = getWater(arr: height, left: left, right: right)
        
        // compare the current two lines and move smaller line inward
        while left < right {
            if height[left] < height[right] {
                left += 1
            } else if height[left] > height[right] {
                right -= 1
            } else if height[left] == height[right] {
                if height[left+1] < height[right-1] {
                    left += 1
                } else {
                    right -= 1
                }
            }
            
            let newWater = getWater(arr: height, left: left, right: right)
            if water < newWater {
                water = newWater
            }
        }
        return water
    }
    
    func getWater(arr: [Int], left: Int, right: Int) -> Int {
        let height: Int = arr[left] < arr[right] ? arr[left] : arr[right]
        let width: Int = right - left
        return height * width
    }
}
