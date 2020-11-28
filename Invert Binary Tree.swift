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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        // Do a breadth frist traverse
        // get an array of values
        // invert the binary tree
        
        guard let root = root else { return nil }

        var invertedRoot = TreeNode(root.val)
        var originalQueue: [TreeNode] = []
        var invertedQueue: [TreeNode] = []
        originalQueue.append(root)
        invertedQueue.append(invertedRoot)

        while originalQueue.count > 0 {
            let originalNode = originalQueue.removeFirst()
            let invertedNode = invertedQueue.removeFirst()
            
            if let leftNode = originalNode.left {
                invertedNode.right = TreeNode(leftNode.val)
                
                originalQueue.append(leftNode)
                invertedQueue.append(invertedNode.right!)
            }
            
            if let rightNode = originalNode.right {
                invertedNode.left = TreeNode(rightNode.val)
                
                originalQueue.append(rightNode)
                invertedQueue.append(invertedNode.left!)
            }
        }
        
        return invertedRoot
    }
}