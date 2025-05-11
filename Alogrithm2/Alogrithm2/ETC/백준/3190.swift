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

let dx = [1,0,-1,0] // 방향 동남서북
let dy = [0,1,0,-1]
func is_valid(_ x: Int, _ y : Int) -> Bool {
    return (1...n ~= x) && (1...n ~= y)
}
var currentDir = 0 //0: 동, 1: 남, 2:서, 3: 북
var snake : [(Int,Int)] = [(1,1)]
var time = 0
while true {
    time += 1
    let head = snake.first!
    var (nx,ny) = (head.0 + dx[currentDir] ,head.1 + dy[currentDir])
    if !is_valid(nx, ny) || snake.contains(where: {$0 == (nx,ny)}) {
        break
    }
    snake.insert(((nx,ny)), at: 0)
    if maps[ny][nx] {
        maps[ny][nx] = false
    } else {
        snake.removeLast()
    }
    if let turn = turns[time] {
        switch turn {
        case "L":
            currentDir = ( currentDir + 3 ) % 4
        case "D":
            currentDir = (currentDir  + 1) % 4
        default:
            break
        }
    }
}

print(time)
