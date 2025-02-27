//
//  File.swift
//  Alogrithm2
//
//  Created by Sunho on 2/26/25.
//

 
let n = Int(readLine()!)!
var maps = [[Int]]()
for i in 0..<n {
    maps.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
var dp = Array(repeating: Array(repeating: 0, count: n-1), count: n-1)
dp[0][0] = 1
for i in 0..<n {
    for j in 0..<n {
        if maps[i][j] == 0{
            continue
        }
        if j + maps[i][j] < n {
            dp[i][j + maps[i][j]] += dp[i][j]
        }
        if i + maps[i][j] < n {
            dp[i + maps[i][j]][j] += dp[i][j]
        }
    }
}
print(dp[n-1][n-1])
