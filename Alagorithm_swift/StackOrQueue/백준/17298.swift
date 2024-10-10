//
//  17298.swift
//  Alogrithm2
//
//  Created by Sunho on 10/8/24.
//

import Foundation
let n = Int(readLine()!)!
var aarrays = readLine()!.split(separator: " ").map{Int(String($0))!}
var stack = [[0,aarrays[0]]]
var answer = Array(repeating: "-1", count: n)
for i in 1..<aarrays.count {
    while !stack.isEmpty && aarrays[i] > stack.last![1] {
        answer[stack.removeLast()[0]] = "\(aarrays[i])"
    }
    stack.append([i,aarrays[i]])
}
print(answer.joined(separator: " "))
