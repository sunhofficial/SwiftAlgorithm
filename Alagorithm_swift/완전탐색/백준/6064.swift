//
//  6064.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/26/24.
//
import Foundation

func findYear(m: Int, n: Int, x: Int, y: Int) -> Int {
    // x를 기준으로 m씩 증가시키면서 조건을 만족하는 year를 찾음
    var year = x
    while year <= m * n {
        if (year - 1) % n + 1 == y {
            return year
        }
        year += m
    }
    return -1
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = inputs[0], n = inputs[1], x = inputs[2], y = inputs[3]
    print(findYear(m: m, n: n, x: x, y: y))
}
