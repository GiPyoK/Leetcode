class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        
        var adj = [Int : [Int]]()
        var visited = Array(repeating: 0, count: numCourses)
        
        for i in 0..<numCourses {
            adj[i] = [Int]()
        }
        
        for prereq in prerequisites {
            adj[prereq[0]]!.append(prereq[1])
        }
        
        for i in 0..<numCourses {
            if hasCycle(&visited, i, adj) {
                return false
            }
        }
       
        return true
    }
    
    func hasCycle(_ visited: inout [Int], _ course: Int, _ adj: [Int:[Int]]) -> Bool {

        switch visited[course] {
            case 0: // not yet visited
                visited[course] = -1 // mark as visited
            
                for prereq in adj[course]! { // visit neighbor nodes
                    if hasCycle(&visited, prereq, adj) {
                        return true
                    }
                }
            case -1: // have visited during this cycle
                return true
            case 1: // have visited during previous cycles
                return false
            default:
                break
        }
        
        visited[course] = 1
        return false
    }
}