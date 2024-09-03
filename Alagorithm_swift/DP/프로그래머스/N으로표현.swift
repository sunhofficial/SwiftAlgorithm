import Foundation

func solution(_ N: Int, _ number: Int) -> Int {
    if N == number {
        return 1
    }
    
    var dp = Array(repeating: Set<Int>(), count: 9)
    
    for i in 1...8 {
        let repeatedNum = Int(String(repeating: "\(N)", count: i))!
        dp[i].insert(repeatedNum)
        
        for j in 1..<i {
            for num1 in dp[j] {
                for num2 in dp[i - j] {
                    dp[i].insert(num1 + num2)
                    dp[i].insert(num1 - num2)
                    dp[i].insert(num1 * num2)
                    if num2 != 0 {
                        dp[i].insert(num1 / num2)
                    }
                }
            }
        }
        
        if dp[i].contains(number) {
            return i
        }
    }
    
    return -1
}
