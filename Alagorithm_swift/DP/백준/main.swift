//
//  9252.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/29/24.
//

import Foundation
let firstline = [""] + readLine()!.map{String($0)}
let secondLine = [""] +  readLine()!.map{String($0)}
let  n = firstline.count
let m = secondLine.count
var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
for y in 1..<m {
    for x in 1..<n {
        if secondLine[y] == firstline[x] {
            dp[y][x] = dp[y-1][x-1] + 1
        } else {
            dp[y][x] = max(dp[y-1][x], dp[y][x-1])
        }
    }
}
var ans = dp.flatMap {$0}.max()!
print(ans)
var lcs = ""
var y = m - 1
var x = n - 1
while y > 0 && x > 0 {
    if secondLine[y] == firstline[x] {
         lcs = String(secondLine[y]) + lcs
         y -= 1
         x -= 1
     } else if dp[y-1][x] > dp[y][x-1] {
         y -= 1
     } else {
         x -= 1
     }
}
print(lcs)
