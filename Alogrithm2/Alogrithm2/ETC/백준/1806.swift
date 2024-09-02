//
//  1806.swift
//  Alogrithm2
//
//  Created by Sunho on 8/30/24.
//

import Foundation
let ns = readLine()!.split(separator: " ").map{Int(String($0))!}
let nums = readLine()!.split(separator: " ").map{Int(String($0))!}
var temp = ns[0]
var start = 0
var end = 0
var sum = 0
var answer = ns[0] + 1
while start <= end && end < ns[0] {
    if sum < ns[1] {
        sum += nums[end]
        end += 1
    } else {
        answer = min(answer, end - start)
        sum -= nums[start]
        start += 1
    }
}

print(answer == ns[0] + 1 ? 0 : answer)
