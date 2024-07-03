//
//  13305.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/3/24.
//

import Foundation
let n = Int(readLine()!)!
let ds = readLine()!.split(separator: " " ).map{Int(String($0))!}
let ps = readLine()!.split(separator: " ").map{Int(String($0))!}
var sum = 0
var min = ps[0]
//var passing = -1
//for i in 0 ..< ps.count {
//    let currentP = Int(ps[i])!
//    var currentSpot = 0
//    if passing == i {
//        continue
//    }
//    for j in i+1 ..< ps.count {
//        currentSpot += Int(ds[j - 1])!
//        if currentP < Int(ps[j])! {
//            passing = j
//            continue
//        } else {
//            break
//        }
//    }
//
//    sum += (currentSpot * currentP)
//    print(sum)
//}
//print(sum)
// 시간복잡도가 O(n제곱이라) 부분성공한거 같다.

for i in 0 ..< n - 1 {
    if ps[i] < min {
        min = ps[i]
    }
    sum += min * ds[i]
}
print(sum)
