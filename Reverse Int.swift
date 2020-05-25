class Solution {
    func reverse(_ x: Int) -> Int {
        // split int to single digits
        // push to stack
        // pop integers
        // combine single digits to one int
        
        var isNegative: Bool = false
        if x < 0 {
            isNegative = true
        }
        
        let digitString = String(x)
        var digits = digitString.compactMap{$0.wholeNumberValue}
        
        var output: Int = 0
        for i in digits {
            output = output*10 + digits.removeLast()
        }
        
        if output > Int(pow(Double(2),Double(31))) - 1 || output <  -Int(pow(Double(2),Double(31))) {
            return 0
        }
        
        return isNegative ? -1*output : output
    }
}