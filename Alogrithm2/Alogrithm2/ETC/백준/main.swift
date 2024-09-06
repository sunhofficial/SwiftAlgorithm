//
//  10830.swift
//  Alogrithm2
//
//  Created by Sunho on 9/6/24.
//

import Foundation
let nb = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nb[0], b = nb[1]
var matrix: [[Int]] = []
for i in 0..<n {
    matrix.append(readLine()!.split(separator: " ").map{Int($0)! % 1000})
}
func pow(matrix: [[Int]], k: Int) -> [[Int]] {
    if k == 1 {
        return matrix
    }
    if k % 2 != 0 {
        return multiply(matrix1: matrix, matrix2: pow(matrix: matrix, k: k-1))
    }
    let  half = pow(matrix: matrix, k: k/2)
    return multiply(matrix1: half, matrix2: half)
}
func multiply(matrix1: [[Int]], matrix2: [[Int]]) -> [[Int]] {
    let n = matrix1.count
    var answer = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                answer[i][j] += matrix1[i][k] * matrix2[k][j]
                answer[i][j] %= 1000
            }
        }
    }
    return answer
}
let answer = pow(matrix: matrix, k: b)
answer.forEach { row in
    row.forEach {print($0, terminator: " ")}
    print()
    
}
