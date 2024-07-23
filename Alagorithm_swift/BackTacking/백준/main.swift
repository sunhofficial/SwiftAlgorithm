//
//  9663.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/23/24.
//

import Foundation
let n = Int(readLine()!)!
var answer = 0
var visited = Array(repeating: false, count: n  )
var board  = Array(repeating:  0, count: n)
func dfs(_ cnt: Int) {
    if cnt == n {
        answer += 1
        return
    }
    for i in 0..<n {
        if !visited[i] {
            board[cnt] = i
            if check(x: cnt) {
                visited[i] = true
                dfs(cnt + 1)
                visited[i] = false
            }
        }
    }

}
func check(x: Int) -> Bool {
    for i in 0..<x {
        if board[i] == board[x] {
            return false
        }
        if abs(board[i] - board[x]) == abs(i-x) {
            return false
        }
    }
    return true
}
dfs(0)
print(answer)
