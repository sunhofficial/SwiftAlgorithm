//
//  14503.swift
//  Alogrithm2
//
//  Created by Sunho on 5/14/25.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
let rcd = readLine()!.split(separator: " ").map{Int(String($0))!}
var x = rcd[0], y = rcd[1], d = rcd[2]
var maps = [[Int]]()
for _ in 0..<n {
    maps.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
let dx = [-1,0,1,0]
let dy = [0,1,0,-1]
var answer = 0
while true {
    if maps[x][y] == 0 {
        maps[x][y] = 2
        answer += 1
    }
    var cleaned = false
    var newD  = d
    for _ in 0..<4 {
        newD = (newD + 3 ) % 4
        let nx = x + dx[newD]
        let ny = y + dy[newD]
        if 0..<n ~= nx, 0..<m ~= ny, maps[nx][ny] == 0 {
            x = nx
            y = ny
            d = newD
            cleaned = true
            break
        }
    }
    if !cleaned {
        let nx = x - dx[d]
        let ny = y - dy[d]
        if 0..<n ~= nx, 0..<m ~= ny, maps[nx][ny] != 1 {
            x = nx
            y = ny
        } else {
            break
        }
    }
}
//func bfs() {
//    var index  = 0
//    var queue = [Robot]()
//    queue.append(robotCurrent)
//    while queue.count > index {
//        let robot = queue[index]
//        index += 1
//        if maps[robot.x][robot.y] == 0 {
//            answer += 1
//            maps[robot.x][robot.y] = 2
//
//        }
//        let rotateResult = checkRotate(robot.x, robot.y, robot.direction)
//        if rotateResult == -1 {
//            //모든 자리가 막혀있음 2번의 경우.
//            let nx = robot.x - dx[robot.direction]
//            let ny = robot.y - dy[robot.direction]
//            if 0..<n ~= nx, 0..<m ~= ny, maps[nx][ny] != 1 {
//                queue.append(Robot(x: nx, y: ny, direction: robot.direction))
//                continue
//
//            } else {
//                break
//            }
//        }
//        let newDir = (robot.direction + 3 * rotateResult ) % 4
//        let nx = robot.x + dx[newDir]
//        let ny = robot.y + dy[newDir]
//
//        queue.append(Robot(x: nx, y: ny, direction: newDir))
//    }
//}
//
//func checkRotate(_ x: Int, _ y: Int, _ dir: Int) -> Int {
//    var rotateCount = 0
//    var newDir = dir
//    for _ in 0..<4 {
//        newDir = (newDir + 3) % 4
//        rotateCount += 1
//        let nx = x + dx[newDir]
//        let ny = y + dy[newDir]
//        if 0..<n ~= nx, 0..<m ~= ny, maps[nx][ny] == 0 {
//            return rotateCount
//        }
//    }
//    return -1
//}
//bfs()
print(answer)

