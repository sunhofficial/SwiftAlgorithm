//
//  9205.swift
//  Alogrithm2
//
//  Created by Sunho on 2/24/25.
//

import Foundation
let t = Int(readLine()!)!
for i in 0..<t {
    let n = Int(readLine()!)!
    var points = [(Int,Int)]()

    for k in 0..<n + 2 {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        points.append((input[0],input[1]))
    }
    let home = points[0]
    let rock = points.last!
    var queue = [home]
    var visited = Array(repeating: false, count: n + 2)
    visited[0] = true
    var canGo = false
    var index = 0
    while queue.count  > index {
        let (cx,cy) = queue[index]
        index += 1
        if abs(cx - rock.0) + abs(cy  - rock.1) <= 1000 {
            canGo = true
            break
        }
        for i in 1..<points.count {
            if !visited[i] {
                let (nx,ny) = points[i]
                if abs(cx - nx) + abs(cy - ny) <= 1000 {
                    visited[i] = true
                    queue.append((nx,ny))
                }
            }
        }
    }
    print(canGo ? "happy" : "sad")

}
