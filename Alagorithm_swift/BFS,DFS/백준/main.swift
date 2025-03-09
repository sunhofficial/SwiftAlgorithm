//
//  5427.swift
//  Alogrithm2
//
//  Created by Sunho on 3/9/25.
//

import Foundation
let n = Int(readLine()!)!
var dir = [(0,1),(0,-1),(1,0),(-1,0)]
for _ in 0..<n {
    let wh = readLine()!.split(separator: " ").map{Int(String($0))!}, w = wh[0], h = wh[1]
    var map = [[Character]]()
    var fireQueue = [(Int, Int)]()
    var personQueue = [(Int, Int)]()
    var fireTime = Array(repeating: Array(repeating: -1, count: w), count: h)
    var personTime = Array(repeating: Array(repeating: -1, count: w), count: h)

    for i in 0..<h {
        let row = Array(readLine()!)
        map.append(row)
        
        for j in 0..<w {
            if row[j] == "@" {
                personQueue.append((i, j))
                personTime[i][j] = 0
            } else if row[j] == "*" {
                fireQueue.append((i, j))
                fireTime[i][j] = 0
            }
        }
    }
    var fireIndex = 0
    while fireIndex < fireQueue.count {
        let (x,y) = fireQueue[fireIndex]
        fireIndex += 1
        for (dx,dy) in dir {
            let nx = x + dx, ny = y + dy
            if 0..<h ~= nx && 0..<w ~= ny && map[nx][ny] != "#" && fireTime[nx][ny] == -1 {
                fireTime[nx][ny] = fireTime[x][y] + 1
                fireQueue.append((nx,ny))
            }
        }
    }
    var personIndex = 0
    var escaped = false
    while personIndex < personQueue.count {
        let (x,y) = personQueue[personIndex]
        personIndex += 1
        if x == 0 || x == h-1 || y == 0 || y == w-1 {
            print(personTime[x][y] + 1)
            escaped = true
            break
        }
        for (dx,dy) in dir {
            let nx = x + dx, ny = y + dy
            if 0..<h ~= nx && 0..<w ~= ny && map[nx][ny] == "." && personTime[nx][ny] == -1 {
                if fireTime[nx][ny] == -1 || personTime[x][y] + 1 < fireTime[nx][ny] {
                    personTime[nx][ny] = personTime[x][y] + 1
                    personQueue.append((nx,ny))
                }
            }
        }
    }
    if !escaped {
        print("IMPOSSIBLE")
    }
}
