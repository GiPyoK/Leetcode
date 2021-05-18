import Foundation

  // Given an array of integers, find if there are two pairs (a, b) and (c, d) such that a+b = c+d, and a, b, c and d are distinct element. 
  
  let arr = [1,2,3,6] // (1,4) = (2,3)
  
  func solution(_ arr: [Int]) -> Bool {
    
    
    // create sum hashtable, key: single int value, value: array of all sums except for the current value
  var hashTable = [Int: [Int]]()
    
  for i in 0..<arr.count {
    for j in i..<arr.count {
      let sum = arr[i] + arr[j]
      if hashTable.keys.contains(sum) {
        var elems = hashTable[sum]!
        elems.append(i)
        elems.append(j)
        hashTable[sum] = elems
        // print(hashTable[sum])
        let elemSet = Set(Array(hashTable[sum]!))
        if hashTable[sum]!.count == elemSet.count {
          return true
        }
        
      } else {
        hashTable[sum] = [i,j]
      }
    }
    
  }
    // print(hashTable)
    return false
}

print("Answer: \(solution(arr))")