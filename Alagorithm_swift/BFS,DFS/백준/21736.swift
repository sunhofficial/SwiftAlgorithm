//
//  21736.swift
//  Alogrithm2
//
//  Created by Sunho on 2/12/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var graph: [[Character]] = []
for i in 0..<n {
    graph.append(readLine()!.map{ $0})
}
var start = (0,0)
for y in 0..<n {
    for x in 0..<m {
        if graph[y][x] == "I" {
            start = (y,x)
        }
    }
}

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]
var visited  = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var answer  = 0
func dfs(_ y: Int, _ x: Int) {
    visited[y][x] = true
    if graph[y][x] == "P" {
        answer += 1
    }
    for i in 0..<4 {
        let ny = y + dy[i]
           let nx = x + dx[i]
        if 0..<n ~= ny && 0..<m ~= nx && !visited[ny][nx] && graph[ny][nx] != "X" {
                visited[ny][nx] = true
                dfs(ny, nx)
            }
    }
}

dfs(start.0, start.1)

print(answer == 0 ? "TT" : answer)
