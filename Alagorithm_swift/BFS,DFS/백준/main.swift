//
//  1325.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/8/24.
//

import Foundation
//let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
//var arr = Array(repeating: [Int](), count:  nm[0] + 1)
//var visited = Array(repeating: false, count: nm[0] + 1)
//for i in 0..<nm[1] {
//    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
//    arr[ab[1]].append(ab[0])
//}
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
let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
var arr = Array(repeating: [Int](), count:  nm[0] + 1)
var cnts = Array(repeating: 0, count: nm[0] + 1)
var maxcount = 0
for i in 0..<nm[1] {
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[ab[1]].append(ab[0])
}
func bfs(_ start: Int) {
    var queue = [start]
    var visited = Array(repeating: false, count: nm[0] + 1)
    visited[start] = true
    var cnt = 0
    var index = 0
    while index < queue.count {
        let node = queue[index]
        index += 1
        for dot in arr[node] {
            if !visited[dot] {
                visited[dot] = true
                cnt += 1
                queue.append(dot)

            }
        }
    }
    cnts[start] = cnt
    maxcount = max(maxcount, cnt)
}

for i in 1...nm[0] {
    bfs(i)
}

print(cnts.enumerated().filter {$0.1 == maxcount}.sorted(by: {$0.0 < $1.0}).map{String($0.0)}.joined(separator: " "))
//3트만에 성공: 답안참고 이전의 내 코드와 비슷하다. 두가지 모두 시간복잡도는 O(N * (N+M))이다. 그렇다면 왜 이전꺼는 불통과고 이번꺼는 통과일까? 이전의 코드는 visited를 매번 초기화하고 maxcnt와 비교를 하여 result배열에 추가하기에 추가적인 시간이 소요된다. 새로운 코든 visited를 지역변수로 안에서 생성해주고 cnts배열과 maxcount에 bfs의   결과값을 저장하고 이후 print에서 한번에 순회해서 사용하기에 더 효율적이라 통과하는 것 같다.
