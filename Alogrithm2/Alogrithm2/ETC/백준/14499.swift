//
//  14499.swift
//  Alogrithm2
//
//  Created by Sunho on 5/12/25.
//

import Foundation
let nmxyk = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nmxyk[0], m = nmxyk[1], x = nmxyk[2], y = nmxyk[3], k = nmxyk[4]
var map = [[Int]]()
for _ in 0..<n{
    map.append(readLine()!.split(separator: " ").map{Int($0)!})
}

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
var dice = [0,0,0,0,0,0]
let dx = [0,0,-1,1] //동서남북
let dy = [1,-1,0,0]
var (currentX, currentY) = (x,y)
for cmd in commands {
    let nx = currentX + dx[cmd - 1]
    let ny = currentY + dy[cmd - 1]
    if !(0..<n ~= nx && 0..<m ~= ny) {
        continue
    }
    currentX = nx
    currentY = ny
    rollDice(direction: cmd)
    if map[currentX][currentY] == 0 {
        map[currentX][currentY] = dice[5]
    } else {
        dice[5] = map[currentX][currentY]
        map[currentX][currentY] = 0
    }
    print(dice[0])
    
}

func rollDice(direction:Int) {
    let temp = dice
    switch direction {
    case 1: //동
        dice[0] = temp[3]
        dice[2] = temp[0]
        dice[3] = temp[5]
        dice[5] = temp[2]
    case 2:
        dice[0] = temp[2]
        dice[2] = temp[5]
        dice[3] = temp[0]
        dice[5] = temp[3]
    case 3:
        dice[0] = temp[4]
        dice[1] = temp[0]
        dice[4] = temp[5]
        dice[5] = temp[1]
    case 4:
        dice[0] = temp[1]
        dice[1] = temp[5]
        dice[4] = temp[0]
        dice[5] = temp[4]
    default:
        break
        
        
    }
}
