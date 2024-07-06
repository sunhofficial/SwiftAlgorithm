//
//  7562.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/6/24.
//

import Foundation
let n = Int(readLine()!)!
let dx = [-2, -1, 1, 2, 2, 1, -1, -2]
let dy = [1,2,2,1,-1,-2,-2,-1]
for _ in 0..<n {
    let m = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map {Int(String($0))!}
    let end = readLine()!.split(separator: " ").map {Int(String($0))!}
    let startx = start[0], starty = start[1]
    var visited = Array(repeating: Array(repeating: -1 , count: m), count: m)
    visited[starty][startx] = 0
    var queue = [(startx, starty)]
    var index = 0
    while index < queue.count   {
        let current = queue[index]
        for i in 0..<8 {
            let nextx = current.0 + dx[i]
            let nexty = current.1 + dy[i]
            if  0..<m ~= nextx  && 0..<m ~= nexty && visited[nexty][nextx] == -1 {
                queue.append((nextx,nexty))
                visited[nexty][nextx] = visited[current.1][current.0] + 1

            }
        }
        index += 1
    }
    print(visited[end[1]][end[0]])
}

