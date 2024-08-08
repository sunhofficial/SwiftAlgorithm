//
//  2206.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/7/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
var maps = [[Int]]()
for _ in 0..<nm[0] {
    maps.append(readLine()!.map{Int(String($0))!})
}
var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: nm[1]), count: nm[0])
var queue = [(Int,Int,Int)]()
var index = 0
visited[0][0][0] = 1
queue.append((0,0,0))
var result = -1
func isValid(y: Int,x: Int) -> Bool {
    return 0..<nm[0] ~= y && 0..<nm[1] ~= x
}
while queue.count > index {
    let curpos = queue[index]
    if curpos.0 == nm[0]-1, curpos.1 == nm[1]-1 {
        result = visited[curpos.0][curpos.1][curpos.2]
        break
    }
    for (i,j) in [(1,0), (0,1),(-1,0),(0,-1)] {
        var next = (curpos.0 + i, curpos.1 + j, curpos.2)
        if isValid(y: next.0, x: next.1) && visited[next.0][next.1][curpos.2] == 0 {
            if maps[next.0][next.1] == 0 {
            visited[next.0][next.1][next.2] = visited[curpos.0][curpos.1][curpos.2] + 1
                queue.append((next.0,next.1, curpos.2))
            }else if next.2 == 0 {
                visited[next.0][next.1][1] = visited[curpos.0][curpos.1][curpos.2] + 1
                next.2 = 1
                queue.append(next)
            }

        }
    }
    index += 1
}
print(result)
