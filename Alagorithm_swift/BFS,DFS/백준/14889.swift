//
//  14889.swift
//  Alogrithm2
//
//  Created by Sunho on 5/15/25.
//

import Foundation
let n = Int(readLine()!)!
var maps = [[Int]](repeating: [], count: n)
for i in 0..<n {
    maps[i] = readLine()!.split(separator: " ").map { Int($0)! }
}
var visited = [Bool](repeating: false, count: n)
var answer = Int.max
func dfs(depth: Int, start: Int) {
    if depth == n / 2 {
        let temp = calculateDifference()
        answer = min(temp,answer)
        return
    }
    if start >= n {
        return
    }
    for i in start..<n {
        if !visited[i] {
            visited[i] = true
            dfs(depth: depth+1, start: i + 1)
            visited[i] = false
        }
    }
}
func calculateDifference() -> Int {
    var startTeam = 0
    var linkTeam = 0
    for i in 0..<n {
        for j in 0..<n {
            if visited[i] && visited[j] {
                startTeam += maps[i][j]
            } else if !visited[i] && !visited[j] {
                linkTeam += maps[i][j]
            }
        }
    }
    return abs(startTeam - linkTeam)
}

dfs(depth: 0, start: 0)
print(answer)
