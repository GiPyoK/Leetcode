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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let h = head else { return head }
        
        if h.next == nil {
            return h.next
        }
        
        var tail = h
        var total = 1
        // move tail to the end of the LL and count the total
        while tail.next != nil {
            tail = tail.next!
            total += 1
        }
                
        var target: ListNode? = h
        var prev: ListNode?
        // move 2 pointers to the remove target and the previous position
        for _ in 0..<(total - n) {
            prev = target
            target = target!.next!
        }
                
        if total - n == 0 {
            // if removing the first node
            target = h.next
            return target
        } else {
            // remove the target node
            if let tNext = target!.next {
                prev!.next = tNext
            } else {
                prev!.next = nil
            }
        }
        return head
    }
}