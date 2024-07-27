//
//  17070.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/27/24.
//

import Foundation
let n = Int(readLine()!)!
var maps = Array(repeating: [Int()], count: n)
for i in 0..<n {
    maps[i] = readLine()!.split(separator: " ").map { Int($0)! }
}
enum Direction {
    case horizontal
    case vertical
    case diagonal
}

var answer = 0
func dfs(_ dir: Direction, _ x: Int, _ y: Int) {
    if x == n - 1 && y == n - 1 {
        answer += 1
        return
    }

    switch dir {
    case .horizontal:
        if isValid(.horizontal, x, y) {
            dfs(.horizontal, x + 1 , y)
        }
        if isValid(.diagonal, x , y ) {
            dfs(.diagonal, x + 1 , y + 1)
        }

    case .vertical:
        if isValid(.vertical, x , y) {
            dfs(.vertical, x, y + 1)
        }
        if isValid(.diagonal, x, y) {
            dfs(.diagonal, x + 1, y + 1)
        }
    case .diagonal:
        if isValid(.horizontal, x, y) {
               dfs(.horizontal, x + 1, y)
           }
           if isValid(.vertical, x, y ) {
               dfs(.vertical, x, y + 1)
           }
           if isValid(.diagonal, x , y ) {
               dfs(.diagonal, x + 1, y + 1)
           }
    }

}
func isValid(_ dir: Direction, _ x: Int, _ y: Int) -> Bool {
    switch dir {
    case .horizontal:
        if x + 1 < n && maps[y][x + 1] == 0 {
            return true
        }
    case .vertical:
        if y + 1 < n && maps[y + 1][x ] == 0 {
            return true
        }
    case .diagonal:
        if x + 1 < n && y + 1 < n  && maps[y + 1][x + 1] == 0 && maps[y + 1][x] == 0 && maps[y][x+1] == 0 {
            return true
        }
    }
    return false
}
dfs(.horizontal, 1, 0)
print(answer)
