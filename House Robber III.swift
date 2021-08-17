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
    func rob(_ root: TreeNode?) -> Int {
        // rob = node.val + ( node.left.(left,right) + node.right.(left,right) )
        // skip = node.left.val + node.right.val
        
        var memoDict: [TreeNode: Int] = [:]
        return dfs(root, &memoDict)
    }
    
    func dfs(_ node: TreeNode?, _ memo: inout [TreeNode: Int]) -> Int {
        guard let node = node else { return 0 }
        
        // check if the node is already computed
        if let memoVal = memo[node] { return memoVal }
        
        // skip current house
        let skip = dfs(node.left, &memo) + dfs(node.right, &memo)
        
        // rob current house
        var left = 0
        var right = 0
        
        if let nodeLeft = node.left {
            left = dfs(nodeLeft.left, &memo) + dfs(nodeLeft.right, &memo)
        }
        if let nodeRight = node.right {
            right = dfs(nodeRight.left, &memo) + dfs(nodeRight.right, &memo)
        }
        
        let rob = node.val + left + right
        let maxProfit = max(skip, rob)
        memo[node] = maxProfit
        return maxProfit        
    }
}

extension TreeNode: Hashable {
    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}