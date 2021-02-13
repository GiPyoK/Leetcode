class Solution {
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        
        func isArr(_ arr1: [Int], greaterThan arr2: [Int]) -> Bool {
            var a1 = arr1
            var a2 = arr2
            while !a1.isEmpty || !a2.isEmpty {
                if a1.count > 0 && a2.count > 0 {
                    if a1[0] > a2[0] {
                        return true
                    } else if a2[0] > a1[0] {
                        return false
                    } else {
                        a1 = Array(a1[1...])
                        a2 = Array(a2[1...])
                    }
                } else if a1.count > 0 {
                    return true
                } else {
                    return false
                }
            }
            return false
        }
        
        func getMax(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
            if isArr(arr1, greaterThan: arr2) {
                return arr1
            } else {
                return arr2
            }
        }
        
        func merge(_ n1: inout [Int], _ n2: inout [Int]) -> [Int] {
            var res = [Int]()
            while !n1.isEmpty || !n2.isEmpty {
                if isArr(n1, greaterThan: n2) {
                    res.append(n1[0])
                    n1 = Array(n1[1...])
                } else {
                    res.append(n2[0])
                    n2 = Array(n2[1...])
                }
            }
            return res
        }
        
        func findMax(_ nums: [Int], _ length: Int) -> [Int] {
            var l = [Int]()
            var maxpop = nums.count - length
            for i in 0..<nums.count {
                while maxpop > 0, l.count > 0, nums[i] > l[l.index(before: l.endIndex)] {
                    l.removeLast()
                    maxpop -= 1
                }
                l.append(nums[i])
            }
            return Array(l[..<length])
        }
        
        let n1 = nums1.count
        let n2 = nums2.count
        var res = Array(repeating: 0, count: k)
        
        for i in 0..<k+1 {
            let j = k-i
            if i > n1 || j > n2 { continue }
            var l1 = findMax(nums1, i)
            var l2 = findMax(nums2, j)
            res = getMax(res, merge(&l1, &l2))
            print(res)
        }
        
        return res

    }
}
