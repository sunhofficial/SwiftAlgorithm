//
//  1080.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/5/24.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var amaps = [[Int]]()
var bmaps = [[Int]]()
for _ in 0..<n{
    amaps.append(readLine()!.map { Int(String($0))!})
}
for _ in 0..<n {
    bmaps.append(readLine()!.map {Int(String($0))!})
}
var cnt = 0
for r in 0..<n {
    for c in 0..<m {
        if amaps[r][c] != bmaps[r][c] {
            trade(r, c)
            cnt += 1
        }
    }
}
if amaps == bmaps {
    print(cnt)
} else {print(-1)}
extension Int {
    mutating func toggle() {
        switch self {
        case 0:
            self = 1
            return
        case 1:
            self = 0
            return
        default: return
        }
    }
}
extension Array where Element == [Int] {
    static func ==(lhs: [[Int]], rhs: [[Int]]) -> Bool {
        for i in 0..<n {
            for j in 0..<m {
                if lhs[i][j] != rhs[i][j] {return false}
            }
        }
        return true
    }
}
func trade(_ r: Int, _ c: Int) {
    guard r + 2 < n && c + 2 < m else {return}
    for i in r..<(r+3) {
        for j in c..<(c+3) {
            amaps[i][j].toggle()
        }
    }
}
