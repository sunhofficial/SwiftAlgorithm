//
//  16236.swift
//  Alogrithm2
//
//  Created by Sunho on 12/27/24.
//

import Foundation
let n = Int(readLine()!)!
var arr = [[Int]]()
var spot: (Int,Int)

for i in 0..<n {
    let lines = readLine()!.split(separator: " ").map{Int(String($0))!}
    if let index = lines.firstIndex(where: {$0 == 9}) {
        spot = (i,index)
    }
    arr.append(lines)
}
//아기상어는 크기가 2임. 크기가 같은건 지나갈수 있다. 작은것들만 먹을수 있다.
var size = 2
var eatCount = 0
func bfs() -> (Int, Int, Int)? {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    visited[spot.0][spot.1] = true
    let dy: [Int] = [-1,0,1,0]
    let dx: [Int] = [0,-1,0,1]
    var queue: [(Int,Int,Int)] = [(spot.0, spot.1, 0)] //y,x distance
    var candidates: [(Int, Int, Int)] = []
    var minDistance = Int.max
    var index = 0
    while queue.count > index {
        let (y, x, distance) = queue[index]
        index += 1
        for i in 0..<4 {
            let ny = y + dy[i]
           let nx = x + dx[i]
           let nextDistance = distance + 1
            if 0..<n ~= ny && 0..<n ~= nx  && !visited[ny][nx]{
                visited[ny][nx] = true
                if arr[ny][nx] > 0 && arr[ny][nx] < size {
                    minDistance = nextDistance
                    candidates.append((ny, nx, nextDistance))
                } else if arr[ny][nx] == 0 ||  arr[ny][nx] == size  {
                    queue.append((ny, nx, nextDistance))
                }
            }
        }
    }
    return candidates.sorted {
        $0.2 < $1.2 || ($0.2 == $1.2 && ($0.0 < $1.0 || ($0.0 == $1.0 && $0.1 < $1.1)))
    }.first
}
while true {
    if let fish = bfs() {
        let (fishY, fishX, distance) = fish
    }
}
