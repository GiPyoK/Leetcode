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
    func swapPairs(_ head: ListNode?) -> ListNode? {
    
        var second: ListNode? = head
        if second == nil { return head }
        
        var first: ListNode? = second!.next
        if first == nil { return head }
        
        var headCopy = head
        
        // take care of the head
        headCopy = first
        second!.next = first!.next
        first!.next = second
        
        var base = second
        second = second!.next
        if second == nil { return headCopy }
            
        first = second!.next
        
        while first != nil {
            // swap adjacent nodes
            base!.next = first
            second!.next = first!.next
            first!.next = second
            
            // advance refference nodes 
            base = second
            second = second!.next
            if second == nil { break }
            
            first = second!.next
        }
        
        return headCopy
    }
}