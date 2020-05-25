# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def mergeTwoLists(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        head = None
        # Compare two linked list from the head
        if l1 and l2:
            if l1.val >= l2.val:
                head = ListNode(l2.val)
                l2 = l2.next
            else:
                head = ListNode(l1.val)
                l1 = l1.next
        elif l1 and l2 is None:
            head = l1
            l1 = l1.next
        elif l2 and l1 is None:
            head = l2
            l2 = l2.next
        else:
            return head
        
        # append smaller one in the new linked list
        pointer = head
        while True:
            # If l1 and l2 have values
            if l1 and l2:
                if l1.val >= l2.val:
                    pointer.next = ListNode(l2.val)
                    pointer = pointer.next
                    l2 = l2.next
                else:
                    pointer.next = ListNode(l1.val)
                    pointer = pointer.next
                    l1 = l1.next
            # If l1 exists and l2 is null
            elif l1 and l2 is None:
                pointer.next = ListNode(l1.val)
                pointer = pointer.next
                l1 = l1.next
            # If l2 exists and l1 is null
            elif l2 and l1 is None:
                pointer.next = ListNode(l2.val)
                pointer = pointer.next
                l2 = l2.next
            # If l1 and l2 are both null
            else:
                break
                
        return head