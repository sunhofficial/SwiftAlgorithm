//
//  14502.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/24/24.
//

import Foundation
typealias Position = (x: Int, y: Int)
struct Queue {
    var queue = [Position]()
    var index = 0
    var isEmpty: Bool {
        return queue.count - index == 0
    }
    init(queue: [Position] = [Position]()) {
        self.queue = queue
    }
    mutating func push(_ data: Position) {
        queue.append(data)}
    mutating func pop() -> Position{
        defer {
            index += 1
        }
        return queue[index]
    }
}
var virus = [Position]()
let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var maps = Array(repeating: [Int()], count: nm[0])
for i in 0..<nm[0] {
    var col = 0
    maps[i] = readLine()!.split(separator: " ").map {
        if String($0) == "2" {
            virus.append((col,i))
        }
        col += 1
        return Int(String($0))!
    }
}
func dfs(_ depth: Int) {
    if depth == 3 {
        bfs()
        return
    }
    for i in 0..<nm[0] {
        for j in 0..<nm[1] {
            if maps[i][j] == 0 {
                maps[i][j] = 1
                dfs(depth + 1)
                maps[i][j] = 0
            }
        }
    }

}
func isValid(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < nm[1] && y >= 0 && y < nm[0]
}
var result = 0
func bfs() {
    var queue = Queue(queue: virus)
    var temp = maps
    while !queue.isEmpty {
        let virusData = queue.pop()
        for i in 0..<4 {
            let nx = virusData.x + dx[i]
            let ny = virusData.y + dy[i]
            if isValid(nx, ny) && temp[ny][nx] == 0 {
                temp[ny][nx] = 2
                queue.push((nx, ny))
            }
        }
    }
    var cnt: Int = 0
    for i in 0..<nm[0] {
        for j in 0..<nm[1] {
            if temp[i][j] == 0 {
                cnt += 1
            }
        }
    }
    result = max(result, cnt)
}
dfs(0)
print(result)
//1트째 512ms걸림 개오래걸림 시간 -> DFS를 최적화 해보자.

