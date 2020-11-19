class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        let input: [Int] = Array(left...right)
        var output = [Int]()
        for dividend in input {
            let numberString: String = String(dividend)
            var isDivisible = true
            
            for digit in numberString {
                if digit == "0" { isDivisible = false; break }
                if dividend % Int(String(digit))! != 0 {
                    isDivisible = false
                    break
                }
            }
            
            if isDivisible {
                output.append(dividend)
            }
        }
        
        return output
    }
}