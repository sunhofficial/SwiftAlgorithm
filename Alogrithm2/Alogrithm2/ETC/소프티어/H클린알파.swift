//
//  ㅡ먀ㅜ.swift
//  Alogrithm2
//
//  Created by Sunho on 2/7/25.
//

import Foundation
let pn = readLine()!.split(separator: " ").map{Int(String($0))!}, p = pn[0], n = pn[1]
let arrs =  readLine()!.split(separator: " ").map{Int(String($0))!}
//p배씩 증가하고 n 초후
// 1일때 arrs[0]
// 2일때 arrs[0] * 3 + arrs[1]
// 3일때 arrs[0]
var dp = Array(repeating: 0, count: n+1)
dp[0] = arrs[0]
for i in 1..<n {
    dp[i] = (3 * dp[i-1] + arrs[i]) % 1000000007
}

print(dp[n-1])
