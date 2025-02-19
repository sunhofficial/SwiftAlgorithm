//
//  2473.swift
//  Alogrithm2
//
//  Created by Sunho on 2/18/25.
//

import Foundation
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()
var answer = (0,0,0)
var closeZero = 10_000_000_000
for i in 0..<n-2 {
    var start = i + 1
    var end = n - 1
    while start < end {
        let sum = arr[i] + arr[start] + arr[end]
        if abs(sum) < closeZero {
            closeZero = abs(sum)
            answer = (arr[i], arr[start], arr[end])
        }
        if sum == 0 {
            break
        } else if sum > 0 {
            end -= 1
        } else {
            start += 1
        }
    }
}
print("\(answer.0) \(answer.1) \(answer.2)")
