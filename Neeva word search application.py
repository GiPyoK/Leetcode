# 
# Your previous JavaScript content is preserved below:
# 
# /*
# 
# Write a word search application.
# 
# Input: A wordList (of strings) and a grid (of letters).
# Output: A map of {word: boolean}, true for each word.
# 
# Rules:
# * Two letters in the grid are connected if they adjacent in
#   one of the four cardinal directions (up, down, left, right)
# * A path is formed by connecting adjacent letters in the grid.
# * A path matches a word if each letter in the word appears on
#   the path in order, and no other letters appear on that path.
# 
# Example:
# 
# grid:
# f h h
# i s a
# c d f
# 
# dictionary: fish
# 
# return value: {'fish': true}
# 
# */
# 
wordList = ["cat", "parrot", "caterpillar", "rat", "mouse", "panda"]

grid = [
   ["c", "p", "a", "r", "m"],
   ["a", "t", "o", "r", "o"],
   ["p", "p", "i", "o", "t"],
   ["e", "r", "l", "f", "a"],
   ["c", "p", "l", "a", "r"],
 ]

word_dict = {}
for word in wordList:
    word_dict[word] = False
    



# dfs
# if current string mataches the whole word in wordLins, add to solution dictionary
# if current char mataches one of the word in wordList,
# dfs to four cardinal directions
def dfs(x, y, string, solution, grid):
    print(string)
    if x >= 0 and x < len(grid[0]) and y >= 0 and y <len(grid):
        string += grid[y][x]
    else:
        return
    
    if string in solution.keys():
        solution[string] = True
        return
    
    for word in solution.keys():
        if word.startswith(string):
            #up
            dfs(x, y+1, string, solution, grid)
            #down
            dfs(x, y-1, string, solution, grid)
            #right
            dfs(x+1, y, string, solution, grid)
            #left
            dfs(x-1, y, string, solution, grid)
            
for y in range(len(grid)):
    for x in range(len(grid[y])):
        dfs(x, y, "", word_dict, grid)
                   
print(word_dict)
    
 
