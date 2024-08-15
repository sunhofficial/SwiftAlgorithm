//
//  2636.swift
//  Alogrithm2
//
//  Created by Sunho on 8/15/24.
//

import Foundation
let wh = readLine()!.split(separator: " ").map{ Int(String($0))!}
var maps = [[Int]]()
for _ in 0..<wh[0] {
    maps.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
let dy = [0,0,-1,1]
let dx = [-1,1,0,0]
var cnt = 0
var time = 0
var cheeseCnt = [Int]()
func bfs() -> Int {
    var visited = Array(repeating: Array(repeating: false, count: wh[1]), count: wh[0])
    var queue = [(Int,Int)]()
    queue.append((0,0))
    visited[0][0] = true
    cnt = 0
    var index = 0
    while queue.count > index {
        let xy = queue[index]
        let x = xy.0
        let y = xy.1
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if 0..<wh[0] ~= nx && 0..<wh[1] ~= ny && !visited[nx][ny] {
                if maps[nx][ny] == 0 {
                    visited[nx][ny] = true
                    queue.append((nx,ny))
                } else if maps[nx][ny] == 1{
                    visited[nx][ny] = true
                    maps[nx][ny] = 0
                    cnt += 1
                }
                            
            }
        }
        index += 1
    }
    cheeseCnt.append(cnt)
    return cnt
}
while true{
    time += 1
    cnt = bfs()
    if cnt == 0 {
        break
    }
}
print(time - 1)
print(cheeseCnt[cheeseCnt.count - 2])
