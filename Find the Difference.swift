class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        // turn each string into an array
        // for every character in s, delete the matching character in t
        // return what is left in t
        
//         let s_Arr = Array(s)
//         var t_Arr = Array(t)
        
//         for char in s_Arr {
//             if let index = t_Arr.firstIndex(of: char) {
//                 t_Arr.remove(at: index)
//             }
//         }
//         print(t_Arr)
//         return t_Arr[0]
        
        // Alternative solution
        // Bitwise XOR operation
        var res = s.unicodeScalars.reduce(0) { $0 ^ $1.value }
        res = t.unicodeScalars.reduce(res) { $0 ^ $1.value }
        return Character(UnicodeScalar(res)!)
    }
}