class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var answer = 0
        for i in 1...n+1 {
            var sum = 0
            for j in 1...i {
                sum += j
                answer += sum
            }
        }
        return answer
    }
}