class Solution {
    func unhappyFriends(_ n: Int, _ preferences: [[Int]], _ pairs: [[Int]]) -> Int {
        
        if n == 2 {
            return 0
        }
        
        
        var unhappyFriends: Int = 0
        var potentialFriends = Set<[Int]>()
        var pref = preferences
        var pairArr = pairs
        var hasChanged = true
        
        while hasChanged {
            hasChanged = false
            
            for var pair in pairArr {
                if pair[0] == pref[pair[1]][0] && pair[1] == pref[pair[0]][0] {
                    hasChanged = true
                    
                    for i in 0..<pref.count {
                        if let index0 = pref[i].firstIndex(of: pair[0]) {
                             pref[i].remove(at: index0)
                        }
                        if let index1 = pref[i].firstIndex(of: pair[1]) {
                            pref[i].remove(at: index1)
                        }
                    }
                    if let index = pairArr.firstIndex(of: pair) {
                        pairArr.remove(at: index)
                    }
                }
            }
        }
        print(pairArr)
        print(pref)
        for pair in pairArr {
            if pair[0] != pref[pair[1]][0] {
                let unhappy = [pair[1], pref[pair[1]][0]]
                potentialFriends.insert(unhappy)
            }
            
            if pair[1] != pref[pair[0]][0] {
                let unhappy = [pair[0], pref[pair[0]][0]]
                potentialFriends.insert(unhappy)
            }
        }
        print(potentialFriends)
        return potentialFriends.count
    }
}