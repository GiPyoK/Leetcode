class Solution {
    func climbStairs(_ n: Int) -> Int {
        var cach = [Int : Int]()
        
        cach[1] = 1
        cach[2] = 2
        
        func calcStairs(_ n: Int, _ cach: inout [Int : Int]) -> Int{
            if let num = cach[n] {
                return num
            } else {
                cach[n] = calcStairs(n-1, &cach) + calcStairs(n-2, &cach)
                return cach[n]!
            }
        }
        
        return calcStairs(n, &cach)
    }
}