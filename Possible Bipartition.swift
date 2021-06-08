class Solution {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        // make adjancy map
        var adj = [Int: [Int]]()
        for i in 1...n {
            adj[i] = [Int]()
        }
        for node in dislikes {
            adj[node[0]]!.append(node[1])
            adj[node[1]]!.append(node[0])
        }
        
        // make visited array to label in two different groups
        var visited = Array(repeating: 0, count: n+1)
        
        for i in 1...n where visited[i] == 0 {
            if !canSeparate(&visited, i, 1, adj) {
                return false
            }
        }
        return true
    }
    
    func canSeparate(_ visited: inout [Int], _ start: Int, _ group: Int, _ adj: [Int: [Int]]) -> Bool {
        visited[start] = group

        for dislike in adj[start]! {
            if visited[dislike] == group {
                return false
            }
            if visited[dislike] == 0 && !canSeparate(&visited, dislike, -group, adj) {
                return false
            }
        }
            
        return true
    }
}