//
//  2638.swift
//  Alogrithm2
//
//  Created by Sunho on 2/26/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var maps = [[Int]]()
for i in 0..<n {
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    maps.append(inputs)
}
struct Position {
    let x: Int
    let y: Int
}
let directions = [(-1,0), (1,0),(0,-1),(0,1)]

func makeExternalAir() -> [[Bool]] {
    var visited = Array(repeating:  Array(repeating: false, count: m), count: n)
    var queue = [Position(x: 0, y: 0)]
    visited[0][0] = true
    var index = 0
    while queue.count > index {
        let current = queue[index]
        index += 1
        for (dx,dy) in directions {
            let nx = current.x + dx, ny = current.y + dy
            if 0..<n ~= nx, 0..<m ~= ny, !visited[nx][ny], maps[nx][ny] == 0 {
                visited[nx][ny] = true
                queue.append(Position(x: nx, y: ny))
            }
        }
    }
    return visited
}
func meltChees() -> Int {
    var time = 0
    while true {
        let external = makeExternalAir()
        var meltingList: [Position] = []
        for i in 0..<n {
            for j in 0..<m {
                if maps[i][j] == 1 {
                    var airCnt = 0
                    for (dx, dy) in directions {
                        let nx = i + dx , ny = j + dy
                        if 0..<n ~= nx , 0..<m ~= ny, external[nx][ny] {
                            airCnt += 1
                        }
                    }
                    if airCnt >= 2 {
                        meltingList.append(Position(x: i, y: j))
                    }
                }
            }
        }
        if meltingList.isEmpty { break}
        for pos in meltingList {
            maps[pos.x][pos.y] = 0
        }
        time += 1
    }
    return time
}

print(meltChees())
