class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        // number of moves must be a even number
        // for each direction, there must be a matching opposite direction
        // Store the directions in hash table {key: direction, value: occurance}
        // Add up and -down count, add right and -left count
        // If the sum equals to 0, return true
        // else return false
        
        let movesArray = Array(moves)        
        var hashTable = [Character : Int]()
        
        for move in movesArray {
            if hashTable[move] != nil {
                hashTable[move]! += 1
            } else {
                hashTable[move] = 1
            }
        }
        
        let up = hashTable["U"] ?? 0
        let down = hashTable["D"] ?? 0
        let right = hashTable["R"] ?? 0
        let left = hashTable["L"] ?? 0
        
        if (up - down) == 0 && (right - left) == 0 {
            return true
        } else {
            return false
        }
    }
}