class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var len = 0
        var start = 0
        var subSet = Set<Character>()
        let sArr = Array(s)
        
        for end in 0..<sArr.count {
            while subSet.contains(sArr[end]) {
                subSet.remove(sArr[start])
                start += 1
            }
            subSet.insert(sArr[end])
            if subSet.count > len {
                len = subSet.count
            }  
        }
        return len
    }
}