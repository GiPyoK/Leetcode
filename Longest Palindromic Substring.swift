class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
		    return s
	    }

        let sArr = Array(s)

        var isPalindrome = Array(repeating: Array(repeating: false, count: sArr.count), count: sArr.count)
        for i in 0..<s.count {
            isPalindrome[i][i] = true
        }

        var left = 0
        var right = 0

        for j in 1..<s.count {
            for i in 0..<j {

                // Rules
                // 1. If s[i] == s[j] and the length of the word is 2 or less then its a palindrome
                // 2. If s[i] == s[j] and the inner word is a palindrome then s[i...j] is a palindrome
                if sArr[i] == sArr[j] && (isPalindrome[i + 1][j - 1] || j - i <= 2) {
                    isPalindrome[i][j] = true
                    if j - i > right - left {
                        left = i
                        right = j
                    }
                }
            }
        }

        return String(sArr[left...right])
    }
}