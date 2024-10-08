//
//  2872.swift
//  Alogrithm2
//
//  Created by Sunho on 9/8/24.
//

import Foundation
let n = Int(readLine()!)!
var stacks = [Int]()
for _ in 0..<n {
    stacks.append(Int(readLine()!)!)
    
}
var maxBook = n
var sortedCount = 0
for i in stride(from: n-1 , through: 0, by: -1) {
    if stacks[i] == maxBook {
        sortedCount += 1
        maxBook -= 1
    }
}

let result = n - sortedCount
print(result)
