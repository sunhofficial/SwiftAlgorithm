//
//  1744.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/8/24.
//

import Foundation
let n = Int(readLine()!)!
var arrs = [Int]()
for _ in 0..<n {
    arrs.append(Int(readLine()!)!)
}
arrs.sort()
var index = arrs.count - 1
var sum = 0
if arrs.count == 1 {
    print(arrs[0])
}else {
    while index > 0 {
        if arrs[index] * arrs[index - 1] >= arrs[index] + arrs[index - 1] {
            sum += arrs[index] * arrs[index - 1]
            index -= 2
        } else {
            if index == 1 {
                sum += (arrs[index] + arrs[index - 1])

            }
            else {
                sum += arrs[index]
               }
            index -= 1
        }
    }
    print(sum)
}
