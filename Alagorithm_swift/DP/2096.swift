//
//  File.swift
//  Alogrithm2
//
//  Created by Sunho on 1/21/25.
//

import Foundation
let n = Int(readLine()!)!
var num = [[Int]]()
for _ in 0..<n {
    num.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
var maxDp = num.last!
var minDp = num.last!
for row in num.dropLast().reversed() {
    var maxTemp = [0,0,0]
    var minTemp = [0,0,0]
    maxTemp[0] = row[0] + max(maxDp[0], maxDp[1])
    maxTemp[1] = row[1] + maxDp.max()!
    maxTemp[2]  = row[2] + max(maxDp[1],maxDp[2])
    maxDp = maxTemp
    minTemp[0] = row[0] + min(minDp[0], minDp[1])
    minTemp[1] = row[1] + minDp.min()!
    minTemp[2] = row[2] + min(minDp[1], minDp[2])
    minDp = minTemp
}
print(maxDp.max()!, minDp.min()!)
