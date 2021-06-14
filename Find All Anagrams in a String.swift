class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.count < p.count {
            return []
        }
        
        // make hashtable using p, key: char, value: count
        var pDict = [Character : Int]()
        var diffCount = 0
        
        for c in p {
            if let cValue = pDict[c] {
                pDict[c] = cValue + 1
            } else {
                pDict[c] = 1
            }
            diffCount += 1
        }
        
        // Setup sliding window
        let sArr = Array(s)
        var output = [Int]()
        let anaLen = p.count
        var start = 0
        
        for end in 0..<s.count {
            // remove sArr[start] value from pDict
            if end - start >= anaLen {
                if let startValue = pDict[sArr[start]] {
                    pDict[sArr[start]] = startValue + 1
                    
                    if pDict[sArr[start]]! > 0 {
                        diffCount += 1
                    }
                }
                start += 1
            }
            
            // add sArr[end] value to pDict
            if let endValue = pDict[sArr[end]] {
                pDict[sArr[end]] = endValue - 1
                
                if pDict[sArr[end]]! >= 0 {
                    diffCount -= 1
                }
            }
            
            if diffCount == 0 {
                output.append(start)
            }
        }
        return output
    }
}