class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // check if the last int of current interval is >= the first int of next interval
        // if true, merge the intervals
        // if false, move onto next interval
        
        if intervals.count <= 1 {
            return intervals
        }
        
        var output = intervals
        var i = 0
        var merged = false
        
        output.sort() { $0[0] < $1[0] }

        while i < output.count {
            if i+1 < output.count {
                // prev = n , next = n+1
                let prevStart = output[i][0]
                let prevEnd = output[i][1]
                let nextStart = output[i+1][0]
                let nextEnd = output[i+1][1]
                
                if prevEnd >= nextStart {
                    output[i] = [prevStart, max(prevEnd, nextEnd)]
                    output.remove(at: i+1)
                    merged = true
                }
            }
            if merged {
                merged = false
            } else {
                i += 1
            }
        }
        
        return output
    }
}