//
//  testC.swift
//  Alogrithm2
//
//  Created by Sunho on 11/10/24.
//

import Foundation
let nk = readLine()!.split(separator: " ").map{Int(String($0))!}, k = nk[1]
var abags = readLine()!.split(separator: " ").map{Int(String($0))!}
var bbags = readLine()!.split(separator: " ").map{Int(String($0))!}
var aSum = abags.reduce(0, +)
var bSum = bbags.reduce(0, +)
for i in 0..<k {
    if aSum > bSum {
        aSum -= abags.last!
        abags.removeLast()
    } else {
        bSum -= bbags.last!
        bbags.removeLast()
    }
}
print(max(aSum, bSum))
