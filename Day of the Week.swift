class Solution {
    func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
        print("day:\(day), month:\(month), year:\(year)")
        // leap year: 2020
        let numOfDays: [Int: Int] = [1: 31,
                                     2: 28,
                                     3: 31,
                                     4: 30,
                                     5: 31,
                                     6: 30,
                                     7: 31,
                                     8: 31,
                                     9: 30,
                                    10: 31,
                                    11: 30,
                                    12: 31]
        
        // since 1/1/1971 is Friday
        let days: [String] = ["Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday"]
        
        func isLeapYear(_ year: Int) -> Bool {
            return year % 4 == 0 ? (year % 100 == 0 ? (year % 400 == 0 ? true : false) : true) : false
        }

        
        var totalDays = -1 // zero based index
        
        for i in 1971..<year {
            totalDays += isLeapYear(i) ? 366 : 365
        }
        
        for i in 1..<month {
            totalDays += numOfDays[i]!
        }
        
        if month > 2 && isLeapYear(year) {
            totalDays += 1
        }
        
        totalDays += day
        return days[totalDays%7]
    }
}