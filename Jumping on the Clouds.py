def jumpingOnClouds(c):
    index = 0
    jump = 0
    for x in range(len(c)):
        if index+2 < len(c) and c[index+2] == 0:
            index += 2
        else:
            index += 1
        
        jump += 1
        if index == len(c) - 1:
            break
    
    return jump
