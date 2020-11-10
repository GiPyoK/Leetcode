class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var boatCount: Int = 0
        
        // sort the people array
        var sortedPeople = people
        sortedPeople.sort(by: >)

        // set pointer for the heaviest and lightest people
        // (first index and last index)
        var first: Int = 0
        var last: Int = sortedPeople.count - 1

        while first <= last {
            // If the sum of the two people is equal to or less than the limit,
            // account for both people
            if sortedPeople[first] + sortedPeople[last] <= limit {
                first += 1
                last -= 1
                boatCount += 1
            } else if sortedPeople[first] <= limit {
                // if the sum of the two people is greater than the limit,
                // only take the lower index person
                first += 1
                boatCount += 1
            }
        }
        return boatCount
    }
}


// First Attempt
// Passes some tests but not fast enough.
// Over thought it too much


// // print("people: \(people)")
//         var boatCount = 0
        
//         // create hash table {key:weight, value:occurance}
//         var peopleDict:[Int : Int] = [:]
        
//         for person in people {
//             if peopleDict.keys.contains(person) {
//                 peopleDict[person]! += 1
//             } else {
//                 peopleDict[person] = 1
//             }
//         }
//         // print(peopleDict)
//         // sort the people array in descending order
//         var peopleArr = people
//         //sortedPeople.sort() { $0 > $1 }
//         // print(sortedPeople)
        
//         while peopleArr.count > 0 {
//             let weight = peopleArr[0]
            
//             // remove from array so it will exit the while loop
//             let index = peopleArr.firstIndex(of: weight)
//             peopleArr.remove(at: index!)
//             // decreament or remove from dictionary
//             if peopleDict[weight]! > 1 {
//                 peopleDict[weight]! -= 1
//             } else {
//                 peopleDict[weight] = nil
//             }
//             boatCount += 1
            
//             // If the first weight is same as the limit,
//             // then increament the boat count
//             if weight == limit {
                
//             } else {
//                 var target = limit - weight
//                 while target > 0 {
//                     if peopleDict.keys.contains(target) {
//                         let index = peopleArr.firstIndex(of: target)
//                         peopleArr.remove(at: index!)
//                         if peopleDict[target]! > 1 {
//                             peopleDict[target]! -= 1
//                         } else {
//                             peopleDict[target] = nil
//                         }
//                         break
//                     }
//                     target -= 1
//                 }


//                 let target = limit - weight
//                 // print("target: \(target)")
//                 var targetKeys = sortedPeople.filter() { $0 <= target } // get keys that are equal to or smaller than the target
//                 // print("targetKeys: \(targetKeys)")
//                 targetKeys = targetKeys.filter() { peopleDict.keys.contains($0) } // filter targetKeys that are in peopleDict
//                 targetKeys.sort() { $0 > $1 }
//                 // print("targetKeys: \(targetKeys)")
//                 if targetKeys.count > 0 {
//                     // print("targetKeys: \(targetKeys)")
//                     let targetKey = targetKeys[0]
//                     let index = sortedPeople.firstIndex(of: targetKey)
//                     sortedPeople.remove(at: index!)
//                     if peopleDict[targetKey]! > 1 {
//                         peopleDict[targetKey]! -= 1
//                     } else {
//                         peopleDict[targetKey] = nil
//                     }
//                 }
//             }
            
//             // Grab the first index of people array and check if
//             // limit - weight is in the hashtable
            

//             // if the key value pair exists,
//             // delete it from the hast table and increase the boat count

//             // if the key value pair does not exist,
//             // delete that weight and increase the boat count
            
            
            
            
//         }
        
//         return boatCount