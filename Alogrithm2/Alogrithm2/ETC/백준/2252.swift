//
//  2252.swift
//  Alogrithm2
//
//  Created by Sunho on 9/7/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{ Int(String($0))!}
var arr: [[Int]] = Array(repeating: [], count: nm[0] + 1)
var students = Array(repeating: 0 , count: nm[0] + 1)
var queue = Array<Int>()
var result = Array<Int>()
for _ in 0..<nm[1] {
    let ab = readLine()!.split(separator: " ").map{ Int(String($0))!}
    arr[ab[0]].append(ab[1])
    students[ab[1]] += 1
}
for i in 0...nm[0] {
    if students[i] == 0 {
        queue.append(i)
    }
}
var index = 0
while queue.count > index {
    var current = queue[index]
    index += 1
    result.append(current)
    for i in arr[current] {
        students[i] -= 1
        if students[i] == 0 {
            queue.append(i)
        }
    }
}
for i in result {
    print(i,terminator: " ")
}
