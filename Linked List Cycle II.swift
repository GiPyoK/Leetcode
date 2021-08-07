/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        // Floyd's cycle detection
        var walker = head
        var runner = head
        
        if runner == nil ||
            runner!.next == nil ||
            runner!.next!.next == nil { return nil }
        
        walker = walker!.next
        runner = runner!.next!.next
        
        while runner!.next != nil && runner!.next!.next != nil {
            if walker === runner {
                // move the walker to head and move walker and runner 1 step
                // the point where they meet is the start of the loop
                walker = head
                while walker !== runner {
                    walker = walker!.next
                    runner = runner!.next
                }
                return walker
            }
            
            walker = walker!.next
            runner = runner!.next!.next
        }
        
        return nil
    }
}