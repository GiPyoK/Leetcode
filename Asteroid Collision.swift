class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var outputArr = [Int]()

        for ast in asteroids {
            if outputArr.isEmpty || outputArr.last! < 0 || (outputArr.last! > 0 && ast > 0) {
                outputArr.append(ast)
                continue
            }
            
            var hasCollided = false
            while outputArr.count > 0 && outputArr.last! > 0 {
                if outputArr.last! < -ast {
                    outputArr.removeLast()
                    continue
                } else if outputArr.last! > -ast {
                    hasCollided = true
                    break
                } else if outputArr.last! + ast == 0 {
                    outputArr.removeLast()
                    hasCollided = true
                    break
                }
            }
            if !hasCollided {
                outputArr.append(ast)
            }
        }
        return outputArr
    }
}