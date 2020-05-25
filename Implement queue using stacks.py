class MyQueue(object):

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.stack = []
        self.queue = []

    def push(self, x):
        """
        Push element x to the back of queue.
        :type x: int
        :rtype: None
        """
        # Pop and push everything from queue to stack
        while len(self.queue) > 0:
            self.stack.append(self.queue.pop())
        
        # Push the "x" on top of the stack
        self.stack.append(x)
        
        # Pop and push everything from stack to queue
        while len(self.stack) > 0:
            self.queue.append(self.stack.pop())

    def pop(self):
        """
        Removes the element from in front of queue and returns that element.
        :rtype: int
        """
        return self.queue.pop()

    def peek(self):
        """
        Get the front element.
        :rtype: int
        """
        return self.queue[-1]

    def empty(self):
        """
        Returns whether the queue is empty.
        :rtype: bool
        """
        if len(self.queue) <= 0:
            return True
        else:
            return False


# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()