//
//  16236.swift
//  Alogrithm2
//
//  Created by Sunho on 2/18/25.
//

import Foundation
let n = Int(readLine()!)!
var maps = [[Int]]()
var shark = (0,0)
for i in 0..<n {
    let arrs = readLine()!.split(separator: " ").map{Int(String($0))!}
    if arrs.contains(9) {
        let index = arrs.firstIndex(of: 9)!
        shark = (i,index)
    }
    maps.append(arrs)
    
}

let dy = [-1,0,1,0]
let dx = [0, -1,0,1]

var eatCnt = 0
func bfs() {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    visited[shark.0][shark.1] = true
    var queue = [(shark.0,shark.1,0)]
    var index = 0
    var minMove = Int.max
    var size = 2
    var fish = [(y:Int, x: Int)]()
    while queue.count > index {
        let current = queue[index]
        index += 1
        if current.2 > minMove {
            continue
        }
        if (1..<size).contains(maps[current.0][current.1]) {
            minMove = current.2
            fish.append((current.0,current.1))
        }
        for i in 0..<4 {
            let (nexty, nextx) = (current.0 + dy[i], current.1 + dx[i])
            
        }
    }
}
