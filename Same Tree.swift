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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var pOutput = [Int?]()
        var qOutput = [Int?]()
        treeTraverse(treeNode: p, output: &pOutput)
        treeTraverse(treeNode: q, output: &qOutput)
        
        if pOutput == qOutput {
            return true
        } else {
            return false
        }
    }
    
    func treeTraverse(treeNode: TreeNode?, output: inout [Int?]) {
        if let node = treeNode {
            output.append(node.val)
            
            if let left = node.left {
                treeTraverse(treeNode: left, output: &output)
            } else {
                output.append(nil)
            }
            
            if let right = node.right {
                treeTraverse(treeNode: right, output: &output)
            } else {
                output.append(nil)
            }
            
        }
    }
}