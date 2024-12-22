//
//  1932.swift
//  Alogrithm2
//
//  Created by Sunho on 12/23/24.
//

import Foundation
let n = Int(readLine()!)!
var maps = Array(repeating: [Int](), count: n + 1)
for i in 0..<n {
    maps[i] = readLine()!.split(separator: " ").map{Int(String($0))! }
    
}
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
dp[0][0] = maps[0][0]
for i in 1..<n {
    for j in 0...i {
        if j == 0 {
            dp[i][j] = dp[i-1][j] + maps[i][j]
            continue
        }
        if j == i {
            dp[i][j] = dp[i-1][j-1] + maps[i][j]
            continue
        }
        dp[i][j] = max(dp[i-1][j-1] , dp[i-1][j]) + maps[i][j]
        
    }
}
print(dp[n-1].max()!)
