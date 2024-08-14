//
//  2589.swift
//  Alogrithm2
//
//  Created by Sunho on 8/14/24.
//

import Foundation
let wh = readLine()!.split(separator: " ").map{Int(String($0))!}
var maps = [[String]]()
var ans = 0
for i in 0..<wh[0] {
    maps.append(readLine()!.map{String($0)})
}
func isValid(_ i: Int, _ j: Int) -> Bool {
    return  0..<wh[0] ~= i  && 0..<wh[1] ~= j
}
func bfs(_ i: Int, _ j : Int) {
    var queue = [(i,j)]
    var visited = Array(repeating: Array(repeating: 0, count: wh[1]), count: wh[0])
    visited[i][j] = 1
    var index = 0
    while queue.count > index {
        let data = queue[index]
        for k in [(0,1),(0,-1),(1,0),(-1,0)] {
            let ni = data.0 + k.0
            let nj = data.1 + k.1
            if !isValid(ni, nj   ) || visited[ni][nj] != 0 {continue}
            if maps[ni][nj] == "L" {
                visited[ni][nj] = visited[data.0][data.1]  + 1
                ans = max(ans, visited[data.0][data.1])
                queue.append((ni,nj))
                continue
                
            }
        }
        index += 1
    }
}
for i in 0..<wh[0] {
    for j in 0..<wh[1] {
        if maps[i][j] == "L" {
            bfs(i, j)
        }
    }
}
print(ans)
