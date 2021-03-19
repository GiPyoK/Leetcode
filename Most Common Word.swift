class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        var words = paragraph.lowercased().words
        words.removeAll(where: { banned.contains(String($0)) })
        
        var counts = [String: Int]()

        // Count the values with using forEach    
        words.forEach { counts[String($0)] = (counts[String($0)] ?? 0) + 1 }
        guard let output = counts.max(by: { a, b in a.value < b.value }) else { return ""}
        return output.key
        
    }
}

extension StringProtocol {
    var words: [SubSequence] {
        split(whereSeparator: \.isLetter.negation)
    }
}

extension Bool {
    var negation: Bool { !self }
}