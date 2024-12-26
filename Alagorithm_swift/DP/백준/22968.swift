//
//  22968.swift
//  Alogrithm2
//
//  Created by Sunho on 12/26/24.
//

import Foundation
let t = Int(readLine()!)!
var dp = Array(repeating: 0, count: 43)
dp[1] = 1
dp[2] = 2
for i in 3...42 {
    dp[i] = dp[i-1] + dp[i-2] + 1
}



for i in 0..<t{
    let v = Int(readLine()!)!
    var temp = 0
    for h in 1...42 {
        if dp[h] > v {
            break
        }
        temp = h
    }
    print(temp)
}
