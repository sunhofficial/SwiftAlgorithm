//
//  1520.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/28/24.
//

import Foundation
let mn = readLine()!.split(separator: " ").map{ Int(String($0))!}, m = mn[0], n = mn[1]
var maps = [[Int]]()
for i in 0 ..< mn[0] {
    maps.append( readLine()!.split(separator: " ").map{ Int(String($0))!})
}
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var dp = Array(repeating: Array(repeating: -1, count: n), count: m)
func dfs(_ x: Int, _ y: Int) -> Int{
    if x == n - 1 && y == m - 1 {
        return 1
    }
    if dp[y][x] != -1 {
        return dp[y][x]
    }

    dp[y][x] = 0

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && nx < n && ny >= 0 && ny < m && maps[y][x] > maps[ny][nx] {
            dp[y][x] += dfs(nx, ny)
        }
    }

    return dp[y][x]
}
print(dfs(0, 0))
