class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        
        // version 1
        func dfs(_ target: Int,_ num: Int,_ output: inout [Int]) {
            if target > num {
                return
            }
            output.append(target)
            dfs(target*10, num, &output)
            if target % 10 != 9 {
                dfs(target + 1, num , &output)
            }
        }
        
        var output = [Int]()
        
        dfs(1, n, &output)
        return output
        
//         // version 2
//         func dfs(_ target: Int,_ num: Int,_ output: inout [Int]) {
//             if target <= num {
//                 output.append(target)
//                 for i in 0...9 {
//                     dfs(target*10 + i, num, &output)
//                 }
//             }
//         }
        
//         var output = [Int]()
//         for i in 1...9 {
//             dfs(i, n , &output)
//         }
//         return output
    }
}

