//
//  17086.swift
//  Alogrithm2
//
//  Created by Sunho on 5/29/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var maps = [[Int]]()
let dx = [-1, 1, 0, 0, -1, 1, 1, -1]
let dy = [0, 0, -1, 1, 1, -1, 1, -1]
for _ in 0..<n {
    maps.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
//결국 찾는거는 0으로부터 가장 먼 1이 있을때 그거리를 출력해주는 거네.
var answer = 0
func bfs(_ startX:Int, _ startY: Int) {
    var visited = Array(repeating: Array(repeating: false, count: 251), count: 251)
    var queue = [((Int,Int),Int)]()
    visited[startX][startY] = true
    queue.append(((startX,startY),0))
    var index = 0
    while queue.count > index {
        let current = queue[index]
        index += 1
        let x = current.0.0, y = current.0.1
        let safeDistance = current.1
        if maps[x][y] == 1 {
            answer = max(safeDistance,answer)
            break
        }
        for i in 0..<8 {
            let nx = x + dx[i], ny = y + dy[i]
            if 0..<n ~= nx && 0..<m ~= ny && !visited[nx][ny] {
                queue.append(((nx,ny),safeDistance + 1))
                visited[nx][ny] = true
            }
        }
    }
}
for i in 0..<n {
    for j in 0..<m{
        if maps[i][j] == 1 {continue}
        bfs(i, j)
    }
}
print(answer)
