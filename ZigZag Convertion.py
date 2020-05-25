class Solution(object):
    def convert(self, s, numRows):
            """
            :type s: str
            :type numRows: int
            :rtype: str
            """
            # Initialize an array for each rows
            rows = [[] for row in range(numRows)]
            
            row_counter = 0
            going_down = True
            # append each character in s to the rows array
            for char in s:
                rows[row_counter].append(char)
                
                # Change direction in zigzag way
                if going_down and row_counter < numRows - 1:
                    row_counter += 1
                elif going_down and row_counter == numRows - 1:
                    going_down = False
                    row_counter -= 1
                elif not going_down and row_counter > 0:
                    row_counter -= 1
                elif not going_down and row_counter == 0:
                    going_down = True
                    row_counter += 1
                    
            output = ""
            
            # convert each row into a string
            for i in range(len(rows)):
                for j in range(len(rows[i])):
                    output += rows[i][j]
            return output
            

Solution().convert("PAYPALISHIRING", 3)
