//
//  11048.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/12/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
var rooms = [[Int]]()
for i in 0..<nm[0] {
    rooms.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}
var dp = Array(repeating: Array(repeating: 0, count: nm[1] + 1), count: nm[0] + 1)
for y in 1...nm[0] {
    for x in 1...nm[1] {
        dp[y][x] = max(dp[y-1][x], dp[y-1][x-1] , dp[y][x-1]) + rooms[y-1][x-1]
    }
}
print(dp[nm[0]][nm[1]])
