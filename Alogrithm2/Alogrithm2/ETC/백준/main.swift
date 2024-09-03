//
//  2239.swift
//  Alogrithm2
//
//  Created by Sunho on 9/3/24.
//

import Foundation
var arrs = [[Int]]()
for  _ in 0..<9 {
    arrs.append(readLine()!.map{Int(String($0))!})
}
var visited = Array(repeating: false, count: 10)
func isValid(_ row: Int, _ col: Int, _ num: Int) -> Bool {
    for i in 0..<9 {
        if arrs[row][i] == num {return false}
    }
    for i in 0..<9 {
        if arrs[i][col] == num {return false}
    }
    let startRow = (row / 3) * 3
    let startcol = (col / 3) * 3
    for i in 0..<3 {
        for j in 0..<3 {
            if arrs[startRow + i][startcol + j] == num {
                return false
            }
        }
    }
    return true
}
func dfs(_ row: Int, _ col: Int) -> Bool {
    if row == 9 {
        return true
    }
    let nextRow = col == 8 ? row + 1 : row
    let nextCol = col == 8 ? 0 : col + 1

    if arrs[row][col] != 0 {
        return dfs(nextRow, nextCol)
    }
    for num in 1...9 {
        if isValid(row, col, num) {
            arrs[row][col] = num
            if dfs(nextRow,nextCol) {
                return true
            }
            arrs[row][col] = 0
        }
    }
    return false
}
dfs(0, 0)

for row in 0..<9 {
    print(arrs[row].map { String($0) }.joined())
}
