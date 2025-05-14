//
//  14500.swift
//  Alogrithm2
//
//  Created by Sunho on 5/12/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var maps = [[Int]]()
for i in 0..<n {
    maps.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
let dx = [-1,1,0,0] //위 아래 왼 오
let dy = [0,0,-1,1]
var maxSum = 0
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
func dfs(_ x: Int, _ y: Int, _ sum :Int, _ cnt: Int) {
    if cnt == 4 {
        maxSum = max(maxSum, sum)
        return
    }
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if 0..<n ~= nx && 0..<m ~= ny && !visited[nx][ny]{
            visited[nx][ny] = true
            dfs(nx, ny, sum + maps[nx][ny], cnt + 1)
            visited[nx][ny] = false
        } else { continue}
    }
}
func checkTShpae(_ x: Int, _ y: Int) {
    let tshapes = [
        [(-1,0), (0,-1), (0,1)],  // ㅗ 위로한칸 좌로한칸 우로한칸
       [(1,0), (0,-1), (0,1)],   // ㅜ
       [(0,-1), (-1,0), (1,0)],  // ㅓ
       [(0,1), (-1,0), (1,0)]    // ㅏ
    ]
    for shape in tshapes {
        var sum = maps[x][y]
        var isValid = true
        for (dx,dy) in shape {
            let nx = x + dx
            let ny = y + dy
            if !(0..<n ~= nx && 0..<m ~= ny) {
                isValid = false
                break
            }
            sum += maps[nx][ny]
        }
        if isValid {
            maxSum = max(maxSum, sum)
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        visited[i][j] = true
        dfs(i, j, maps[i][j], 1)
        visited[i][j] = false
        checkTShpae(i, j)
    }
}

print(maxSum)
