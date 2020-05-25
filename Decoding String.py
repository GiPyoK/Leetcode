class Solution(object):
    def decodeString(self, s):
        """
        :type s: str
        :rtype: str
        """
        # Make string into a list in reverse order
        # so that the pop() will be in order
        stack = list(s[::-1])
        output = ""
        while len(stack) > 0:
            string = ""
            command = stack.pop()
            # if the command is an int, multiply following string
            try:
                repeat = int(command)
                
                # convert string to int (multi digit)
                char = stack.pop()
                while char != '[':
                    try:
                        # If the next character is an integer,
                        # multiply repeat by 10 and add num to repeated
                        num = int(char)
                        repeat *= 10
                        repeat += num
                        
                        char = stack.pop()
                        
                    except:
                        pass
                
                char = stack.pop() # remove '['
                
                # get string in between '[' and ']'
                while char != ']':
                    # if there is a nested repeated string,
                    # do a recursive decoding
                    try:
                        int(char)
                        recursive_string = char
                        recursive_char = stack.pop()
                        char = ''
                        
                        braket_count = 0
                        while True:
                            recursive_string += recursive_char
                            
                            if recursive_char == '[':
                                braket_count += 1
                            elif recursive_char == ']':
                                braket_count -= 1
                            
                            if braket_count == 0:
                                break
                        
                            recursive_char = stack.pop()

                        #recursive_string += ']' # add ']' to the end of the string
                        string += self.decodeString(recursive_string)
                    except:
                        pass
                    string += char
                    char = stack.pop()
                
                # multiply the string by repeat amount
                for _ in range(repeat):
                    output += string
            # if the command is a char, append to output string
            except:
                output += command
        
        return output

print(Solution().decodeString("3[a10[bc]]"))