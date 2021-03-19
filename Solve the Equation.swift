class Solution {
    func solveEquation(_ equation: String) -> String {
        
        // turn the equation string into 2 arrays (left side of the equation and right side of the equation)
        let equations = equation.split(separator: "=")
        let leftEquation = String(equations[0])
        let rightEquation = String(equations[1])
        
        var sums = [0, 0, 0, 0] // [left x sum, left int sum, right x sum, right int sum]
        var leftElements: [String] = []
        var numString: String = ""
        var isFirst: Bool = true
        for char in leftEquation {
            if isFirst && char != "-" {
                numString += "+"
            }
            numString += String(char)
            if !isFirst {
                if char == "+" || char == "-" {
                    let sign = String(numString.removeLast())
                    leftElements.append(numString)
                    numString = sign
                }
            }
            isFirst = false
        }
        leftElements.append(numString)
        
        
        var rightElements: [String] = []
        numString = ""
        isFirst = true
        for char in rightEquation {
            if isFirst && char != "-" {
                numString += "+"
            }
            numString += String(char)
            if !isFirst {
                if char == "+" || char == "-" {
                    let sign = String(numString.removeLast())
                    rightElements.append(numString)
                    numString = sign
                }
            }
            isFirst = false
        }
        rightElements.append(numString)
        
        // add up all the x coefficients and integers in each array
        let leftIntStrings = leftElements.filter({ !$0.contains("x") })
        let leftXStrings = leftElements.filter({ $0.contains("x") })
        let rightIntStrings = rightElements.filter({ !$0.contains("x") })
        let rightXStrings = rightElements.filter({ $0.contains("x") })
                
        var leftIntSum = 0
        var leftXSum = 0
        var rightIntSum = 0
        var rightXSum = 0
        
        for num in leftIntStrings {
            leftIntSum += Int(num)!
        }
        
        for num in rightIntStrings {
            rightIntSum += Int(num)!
        }
        
        for num in leftXStrings {
            var coef = num
            coef.removeLast()
            if coef.count == 1 {
                coef += "1"
            }
            leftXSum += Int(coef)!
        }
        
        for num in rightXStrings {
            var coef = num
            coef.removeLast()
            if coef.count == 1 {
                coef += "1"
            }
            rightXSum += Int(coef)!
        }
        
        // put all the x's on the left side of the array
        let x = leftXSum - rightXSum
        // put all the integers on the right side of the array
        var int = rightIntSum - leftIntSum
        
        // check if coefficeint of x is zero
        if x == 0 && int == 0 { return "Infinite solutions"}
        if x == 0 && int != 0 { return "No solution"}
        
        // divide int by x coefficient
        int = int/x
        
        return "x=\(int)"
    }
}