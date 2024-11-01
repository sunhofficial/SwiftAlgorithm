//
//  16724.swift
//  Alogrithm2
//
//  Created by Sunho on 10/22/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
var map = Array(repeating: [String](), count: 1001)
//0:방문x, 1:방문중 2:방문 끝
var visited = [[Int]](repeating: [Int](repeating: 0, count: nm[1]), count: nm[0])
for i in 0..<nm[0] {
    let line = readLine()!.map{String($0)}
    map[i] = line
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
let directions: [String: Int] = ["U": 0, "D": 1, "L": 2, "R": 3]
var result = 0
func dfs(x: Int, y: Int) {
    visited[x][y] = 1
    let direction = directions[map[x][y]]!
    let nx = x + dx[direction]
    let ny = y + dy[direction]
    if nx >= 0 && nx < nm[0] && ny >= 0 && ny < nm[1]{
        if visited[nx][ny] == 1 {
            result += 1
        } else if visited[nx][ny] == 0 {
            dfs(x: nx, y: ny)
        }
    }
    
    visited[x][y] = 2
}
for i in 0..<nm[0]{
    for j in 0..<nm[1] where visited[i][j] == 0 {
        
        dfs(x: i, y: j)
        
    }
}

print(result)
