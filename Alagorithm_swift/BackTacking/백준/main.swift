//
//  10971.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/21/24.
//

import Foundation
let n = Int(readLine()!)!
var values = Array(repeating: [Int()], count: n)
var visited = Array(repeating: false, count: n)
for i in 0..<n {
    let infoLines = readLine()!.split(separator: " ").map{ Int(String($0))!}
    values[i] = infoLines

}
var result = Int.max
var sum = 0
func dfs(_ depth: Int, _ now: Int, _ end: Int, _ value: Int) {
    if depth == n && values[now][end] != 0 {
        result = min(result,value + values[now][end])
        return

    }
    for i in 0..<n {
        if !visited[i] && values[now][i] > 0  && value < result{
            visited[i] = true
            dfs(depth + 1, i, end, value + values[now][i])
            visited[i] = false

        }
    }
}
visited[0] = true
dfs(1, 0, 0, 0)
print(result)
