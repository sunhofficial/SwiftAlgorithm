//
//  2467.swift
//  Alogrithm2
//
//  Created by Sunho on 9/2/24.
//

import Foundation
let n = Int(readLine()!)!
let acs = readLine()!.split(separator: " ").map {Int(String($0))!}
var sortacs = acs.sorted()
var start = 0
var end = n - 1
var temp = Int.max
var answer = (0,0)
while start < end {
    let mixinn = sortacs[start] + sortacs[end]
    if temp > abs(mixinn) {
        temp = abs(mixinn)
        answer = (sortacs[start], sortacs[end])
    }
    if mixinn > 0 {
        end -= 1
    } else if mixinn < 0 {
        start += 1
    } else {
        answer = (sortacs[start], sortacs[end])
        break
    }
    
}
    print(answer.0, answer.1)
