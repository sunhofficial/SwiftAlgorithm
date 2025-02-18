//
//  12015.swift
//  Alogrithm2
//
//  Created by Sunho on 2/17/25.
//

import Foundation
let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var lis = [array.first!]
for i in 1..<n {
    if lis.last! < array[i] {
        lis.append(array[i])
        continue
    }
    var start = 0
    var end = lis.count
    while start <= end {
        let mid = (start + end) / 2
        if lis[mid] < array[i] {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    lis[start] = array[i]
}
print(lis.count)
