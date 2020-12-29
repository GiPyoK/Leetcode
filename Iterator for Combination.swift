
class CombinationIterator {

var res = [String]()
    init(_ characters: String, _ combinationLength: Int) {
        var arr = Array(characters)
        generate(arr, &res, combinationLength, 0, "")
    }
    
    func next() -> String {
        return res.removeFirst()
    }
    
    func hasNext() -> Bool {
        return res.count > 0
    }
    
    func generate(_ arr: [Character], _ res: inout [String], _ len: Int, _ index: Int, _ temp: String) {
        
        if temp.count == len {
            res.append(temp)
            return
        }
        
        if index >= arr.count {
            return
        }
        
        
        for i in index..<arr.count {
            var cur = temp + String(arr[i])
            generate(arr, &res, len, i+1, cur)
        }
    }
}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */