# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    def addTwoNumbers(self, l1, l2):
        sum = l1
        
        # while l1 or l2 exists
        while l1 or l2:
            num1 = l1.val if l1 else 0
            num2 = l2.val if l2 else 0
            num_sum = num1 + num2
            
            if l1 and l2:
                if num_sum < 10:
                    l1.val = num_sum
                else:
                    l1.val = num_sum - 10
                    
                    if l1.next and l2.next:
                        l1.next.val += 1
                    elif l1.next:
                        l2.next = ListNode(1)
                    else:
                        l1.next = ListNode(1)
            
                if l1.next == None and l2.next:
                    l1.next = l2.next
                    break
                
            elif l1:
                break
            
            l1 = l1.next
            l2 = l2.next
            
        return sum