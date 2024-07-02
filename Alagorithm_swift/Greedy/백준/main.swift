//
//  11047.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/2/24.
//

import Foundation
let ab = readLine()!.split(separator: " ").map{Int($0)!},  n = ab[0], k = ab[1]
var coins: [Int] = []
for i in 0..<n {
    coins.append(Int(readLine()!)!)
}
var cnt = Int.max
var temp = k
var tempcnt = 0
for t in coins.reversed() {
    while temp % t == 0 {
        temp -= t
        tempcnt += 1
    }
//
//    if k % t != 0 {
//        break
//    } else {
//        temp = k % t
//        tempcnt += 1
//
//    }

}
