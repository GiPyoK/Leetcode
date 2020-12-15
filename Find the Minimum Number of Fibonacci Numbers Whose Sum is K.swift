class Solution {
    func findMinFibonacciNumbers(_ k: Int) -> Int {
        // generate fibonacci number until K
        // store the fibonacci number in a hash table
        // starting from the largest value, subtract away the fib number from k and count the the fib number used
        
        var fibTable: [Int : Int] = [1: 1, 2: 1]
        
        var f0 = 1
        var f1 = 1
        var fn = 0
        var hashKey = 2
        
        while fn < k {
            // Generating fibonacci number until k or one after k
            fn = f0 + f1
            f0 = f1
            f1 = fn
            
            // Storing fibonacci number in fibTable
            hashKey += 1
            fibTable[hashKey] = fn
        }
        
        var sum = k
        var fibNumUsed: Int = 0
        
        print(fibTable)
        
        while sum > 0 {
            if let value = fibTable[hashKey], sum >= value {
                sum -= value
                fibNumUsed += 1
                print(sum)
            }
            hashKey -= 1
        }
        
        return fibNumUsed
    }
}