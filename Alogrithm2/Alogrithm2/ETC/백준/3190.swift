//
//  3190.swift
//  Alogrithm2
//
//  Created by Sunho on 1/31/25.
//

import Foundation
let n = Int(readLine()!)!
let k = Int(readLine()!)!
var maps = Array(repeating: Array(repeating: false, count: n + 1 ), count: n + 1)
for _ in 0..<k {
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}, a = ab[0], b = ab[1]
    maps[a][b]  = true
}
let l  = Int(readLine()!)!
var turns = [Int: String]()
for _ in 0..<l {
    let ab = readLine()!.split(separator: " "), a = ab[0], b = ab[1]
    turns[Int(a)!] = String(b)
}

// 방향 (동, 남, 서, 북)
let dir = [(0, 1), (1, 0), (0, -1), (-1, 0)]
func is_valid(_ x: Int, _ y : Int) -> Bool {
    return (1...n ~= x) && (1...n ~= y)
}
var cnt = 0
var dirIndex = 0 // 현재방향
var snake = [(Int,Int)]() //뱀의 위치
snake.append((1,1))
while true {
    cnt += 1
    let head = snake.first!
    let (nx, ny) = (head.0 + dir[dirIndex].0, head.1 + dir[dirIndex].1)
    guard is_valid(nx, ny) &&  !snake.contains(where: {$0 == (nx, ny)}) else {
        break
    }
    snake.insert((nx,ny), at: 0)
    if maps[nx][ny] {
        maps[nx][ny] = false
  
    } else {
        snake.removeLast()
    }
    if let turn = turns[cnt] {
        switch turn {
        case "L":
            dirIndex = (dirIndex + 3) % 4
        case "D":
            dirIndex = (dirIndex + 1) % 4
        default:
            break
        }
    }
    
}
print(cnt)
