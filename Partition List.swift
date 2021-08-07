/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        
        guard let headNode = head else { return head }
        
        var dummy = ListNode(0, headNode)
        var pPrev: ListNode = dummy
        var partNode: ListNode? = pPrev.next
        
        // find the partNode which is >= x
        while partNode!.next != nil {
            if partNode!.val >= x {
                break
            }
            
            pPrev = partNode!
            partNode = partNode!.next
        }
        
        var tPrev: ListNode = partNode!
        var targetNode: ListNode? = tPrev.next
        
        // find the targetNode which is < x
        while targetNode != nil {
            if targetNode!.val < x {
                // move the targetNode behind the partNode
                tPrev.next = targetNode!.next
                pPrev.next = targetNode!
                targetNode!.next = partNode
                
                // rearrange refference nodes
                pPrev = targetNode!
                targetNode = tPrev.next
            } else {
                // advance nodes
                tPrev = targetNode!
                targetNode = targetNode!.next
            }
        }
        return dummy.next
    }
}