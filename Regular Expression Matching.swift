class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArr = Array(s)
        let pArr = Array(p)
        var dp = [Array<Character>: Bool]()
        return search(sArr, pArr, &dp)
    }
    
    func search(_ s: [Character], _ p: [Character], _ dp: inout [Array<Character>: Bool]) -> Bool {
        if p.isEmpty {
            return s.isEmpty
        }
        
        if dp.keys.contains(s+p) {
            return dp[s+p]!
        }
        
        var dpBool = false
        
        if p.count >= 2, p[1] == "*" {
            if s.isEmpty {
                dpBool = search(s, Array(p[2...]), &dp)
            } else {
                let firstMatch = (s[0] == p[0]) || (p[0] == ".")
                dpBool = search(s, Array(p[2...]), &dp) || (firstMatch && search(Array(s[1...]), p, &dp))
            }
            
        } else {
            if !s.isEmpty {
                if (s[0] == p[0]) || (p[0] == ".") {
                    dpBool = search(Array(s[1...]), Array(p[1...]), &dp)
                }
            }
        }
        dp[s+p] = dpBool
        return dpBool
    }
}