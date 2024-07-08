//
//  1325.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/8/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
var arr = Array(repeating: [Int](), count:  nm[0] + 1)
var visited = Array(repeating: false, count: nm[0] + 1)
for i in 0..<nm[1] {
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[ab[1]].append(ab[0])
}
//func dfs(start: Int ) {
//    visited[start] = true
//    for node in arr[start] {
//        if !visited[node] {
//            dfs(start: node)
//        }
//    }
//}
//var answer = [Int]()
//var maxcnt = 0
//for i in 1...nm[0] {
//    visited = Array(repeating: false, count: nm[0] + 1)
//    dfs(start: i)
//    let cnt = visited.filter {$0}.count
//    if cnt > maxcnt {
//        maxcnt = cnt
//        answer = [i]
//    } else if cnt == maxcnt {
//        answer.append(i)
//    }
//
//}
//
//print(answer.map {String($0)}.joined(separator: " "))
// 1트 실패: 시간초과. O(N제곱이라)그런듯. 시간제한이 5초인데 N의 범위는 10,000 M은 100,00000000이므로 10초걸리겠네? 그럼 줄여야해. -> BFS로 해보자.
func bfs(_ start: Int) -> Int {
    var queue = [start]
    visited[start] = true
    var cnt = 1
    var index = 0
    while index < queue.count {
        let node = queue[index]
        index += 1
        for dot in arr[node] {
            if !visited[dot] {
                visited[dot] = true
                queue.append(dot)
                cnt += 1
            }
        }
    }
    return cnt
}
var maxCount = 0
var result = [Int]()
for i in 1...nm[0] {
    visited = Array(repeating: false, count: nm[0] + 1)
    let count = bfs(i)
    if count > maxCount {
          maxCount = count
          result = [i]
      } else if count == maxCount {
          result.append(i)
      }

}

print(result.map { String($0) }.joined(separator: " "))
//2트도 실패 개같은거 뭐가문제야
