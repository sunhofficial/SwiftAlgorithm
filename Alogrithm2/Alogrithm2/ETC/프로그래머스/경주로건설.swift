//
//  main.swift
//  Alogrithm2
//
//  Created by Sunho on 2/4/25.
//

import Foundation
//이전꺼랑 비교햇을때 다를때만 모서리 처리해서 600임.
enum Direction: Int {
    case up
    case down
    case right
    case left
}
struct Node {
    let x: Int
    let y: Int
    let dir: Direction
    let cost: Int
    
}
func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    let directions: [Direction: (dx: Int, dy: Int)] = [
         .down: (1, 0), .up: (-1, 0), .right: (0, 1), .left: (0, -1)
     ]
    var queue = [Node]()
    queue.append(Node(x: 0, y: 0, dir: .down, cost:  0))
    queue.append(Node(x: 0, y: 0, dir: .right, cost:  0))
    var dp = Array(repeating: Array(repeating: Array(repeating: Int.max, count: 4), count: n), count: n)
    dp[0][0][Direction.right.rawValue] = 0
    dp[0][0][Direction.down.rawValue] = 0
    var index = 0
    while index < queue.count {
        let cur = queue[index]
        index += 1
        for (dir,move) in directions {
            let nx = cur.x + move.dx
            let ny = cur.y + move.dy
            if 0..<n ~= nx && 0..<n ~= ny && board[nx][ny] == 0{
                let newCost = cur.cost + (cur.dir == dir ? 100 : 600)
                if newCost < dp[nx][ny][dir.rawValue] {
                    dp[nx][ny][dir.rawValue] = newCost
                    queue.append(Node(x: nx, y: ny, dir: dir, cost: newCost))
                }
            } else {
                continue
            }
        }
    }
    return dp[n-1][n-1].min()!
}
