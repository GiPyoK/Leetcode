class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s == "" {
            return true
        }
        
        var characters = Array(s.lowercased())
        characters = characters.filter() { $0.isNumber || $0.isLetter }
        
        var i = 0
        var j = characters.count - 1
       
        while i < j {
            if characters[i] != characters [j] {
                return false
            }
            
            i += 1
            j -= 1
        }

        return true
    }
}