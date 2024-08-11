//
//  1389.swift
//  Alogrithm2
//
//  Created by Sunho on 8/10/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map { Int(String($0))!}, n = nm[0], m = nm[1]
var realtions = Array(repeating: [Int](), count: n + 1 )
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))!}
    realtions[ab[0]].append(ab[1])
    realtions[ab[1]].append(ab[0])
    
}

func bfs(start : Int) -> Int {
    var queue = [Int]()
    var distances = Array(repeating: -1 , count: n + 1)
    queue.append(start)
    var index = 0
    distances[start] = 0
    while index < queue.count {
        let cur = queue[index]
        for negibor in realtions[cur] {
            if distances[negibor] == -1 {
                distances[negibor ] = distances[cur] + 1
                queue.append(negibor)
            }
        }
        index += 1
    }
    return distances.reduce(0, +)
}
var minVal = Int.max
var answer = 0
for i in 1...n {
    let bfsval = bfs(start: i)
    if  bfsval < minVal {
        minVal = bfsval
        answer = i
        
    }
}
print(answer)
