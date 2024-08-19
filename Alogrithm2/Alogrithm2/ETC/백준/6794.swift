//
//  6794.swift
//  Alogrithm2
//
//  Created by Sunho on 8/19/24.
//

import Foundation
let n = Int(readLine()!)!
var cnt = 0
if n <= 5 {
    cnt = 1
}
var sets = Set<Int>()
for i in 1...5 {
    for j in i...5 {
        if i + j == n {cnt += 1}
    }
}
print(cnt)
