func hourglassSum(arr: [[Int]]) -> Int {
    var highest: Int = Int.min
    for i in 0..<arr[0].count-2 {
        var sum: Int
        for j in 0..<arr[0].count-2 {
            sum = arr[i][j] + arr[i][j+1] + arr[i][j+2]
            sum = sum + arr[i+1][j+1]
            sum = sum + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2]

            if sum > highest {
                highest = sum
            }
        }
    }
    return highest
}


