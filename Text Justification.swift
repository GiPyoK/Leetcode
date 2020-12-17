class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var sentence: [String] = []
        var wordCount: Int = 0
        var wordGroups: [[String]] = []
        
        for word in words {
            wordCount += word.count
            
            if wordCount <= maxWidth {
                sentence.append(word)
                wordCount += 1 // account for at least one space
            } else {
                wordCount = word.count + 1
                wordGroups.append(sentence)
                sentence = [word]
            }
        }
        // add last set of words to wordGroups array
        if sentence.count > 0 {
            wordGroups.append(sentence)
        }
        
        var numOfChar: [Int] = []
        
        for group in wordGroups {
            var characters = 0
            
            for word in group {
                characters += word.count
            }
            
            numOfChar.append(characters)
            characters = 0
        }
        
        for (i, group) in wordGroups.enumerated(){
            let spaces = maxWidth - numOfChar[i]
            
            if i < wordGroups.count - 1 { // if not last group
                if group.count == 1 {
                    for _ in 0..<spaces {
                        wordGroups[i][0] += " "
                    }
                } else {
                    let eachNumOfSpaces = spaces / (group.count - 1)
                    let extraSpaces = spaces % (group.count - 1)
                    
                    for j in 0..<group.count - 1 {
                        for _ in 0..<eachNumOfSpaces {
                            wordGroups[i][j] += " "
                        }
                    }
                    for j in 0..<extraSpaces {
                        wordGroups[i][j] += " "
                    }
                }
            } else { // last group should be left justified
                if group.count == 1 {
                    for _ in 0..<spaces {
                        wordGroups[i][0] += " "    
                    }
                } else {
                    var lastSpaces = spaces
                    
                    for j in 0..<group.count - 1 {
                        wordGroups[i][j] += " "
                        lastSpaces -= 1
                    }
                    for _ in 0..<lastSpaces {
                        wordGroups[i][group.count - 1] += " "
                    }
                }
            }
        }
        
        var output: [String] = []
        
        for group in wordGroups {
            output.append(group.joined(separator:""))
        }
        
        return output
    }
}