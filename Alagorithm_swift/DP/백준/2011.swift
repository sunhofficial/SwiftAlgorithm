//2011
let input = Array(readLine()!)
let n = input.count
var dp = Array(repeating: 0, count: n + 1)
dp[0] = 1
if input[0] == "0" {
    print(0)
} else {
    dp[1] = 1
    if n >= 2 {
        for i in 2...n {
            let oneDigit = Int(String(input[i-1]))!
            let twoDigit = Int(String(input[i-2]) + String(input[i-1]))!
            if oneDigit >= 1 {
                dp[i] += dp[i-1]
            }
            if twoDigit >= 10 && twoDigit <= 26 {
                dp[i] += dp[i-2]
            }
            dp[i] %= 1000000
        }
    } 
    print(dp[n])
}
