//
//  14502.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/24/24.
//

import Foundation

var virus = [(Int, Int)]() // (col,row)
var emptyPositions = [(Int, Int)]()
let nm = readLine()!.split(separator: " ").map {Int(String($0))!}, n = nm[0], m = nm[1]
var maps = [[Int]](repeating: [], count: n)
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    for  j in 0..<m {
        if input[j] == 2 {
            virus.append((j,i))
        } else if input[j] == 0 {
            emptyPositions.append((j,i))
        }
    }
    maps[i]  = input
}
var answer = 0
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
func spreadVirus(_ currentMap: [[Int]]) -> Int {
    var tempMap = maps
    var queue = virus
    var index = 0
    while index < queue.count {
        let current = queue[index]
        index += 1
        for i in 0..<4 {
            let nx = current.0 + dx[i]
            let ny = current.1 + dy[i]
            if 0..<m ~= nx, 0..<n ~= ny, tempMap[ny][nx] == 0 {
                tempMap[ny][nx] = 2
                queue.append((nx,ny))
            }
        }
    }
    return tempMap.flatMap{$0}.filter{$0 == 0}.count
}
func dfsWalls(_ depth: Int, _ start: Int) {
    if depth == 3 {
        let safeArea = spreadVirus(maps)
        answer = max(safeArea,answer)
        return
    }
    for i in start..<emptyPositions.count {
        let pos = emptyPositions[i]
        maps[pos.1][pos.0] = 1
        dfsWalls(depth + 1, i + 1)
        maps[pos.1][pos.0] = 0
    }
}
dfsWalls(0, 0)
print(answer)
