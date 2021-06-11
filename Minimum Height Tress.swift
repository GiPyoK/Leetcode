// 1st attempt: Calculating the depth of the tree by performing BFS for each node.
//              The algorithm works, but exceeds the time limit. Need more time efficient solution. 

// class Solution {
//     func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
//         // make the adjacency map (2 ways)
//         var adj = [Int : [Int]]()
        
//         for node in 0..<n {
//             adj[node] = [Int]()
//         }
//         for edge in edges {
//             adj[edge[0]]!.append(edge[1])
//             adj[edge[1]]!.append(edge[0])
//         }
        
//         var output = [(Int,Int)]()
        
//         // for each node,
//         for node in adj.keys {
//             // Perform BFS from the root
//             let minHeight = bfs(node, adj)
            
//             if output.isEmpty {
//                 output.append((node,minHeight))
//             } else if output[0].1 > minHeight {
//                 output = [(node, minHeight)]
//             } else if output[0].1 == minHeight {
//                 output.append((node, minHeight))
//             }
//         }
//         return output.map { $0.0 }
//     }
    
//     // start bfs from the root and return the height level
//     func bfs(_ root: Int, _ adj: [Int:[Int]]) -> Int {
//         var visited = Set<Int>()
//         var queue = [Int]()
//         var height: Int = 0
        
//         queue.insert(root, at: 0)
        
//         while !queue.isEmpty {
//             var levelSize = queue.count
            
//             while levelSize > 0 {
//                 levelSize -= 1
                
//                 let node = queue.popLast()!
//                 visited.insert(node)
                
//                 // enqueue neighbor nodes
//                 for neighbor in adj[node]! where !visited.contains(neighbor) {
//                     queue.insert(neighbor, at: 0)
//                 }
//             }
//             height += 1
//         }
//         return height
//     }
// }

// removing leaf solution
class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        // make the adjacency map (2 ways)
        var adj = [Int : [Int]]()
        
        for node in 0..<n {
            adj[node] = [Int]()
        }
        for edge in edges {
            adj[edge[0]]!.append(edge[1])
            adj[edge[1]]!.append(edge[0])
        }
        
        // remove the leaves from the adjacency map
        while adj.keys.count > 2 {
            // find all leaves
            var leaves = [Int]()
            for node in adj.keys {
                if adj[node]!.count == 1 {
                    leaves.append(node)
                }
            }
            
            // remove all leaves from adj map
            for leaf in leaves {
                let connected = adj[leaf]![0]
                adj[connected] = adj[connected]!.filter { $0 != leaf }
                adj.removeValue(forKey: leaf)
            }
        }
        
        return Array(adj.keys)
    }
}