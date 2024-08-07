//
//  2493.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/7/24.
//

import Foundation
let n = Int(readLine()!)!
var tops = readLine()!.split(separator: " ").map{Int(String($0))!}
var stacks = [Int]()
var results   = Array(repeating: 0, count: n)
for i in (0..<n).reversed() {
    while !stacks.isEmpty && tops[i] > tops[stacks.last!] {
        let poped = stacks.popLast()!
        results[poped] = i + 1
    }
    stacks.append(i)
}
print(results.map{ String($0)}.joined(separator: " "))
