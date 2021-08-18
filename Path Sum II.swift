/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        
        var sumArr = [Int]()
        var answer = [[Int]]()
        
        dfs(root, targetSum, &sumArr, &answer)
        
        return answer
    }
    
    func dfs(_ node: TreeNode?, _ targetSum: Int, _ sumArr: inout [Int], _ answer: inout [[Int]]) {
        guard let node = node else { return }
        
        if sumArr.reduce(0, +) + node.val > targetSum { return }
        
        sumArr.append(node.val)
        
        if node.left == nil && node.right == nil && sumArr.reduce(0, +) == targetSum {
            answer.append(sumArr)
        }
        
        dfs(node.left, targetSum, &sumArr, &answer)
        dfs(node.right, targetSum, &sumArr, &answer)
        sumArr.popLast()
    }
}