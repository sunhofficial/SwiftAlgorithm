//
//  4485.swift
//  Alogrithm2
//
//  Created by Sunho on 10/16/24.
//

import Foundation
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var ans = [String]()
var t = 1
while true {
    let n = Int(readLine()!)!
    if n == 0 {break} else {
        var arr = Array(repeating: [Int](), count: n)
        for i in 0..<n {
            arr[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
        }
        var queue = [(x:0, y: 0, cost: arr[0][0] )]
        var cost  = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        while !queue.isEmpty {
            let curr = queue.removeLast()
            let x = curr.x
            let y = curr.y
            visited[x][y] = true
            cost[x][y] = min(cost[x][y], curr.cost)
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx < 0 || nx>=n || ny<0 || ny>=n || visited[nx][ny] {continue}
                queue.append((nx,ny,cost[x][y] + arr[nx][ny]))
            }
            queue.sort(by: {$0.cost > $1.cost})
        }
        ans.append("Problem \(t): \(cost[n-1][n-1])")
        t += 1
        
    }
}
print(ans.joined(separator: "\n"))
