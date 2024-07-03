//
//  13305.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/3/24.
//

import Foundation
let n = Int(readLine()!)!
let ds = readLine()!.split(separator: " " )
let ps = readLine()!.split(separator: " ")
var sum = 0
var passing = -1
for i in 0 ..< n {
    let currentP = Int(ps[i])!
    var currentSpot = 0
    if passing == i {
        continue
    }
    for j in i+1 ..< n {
        currentSpot += Int(ds[j - 1])!
        if currentP < Int(ps[j])! {
            passing = j
            continue
        } else {
            break
        }
    }
    sum += (currentSpot * currentP)
}
print(sum)
            
