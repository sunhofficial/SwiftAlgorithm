//
//  16234.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/2/24.
//

import Foundation
let nlr = readLine()!.split(separator: " ").map{Int(String($0))!}
var maps = [[Int]]()
let dx = [0,0,-1,1]
let dy = [-1,1,0,0]
var visited = Array(repeating: Array(repeating: false, count: nlr[0]), count: nlr[0])
for _ in 0 ..< nlr[0] {
    maps.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func bfs(_ i: Int, _ j: Int) -> Int {
    var queue = [(i,j)]
    visited[i][j] = true
    var union = [(i,j)]
    var cnt = 0
    cnt += maps[i][j]
    while !queue.isEmpty {
        let xy = queue.removeFirst()
        let x = xy.0
        let y = xy.1
        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            if nx < 0 || nx >= nlr[0] || ny < 0 || ny >= nlr[0] {
                continue
            }
            if visited[nx][ny] { continue}
            if nlr[1] <= abs(maps[nx][ny] - maps[x][y]) && abs(maps[nx][ny] - maps[x][y]) <= nlr[2] {
                union.append((nx,ny))
                visited[nx][ny] = true
                cnt += maps[nx][ny]
                queue.append((nx,ny))
            }
        }
    }
    let unionPopulation = Int(floor(Double(cnt) / Double(union.count)))
    for country in union {
        maps[country.0][country.1] = unionPopulation
    }
    return union.count
}
var day = 0
while true {
    visited = Array(repeating: Array(repeating: false, count: nlr[0]), count:  nlr[0])
    var check = false
    for i in 0..<nlr[0] {
        for j in 0..<nlr[0] {
            if !visited[i][j] {
                if bfs(i, j) >= 2{
                    check = true
                }
            }
        }
    }
    if !check {
        break
    }
    day += 1
}
print(day)
