class Solution {
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        var n1 = nums1
        var n2 = nums2
        var saved1: Int?
        var saved2: Int?
        var saved: Bool = false
        var saveCounter = 0
        var output: [Int] = []

        while output.count < k {
            
            if saved == true {
                saveCounter += 1
                if saveCounter == 2 {
                    if let save = saved1 {
                        var index = n1.firstIndex(of: -1)!
                        n1[index] = save
                        print("n1: \(n1)")
                    }
                    if let save = saved2 {
                        var index = n2.firstIndex(of: -1)!
                        n2[index] = save
                        print("n2: \(n2)")
                    }
                    saved = false
                    saveCounter = 0
                }
            }
            
            if output.count + n1.count + n2.count == k {
                var n1IsGreater = false
                var index: Int = 0
                while true {
                    if n1.count <= index { n1IsGreater = false; break }
                    if n2.count <= index { n1IsGreater = true; break }
                    
                    if n1[index] > n2[index] {
                        n1IsGreater = true
                        break
                    } else if n2[index] > n1[index] {
                        n1IsGreater = false
                        break
                    } else {
                        index += 1
                    }
                }
                
                output += n1IsGreater ? n1 + n2 : n2 + n1
                
            } else {
                var max1: Int = -1
                var max2: Int = -1
                if let m1 = n1.max() {
                    max1 = m1
                }
                if let m2 = n2.max() {
                    max2 = m2
                }
            
                if max1 > max2 {
                    saved1 = checkRemaindingValuesFor(value: max1, forArr: &n1, arr: n2, output: output, k: k)
                    if saved1 != nil { saved = true; continue }
                    sliceArray(from: max1, arr: &n1)
                    output.append(max1)

                } else if max2 > max1 {
                    saved2 = checkRemaindingValuesFor(value: max2, forArr: &n2, arr: n1, output: output, k: k)
                    if saved2 != nil { saved = true; continue }
                    sliceArray(from: max2, arr: &n2)
                    output.append(max2)

                } else {
                    let index1 = n1.firstIndex(of: max1)!
                    let max1Sub = Array(n1[..<index1]).max()
                    
                    let index2 = n2.firstIndex(of: max2)!
                    let max2Sub = Array(n2[..<index2]).max()
                    
                    if let m1Sub = max1Sub, let m2Sub = max2Sub {
                        if m1Sub > m2Sub {
                            saved2 = checkRemaindingValuesFor(value: max2, forArr: &n2, arr: n1, output: output, k: k)
                            if saved2 != nil { saved = true; continue }
                            sliceArray(from: max2, arr: &n2)
                            output.append(max2)
                        } else {
                            saved1 = checkRemaindingValuesFor(value: max1, forArr: &n1, arr: n2, output: output, k: k)
                            if saved1 != nil { saved = true; continue }
                            sliceArray(from: max1, arr: &n1)
                            output.append(max1)
                        }
                    } else if let m1Sub = max1Sub {
                        saved2 = checkRemaindingValuesFor(value: max2, forArr: &n2, arr: n1, output: output, k: k)
                        if saved2 != nil { saved = true; continue }
                        sliceArray(from: max2, arr: &n2)
                        output.append(max2)
                    } else {
                        saved1 = checkRemaindingValuesFor(value: max1, forArr: &n1, arr: n2, output: output, k: k)
                        if saved1 != nil { saved = true; continue }
                        sliceArray(from: max1, arr: &n1)
                        output.append(max1)
                    }
                }
            }
            
        }
        
        return output
    }
    
    func sliceArray(from value: Int, arr: inout [Int]) {
        var index = arr.firstIndex(of: value)!
        index = arr.index(index, offsetBy: 1)
        arr = Array(arr[index...])
    }

    func checkRemaindingValuesFor(value: Int, forArr: inout [Int], arr: [Int], output: [Int], k: Int) -> Int? {
        var index = forArr.firstIndex(of: value)!
        index = forArr.index(index, offsetBy: 1)
        let newArr = Array(forArr[index...])
        
        if output.count + newArr.count + arr.count + 1 < k {
            var maxIndex = forArr.firstIndex(of: value)!
            forArr[maxIndex] = -1
            print(forArr)
            return value
        } else {
            return nil
        }
    }
}

