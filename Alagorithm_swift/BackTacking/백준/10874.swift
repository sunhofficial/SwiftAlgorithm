//
//  10974.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/20/24.
//

import Foundation
//let n = Int(readLine()!)!
//var arr = Array(1...n)
//func dfs(_ k: Int) {
//    if k == n {
//        print(arr.map { String($0)}.joined(separator: " "))
//        return
//    }
//    for i in k..<n {
//        if arr[i] > arr[k] {
//            arr.swapAt(k, i)
//            dfs(k+1)
//            arr.swapAt(k, i)
//        }
//    }
//}
//dfs(0)
let n = Int(readLine()!)!
var answer = ""
var visited = Array(repeating: false, count: n)
func dfs(_ ans: String , _ cnt: Int) {
    if cnt == n {
        answer += ans + "\n"
        return
    }
    for i in 0..<n where !visited[i] {
        visited[i] = true
        dfs(ans + "\(i + 1)", cnt + 1)
        visited[i] = false
    }
}
dfs("", 0)
print(answer)
