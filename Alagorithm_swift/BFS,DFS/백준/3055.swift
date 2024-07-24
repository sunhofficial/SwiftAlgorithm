//
//  3055.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/24/24.
//

import Foundation
let reads = readLine()!.split(separator: " ").map {Int(String($0))!}
var maps = Array(repeating: [String()], count: reads[0])
var startingPoint = (0,0)
var destiationPoint = (0,0)
var visited = Array(repeating: Array(repeating: false, count: reads[1]), count: reads[0])
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
typealias Position = (x: Int, y: Int)
struct Queue {
    var queue = [Position]()
    var index = 0

    var isEmpty: Bool {
        return queue.count - index == 0 ? true : false
    }

    mutating func push(_ p: Position) {
        queue.append(p)
    }

    mutating func pop() -> Position {
        defer {
            index += 1
        }
        return queue[index]
    }
}
func isValid(_ x: Int, _ y: Int ) -> Bool {
    return x >= 0 && x < reads[1] && y >= 0 && y < reads[0]
}
for i in 0..<reads[0] {
    maps[i] = readLine()!.map {String($0)}
}
var queue = Queue()
var waterQueue = Queue()
func bfs() {
    var time = 0
    while !queue.isEmpty {
        time += 1
        var temp = Queue()
        while !waterQueue.isEmpty {
            let water = waterQueue.pop()
            for i in 0..<4 {
                let ny = water.y + dy[i]
                let nx = water.x + dx[i]
                if isValid(nx, ny) && maps[ny][nx] == "." {
                    maps[ny][nx] = "*"
                    temp.push((nx, ny))
                }
            }
        }
        waterQueue = temp
        temp = Queue()
        //이렇게 따로 할당해주는 이유? 물이 먼저 전파되고 나서 그 후에 고슴도치가 이동해야한다. 그래야 물이 갈지안갈지를 알 수있기에. 그렇다고 temp.push가 아닌 waterQueue.push를 통해서 해버리면 물이 전부다 전파되고 난후에 고슴도치를 따로 하기에 원하는 것이 아니다. 한번에 하나씩 비교를 해야하기에 이렇게 끝나고 나서야 waterQueue에 넣어준다.
        while !queue.isEmpty {
            let p = queue.pop()
            for i in 0..<4 {
                let ny = p.y + dy[i]
                let nx = p.x + dx[i]
                if isValid(nx, ny) && !visited[ny][nx] {
                    if maps[ny][nx] == "D" {
                        print(time)
                        return
                    } else if maps[ny][nx] == "." {
                        temp.push((nx,ny))
                        visited[ny][nx] = true
                    }
                }
            }
        }
        queue = temp
    }
    print("KAKTUS")
}
for y in 0..<reads[0] {
    for x in 0..<reads[1] {
        if maps[y][x] == "S"{
            queue.push((x,y))

        }else if maps[y][x] == "*" {
            waterQueue.push((x,y))
        }
    }
}
bfs()
// 큐를 세개를 써서 하는점이 매우 흥미로웠지만 생각해내지 못했던 내 자신이 부끄러웠던 문제.
