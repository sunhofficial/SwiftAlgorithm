//
//  17070.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/27/24.
//

import Foundation
//let n = Int(readLine()!)!
//var maps = Array(repeating: [Int()], count: n)
//for i in 0..<n {
//    maps[i] = readLine()!.split(separator: " ").map { Int($0)! }
//}
//enum Direction {
//    case horizontal
//    case vertical
//    case diagonal
//}
//
//var answer = 0
//func dfs(_ dir: Direction, _ x: Int, _ y: Int) {
//    if x == n - 1 && y == n - 1 {
//        answer += 1
//        return
//    }
//
//    switch dir {
//    case .horizontal:
//        if isValid(.horizontal, x, y) {
//            dfs(.horizontal, x + 1 , y)
//        }
//        if isValid(.diagonal, x , y ) {
//            dfs(.diagonal, x + 1 , y + 1)
//        }
//
//    case .vertical:
//        if isValid(.vertical, x , y) {
//            dfs(.vertical, x, y + 1)
//        }
//        if isValid(.diagonal, x, y) {
//            dfs(.diagonal, x + 1, y + 1)
//        }
//    case .diagonal:
//        if isValid(.horizontal, x, y) {
//               dfs(.horizontal, x + 1, y)
//           }
//           if isValid(.vertical, x, y ) {
//               dfs(.vertical, x, y + 1)
//           }
//           if isValid(.diagonal, x , y ) {
//               dfs(.diagonal, x + 1, y + 1)
//           }
//    }
//
//}
//func isValid(_ dir: Direction, _ x: Int, _ y: Int) -> Bool {
//    switch dir {
//    case .horizontal:
//        if x + 1 < n && maps[y][x + 1] == 0 {
//            return true
//        }
//    case .vertical:
//        if y + 1 < n && maps[y + 1][x ] == 0 {
//            return true
//        }
//    case .diagonal:
//        if x + 1 < n && y + 1 < n  && maps[y + 1][x + 1] == 0 && maps[y + 1][x] == 0 && maps[y][x+1] == 0 {
//            return true
//        }
//    }
//    return false
//}
//dfs(.horizontal, 1, 0)
//print(answer)
// DFS로 풀때는 시간이 200ms이상 나옴 그런데 풀이를 보니 이 문제는 DP로 풀때 더 빠르다고 한다.

let n = Int(readLine()!)!

var maps = Array(repeating: [Int()], count: n)
for i in 0..<n {
    maps[i] = readLine()!.split(separator: " ").map { Int($0)! }
}
var dp = [[[Int]]](repeating: Array(repeating: [0,0,0], count: n), count: n)
dp[0][1][0] = 1 //즉 처음에 가로로 하나 올려져잇으니 yx방향쪽으로 한가지있다.
// 마지막꺼 0 : 가로로 움직이겟다 1: 세로로 2: 대각선
for i in 0..<n{
    for j in 0..<n{
        if j + 1 < n && maps[i][j+1] == 0 {
            //가로로 움직일수있는 경우는 가로로 오거나 대각선으로 올때 가능하다.
            dp[i][j+1][0] += dp[i][j][0] + dp[i][j][2]
        }
        if i + 1 < n && maps[i + 1][j] == 0 {
            dp[i+1][j][1] += dp[i][j][1] + dp[i][j][2]
        }
        if i + 1 < n && j + 1 < n && maps[i][j+1] == 0 && maps[i+1][j+1] == 0 && maps[i+1][j] == 0 {
            dp[i+1][j+1][2] += dp[i][j][2] + dp[i][j][0] + dp[i][j][1]
        }
    }
}

print(dp[n-1][n-1].reduce(0, +))
